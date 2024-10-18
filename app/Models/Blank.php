<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

#[AllowDynamicProperties]

class Blank extends Model {
    public $id = null;
    private $table_name = null;

    // Constructor to create the activity. Pass in an ID to populate values for that activity
    public function __construct($initial_table = null,$initial_id = null) {
            $this->table_name = $initial_table;
            $this->id = (int)$initial_id;
            $this->set_values_by_id((int)$initial_id);
    }
    
    //Pass in an activity ID to populate values for this object with that activity
    public function set_values_by_id($base_id) {

        if($base_id == null || !is_int($base_id) || (int)$base_id < 0) {
           $schema = DB::getSchemaBuilder()->getColumnListing($this->table_name);
           foreach($schema as $this_field) {
               $this->set_value($this_field,null);
           }
           return true;
        }
        
        $db_obj = DB::table($this->table_name)->find((int)$base_id);

        if(isset($db_obj->id) && (int)$db_obj->id === $base_id) {
            foreach($db_obj as $key => $value) {
                $this->$key = $value;
            }
            return true;
        } else
            $this->id = null;
        
        return false;
    }

    public function get_value($val_name) {
        if(isset($this->$val_name))
            return $this->$val_name;
    
        return false;
    }
    
    public function get_all($limit_by=null,$sort_by=null) {
        if($this->table_name == null)
            return false;

        $all_objects = array();

        $query = DB::table($this->table_name);
        $query->select('id');

        if($limit_by != null)
            $query->where($limit_by);
        if($sort_by != null)
            $query->orderBy($sort_by);
        
        $object_ids = $query->get();

        foreach($object_ids as $this_id) {
            $tmp = new Blank($this->table_name,$this_id->id);
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
    
    public function get_fk_value($base_value,$return_columns=array("name","title")) {
        $tmp = $this->get_value($base_value);
        if(!str_ends_with($base_value,"_id") || !$tmp)
            return false;
        
        $fk_obj = new Blank(substr($base_value, 0, -3),$tmp);
        $tmp_value = null;
        
        foreach($return_columns as $this_column) {
            $tmp_value = $fk_obj->get_value($this_column);
            if($tmp_value)
                break;
        }

        return $tmp_value;
        
    }
    
    public function save($delete=false) {

        $table_data = DB::getSchemaBuilder()->getColumnListing($this->table_name);
        
        if(!$table_data)
            return false;

        if($delete === "DELETE" && (int)$this->id > 0) {
            $deleted = DB::table($this->table_name)->where('id', '=', (int)$this->id)->delete();
            return $deleted;
        }

        $key_vals = array();
        
        foreach($table_data as $this_column) {
            if($this_column == 'id') continue;
            $tmp = $this->get_value($this_column);
            if($this_column == 'date' && !$tmp) continue;
            $key_vals[$this_column] = $tmp;
        }
        
        if($this->id == null || !is_int((int)$this->id) || $this->id < 0 || $this->table_name == null)
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

    public function get_referring_results($base_parent,$second_test=null) {
        if(!(int)$this->id > 0)
            return null;

        $results_array = array();
        $query = DB::table($base_parent);
        $query->select("id");
        $query->where($this->table_name . "_id",'=',$this->id);
        if($second_test != null && is_array($second_test) && count($second_test) == 2)
            $query->where($second_test[0],'=',$second_test[1]);

        $results_list = $query->get();

        foreach($results_list as $this_result) {
            if(!(int)$this_result->id > 0)
                continue;
            $tmp_result = new Blank($base_parent,$this_result->id);
            array_push($results_array,$tmp_result);
        }
        
        return $results_array;
    }
    
    public function get_referring_results_by_link($base_parent,$link_table,$second_test=null) {
        $link_list = $this->get_referring_results($base_parent,$second_test);
        $results_list = array();
        foreach($link_list as $this_obj) {
            $tmp_obj = $this_obj->get_associated_result($link_table);
            array_push($results_list,$tmp_obj);
        }
        
        return $results_list;
    }
    
    public function write_form_field($field_name,$id_value = "",$editable=false) {
        
        $html_string = array("<b>" . $field_name ."</b>","");
        $field_identifier = $field_name . "_" . $this->id;
        if($id_value != "")
            $field_identifier .= "_" . $id_value;
        
        if(!str_ends_with($field_name,"_id")) {
            $html_string[1] = "<input type='text' name='" . $field_identifier . "' id='" . $field_identifier . "'";
            if(isset($this->$field_name))
                $html_string[1] .= " value='" . $this->$field_name . "'";
            if($editable != true || $field_name == "id")
                $html_string[1] .= " readonly='readonly'";
            if($field_name == "id")
                $html_string[1] .= " size='5'";
            $html_string[1] .= ">";
        } else {
            $html_string[1] = "<select name='" . $field_identifier . "' id='" . $field_identifier . "'";
            if($editable != true)
                $html_string[1] .= " disabled";
            $html_string[1] .= ">";
            $base_name = substr($field_name, 0, -3);
            $all_the_things = new Blank($base_name);
            $all_the_things = $all_the_things->get_all();
            $test_cols = array("name","title","event_activities_id");
 
            foreach($all_the_things as $this_thing) {
                $html_string[1] .= "<option value='" . $this_thing->id . "'";
                foreach($test_cols as $this_col) {
                    if(isset($this_thing->$this_col))
                        $option_text = $this_thing->$this_col;
                }
                if($this_thing->id == $this->$field_name)
                    $html_string[1] .=  " selected";;
                $html_string[1] .= ">" . $option_text . "</option>";
            }
    
            $html_string[1] .= "</select>";
        }
        
        return $html_string;
    }
    
    public function get_href() {
        $href_html = "<a href = '" . $this->table_name . "/" . $this->id . "'>";
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
