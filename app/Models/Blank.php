<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

#[AllowDynamicProperties]

class Blank extends Model {
    public $id = null;
    private $table_name = null;
    private $initial_values = array();
    private $associated_results = array();
    private $referring_results = array();

    // Constructor to create a blank object. Pass in an ID to populate values for the matching id row in the DB
    public function __construct($initial_table = null,$initial_id = null,$include_associated=false,$include_referrals=false,$sort_by=null) {
            $this->table_name = trim(strtolower($initial_table));
            $this->id = (int)$initial_id;
            return $this->set_values_by_id((int)$initial_id,$include_associated,$include_referrals,$sort_by);
    }
    
    //Pass in an id to populate values for this object with the matching row in the DB
    public function set_values_by_id($base_id,$include_associated=false,$include_referrals=false,$sort_by=false) {
        
        $tables = get_set_cache('allowed_blank_tables',"array_diff(DB::getSchemaBuilder()->getTableListing(),TABLESNONOBJECT);",CACHETIMEOUTS["SCHEMADATA"]);
        if(!in_array($this->table_name,$tables)) {
            $this->table_name = null;
            $this->id = null;
            return false;
        }

        $schema = get_set_cache('column_listing_' . $this->table_name,"DB::getSchemaBuilder()->getColumnListing('" . $this->table_name . "');",CACHETIMEOUTS["SCHEMADATA"]);
        $query = DB::table($this->table_name);

        $query->where($this->table_name . '.id','=',(int)$base_id);
        if(!in_array($this->table_name,TABLESNOGROUPNEEDED) && !user_has_role(ROLEIDS["ADMIN"]))
            $query->where(function ($query) { $query->whereIn($this->table_name . '.' . 'groups_id',session('user_groups_list'))->orWhereNull($this->table_name . '.' . 'groups_id'); });
        elseif($this->table_name == 'groups' && !user_has_role(ROLEIDS["ADMIN"]))
            $query->where(function ($query) { $query->whereIn($this->table_name . '.' . 'id',session('user_groups_list')); });

        foreach($schema as $this_field) {
            $this->set_value($this_field,null);
            $query->addSelect($this->table_name . '.' . $this_field . ' AS ' . $this_field);
            
            if($include_associated && str_ends_with($this_field,"_id") && in_array(substr($this_field,0,-3),explode(",",$include_associated))) {
                $associated_table = substr($this_field,0,-3);
                $query->join($associated_table,$this->table_name . "." . $this_field,'=',$associated_table . '.id');
                $schema_join = get_set_cache('column_listing_' . $associated_table,"DB::getSchemaBuilder()->getColumnListing('" . $associated_table . "');",CACHETIMEOUTS["SCHEMADATA"]);
                foreach($schema_join as $this_field_join) {
                    $this->associated_results[$associated_table][$this_field_join] = null;
                    $query->addSelect($associated_table . '.' . $this_field_join . ' AS ASSOC^' . $associated_table . '^' . $this_field_join);
                    if(!in_array($associated_table,TABLESNOGROUPNEEDED) && !user_has_role(ROLEIDS["ADMIN"]))
                        $query->where(function ($query) { $query->whereIn($associated_table . '.' . 'groups_id',session('user_groups_list'))->orWhereNull($associated_table . '.' . 'groups_id'); });
                    elseif($associated_table == 'groups' && !user_has_role(ROLEIDS["ADMIN"]))
                        $query->where(function ($query) { $query->whereIn($associated_table . '.' . 'id',session('user_groups_list')); });
                }
            }
        }
        
        if($include_referrals) {
            foreach(explode(",",$include_referrals) as $this_referral) {
                $query->leftJoin($this_referral,$this->table_name . ".id",'=',$this_referral . '.' . $this->table_name . '_id');
                $schema_join = get_set_cache('column_listing_' . $this_referral,"DB::getSchemaBuilder()->getColumnListing('" . $this_referral . "');",CACHETIMEOUTS["SCHEMADATA"]);
                foreach($schema_join as $this_field_join) {
                    if($base_id == null || !is_int($base_id) || (int)$base_id < 0)
                        $this->referring_results[$this_referral]['0'][$this_field_join] = null;
                    $query->addSelect($this_referral . '.' . $this_field_join . ' AS REF^' . $this_referral . '^' . $this_field_join);
                    if(!in_array($this_referral,TABLESNOGROUPNEEDED) && !user_has_role(ROLEIDS["ADMIN"]))
                        $query->where(function ($query) { $query->whereIn($this_referral . '.' . 'groups_id',session('user_groups_list'))->orWhereNull($this_referral . '.' . 'groups_id'); });
                    elseif($this_referral == 'groups' && !user_has_role(ROLEIDS["ADMIN"]))
                        $query->where(function ($query) { $query->whereIn($this_referral . '.' . 'id',session('user_groups_list')); });
                }
            }
        }

        if($base_id == null || !is_int($base_id) || (int)$base_id < 0)
            return true;

        if($sort_by)
            $query->orderByRaw($sort_by);

        if($include_referrals) {
            $db_objs = $query->get();
            $db_obj = $db_objs[0];
            foreach($db_objs as $this_referral) {
                foreach($this_referral as $key => $val) {
                    if(str_starts_with($key,'REF^')) {
                        $ref_row = explode("^",$key);
                        $row_name = "REF^" . $ref_row[1] . "^id";
                        $this_id = $this_referral->$row_name;
                        $this->referring_results[$ref_row[1]][$this_id][$ref_row[2]] = $val;
                    }
                }
            }
        } else
            $db_obj = $query->first();

        if(isset($db_obj->id) && (int)$db_obj->id === $base_id) {
            foreach($db_obj as $key => $value) {
                $this->$key = $value;
                if(!str_starts_with($key,'ASSOC^') && !str_starts_with($key,'REF^'))
                    $this->initial_values[$key] = $value;
                elseif(str_starts_with($key,'ASSOC^')) {
                    $assoc_row = explode("^",$key);
                    $this->associated_results[$assoc_row[1]][$assoc_row[2]] = $value;
                }
            }
            return true;
        } else {
            $this->table_name = null;
            $this->id = null;
            return false;
        }
        
        return false;
    }

    public function get_value($val_name) {
        if(isset($this->$val_name))
            return $this->$val_name;
    
        return false;
    }
    
    public function get_assoc_value($assoc_table=null,$assoc_field=null) {
        
        $assoc_values = $this->associated_results;
        
        if($assoc_table && isset($assoc_values[$assoc_table]))
            $assoc_values = $assoc_values[$assoc_table];
        
        if($assoc_field && isset($assoc_values[$assoc_field]))
            $assoc_values = $assoc_values[$assoc_field];
            
        return $assoc_values;

    }

    public function get_ref_values($ref_table = null,$ref_id = null,$ref_field = null) {
        $ref_values = $this->referring_results;
        
        if($ref_table)
            $ref_values = $ref_values[$ref_table];

        if($ref_id)
            $ref_values = $ref_values[$ref_id];
        
        if($ref_field)
            $ref_values = $ref_values[$ref_field];

        return $ref_values;
    }

    public function get_all($limit_by=null,$sort_by=null,$include_associated=false,$include_referrals=false) {
        if($this->table_name == null)
            return false;

        $all_objects = array();

        $query = DB::table($this->table_name);
        $query->select('id');

        if($limit_by != null)
            $query->whereRaw($limit_by);
        if($sort_by != null)
            $query->orderByRaw($sort_by);

        if(!in_array($this->table_name,TABLESNOGROUPNEEDED) && !user_has_role(ROLEIDS["ADMIN"]))
            $query->where(function ($query) { $query->whereIn('groups_id',session('user_groups_list'))->orWhereNull('groups_id'); });

        $object_ids = $query->get();

        foreach($object_ids as $this_id) {
            switch($this->table_name) {
                case 'leaderboard':
                    $tmp = new Leaderboard($this_id->id,$include_associated,$include_referrals);
                break;
                default:
                    $tmp = new Blank($this->table_name,$this_id->id,$include_associated,$include_referrals);
            }
            
            if($tmp->id == $this_id->id)  {
                array_push($all_objects,$tmp);
            }
        }

        return $all_objects;
        
    }
    
    public function set_value($val_name,$val_value) {
            $this->$val_name = $val_value;
    }
    
    public function add_note($note_text,$date_override=null) {
        $user_id = 1;
        $new_note = new Blank('notes');
        $new_note->set_value('user_id',$user_id);
        $new_note->set_value('object_type',$this->table_name);
        $new_note->set_value('object_identifier',$this->id);
        $new_note->set_value('note_text',$note_text);
        if($date_override != null)
            $new_note->set_value('date',$date_override);
        $new_note->save();
    }
    
    public function get_fk_values($fk_field,$return_columns) {
        $fk_id = $this->get_value($fk_field);
        if(!str_ends_with($fk_field,"_id") || !(int)$fk_id)
            return false;
        
        $fk_obj = new Blank(substr($fk_field, 0, -3),$fk_id);
        $return_values = array();

        foreach($return_columns as $this_column) {
            $return_values[$this_column] = $fk_obj->get_value($this_column);
        }

        return $return_values;
        
    }
    
    public function save($delete=false) {

        if(!user_has_role(ROLEIDS["ADMIN"]))
            return false;

        $table_data = get_set_cache('schema_data_' . $this->table_name,"DB::getSchemaBuilder()->getColumns('" . $this->table_name . "');",CACHETIMEOUTS["SCHEMADATA"]);
        
        if(!$table_data)
            return false;

        if($delete === "DELETE" && (int)$this->id > 0) {
            $deleted = DB::table($this->table_name)->where('id', '=', (int)$this->id)->delete();
            return $deleted;
        }

        $key_vals = array();

        ($this->id == null || !is_int((int)$this->id) || $this->id < 0 || $this->table_name == null) ? $inserting = true : $inserting = false;

        foreach($table_data as $this_column) {
            if($this_column['name'] == 'id')
                continue;

            $tmp = $this->get_value($this_column['name']);
            if(!$this->validate_value($this_column['name'],$tmp,$this_column))
                continue;

            if($this_column['type_name'] == "int" && $tmp == "")
                $tmp = null;

            if($inserting || (!$inserting && $tmp != $this->initial_values[$this_column['name']])) {
                if($this_column['name'] == 'password')
                    $tmp = Hash::make($tmp);
                $key_vals[$this_column['name']] = $tmp;
            }
        }

        if(!count($key_vals)) {
            return;
        }

        if($inserting)
            $this->id = DB::table($this->table_name)->insertGetId($key_vals);
        else
            DB::table($this->table_name)->where('id',$this->id)->update($key_vals);

        return $this->id;
    }
    
    public function get_associated_result($base_fk_field) {
        $base_field_name = $base_fk_field . '_id';
        
        if(!(int)$this->$base_field_name > 0)
            return null;

        $tmp = new Blank($base_fk_field,(int)$this->$base_field_name);
        if(isset($tmp->id) && $tmp->id == $this->$base_field_name)
            return $tmp;
        
        return null;
    }

    public function get_referring_results($base_parent,$second_test=null,$sort_by=null) {
        if(!(int)$this->id > 0)
            return null;

        $results_array = array();
        $query = DB::table($base_parent);
        $query->select("id");
        $query->where($this->table_name . "_id",'=',$this->id);
        if($second_test != null && is_array($second_test) && count($second_test) == 2)
            $query->where($second_test[0],'=',$second_test[1]);
        if($sort_by != null)
            $query->orderByRaw($sort_by);

        if(!in_array($base_parent,TABLESNOGROUPNEEDED) && !user_has_role(ROLEIDS["ADMIN"]))
            $query->where(function ($query) { $query->whereIn('groups_id',session('user_groups_list'))->orWhereNull('groups_id'); });

        $results_list = $query->get();

        foreach($results_list as $this_result) {
            if(!(int)$this_result->id > 0)
                continue;
            $tmp_result = new Blank($base_parent,$this_result->id);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
    public function get_referring_results_by_link($base_parent,$link_table,$second_test=null,$sort_by=null) {
        $link_list = $this->get_referring_results($base_parent,$second_test,$sort_by);
        $results_list = array();
            
        foreach($link_list as $this_obj) {
            $tmp_obj = $this_obj->get_associated_result($link_table);
            if($tmp_obj)
                array_push($results_list,$tmp_obj);
        }
        
        return $results_list;
    }
    
    public function write_form_field($field_name,$editable=false) {
        
        $html_string = array($field_name);
        
        if(!str_ends_with($field_name,"_id")) {
            ($field_name == "password") ? $field_type = 'password' : $field_type = 'text';
            $html_string[1] = "<input type='" . $field_type . "' name='" . $field_name . "' id='" . $field_name . "'";
            if(isset($this->$field_name))
                $html_string[1] .= " value='" . str_replace("'","&#39;",$this->$field_name) . "'";
            if($editable != true || $field_name == "id")
                $html_string[1] .= " readonly='readonly'";
            if($field_name == "id")
                $html_string[1] .= " size='5'";
            $html_string[1] .= ">";
        } else {
            $html_string[1] = "<select name='" . $field_name . "' id='" . $field_name . "'";
            if($editable != true)
                $html_string[1] .= " disabled";
            $html_string[1] .= ">";
            $base_name = substr($field_name, 0, -3);
            $all_the_things = get_all_blank($base_name);
            $test_cols = array("name","title","event_activities_id");
 
            $html_string[1] .= "<option value=''>-- Nothing Selected --</option>";
            
            foreach($all_the_things as $this_thing) {
                $html_string[1] .= "<option value='" . $this_thing->id . "'";
                foreach($test_cols as $this_col) {
                    if(isset($this_thing->$this_col))
                        $option_text = $this_thing->$this_col;
                }
                if($this_thing->id == $this->$field_name)
                    $html_string[1] .=  " selected";;
                $html_string[1] .= ">" . str_replace("'","&#39;",$option_text) . "</option>";
            }
    
            $html_string[1] .= "</select>";
        }
        
        return $html_string;
    }
    
    public function get_form_array($editable=false) {
        $form_fields = array();
        $columns_to_check = get_set_cache('column_listing_' . $this->table_name,"DB::getSchemaBuilder()->getColumnListing('" . $this->table_name . "');",CACHETIMEOUTS["SCHEMADATA"]);
        
        foreach($columns_to_check as $this_column) {
            array_push($form_fields,$this->write_form_field($this_column,$editable));
        }
        
        return $form_fields;
    }
    
    public function validate_value($field_name,$test_val,$column_data=null) {
        
        $validate_rules = array();

        if($column_data == null) {
            $table_data = get_set_cache('schema_data_' . $this->table_name,"DB::getSchemaBuilder()->getColumns(" . $this->table_name . ");",CACHETIMEOUTS["SCHEMADATA"]);
            foreach($table_data as $this_column) {
                if($this_column['name'] == $field_name) {
                    $column_data = $this_column;
                    break;
                }
            }
        }

        if(isset($column_data['nullable']) && $column_data['nullable'] == 1 && $test_val == null)
            return true;

        switch($column_data['type_name']) {
            case 'int':
                array_push($validate_rules,"integer");
            break;
            case 'varchar':
                array_push($validate_rules,"string");
                sscanf($column_data['type'],"varchar(%d)",$column_length);
                array_push($validate_rules,"max:" . $column_length);
            break;
            case 'mediumtext':
                array_push($validate_rules,"string");
            break;
            case 'date':
            case 'timestamp':
            case 'datetime':
                array_push($validate_rules,"date");
            break;
            default:
                return false;
        }

        $validator = Validator::make(data: [$field_name => $test_val],rules: [$field_name => $validate_rules]);
        
        if ($validator->fails()) {
            return false;
        }
        
        return true;
    }

    public function get_href() {
        
        if(view()->exists($this->get_value('table_name')))
            $href_html = "<a href = '/" . $this->table_name . "/" . $this->id . "'>";
        else
            $href_html = "<a href = '/objects/" . $this->table_name . "/" . $this->id . "'>";

        $test_properties = array("name","title");
        foreach($test_properties as $this_property) {
            if(isset($this->$this_property))
                $href_html .= $this->$this_property;
        }
    
        $href_html .= "</a>";
    
        return $href_html;
    }
}

?>
