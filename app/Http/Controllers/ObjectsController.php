<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use App\Helpers\helpers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ObjectsController extends Controller
{
    public function index() {
        if(!user_has_role(ROLEIDS["ADMIN"]))
            return redirect()->route('index');
        $page_title = "All the Things";
        $tables = get_set_cache('allowed_blank_tables',"array_diff(DB::getSchemaBuilder()->getTableListing(),TABLESNONOBJECT);",CACHETIMEOUTS["SCHEMADATA"]);
        return view('objects',compact("page_title","tables"));
    }
    
    public function objects_list($object_type) {
        $all_objs = get_all_blank($object_type);
        if(!count($all_objs))
            return redirect()->route('show_object_types');
        $page_title = "All the " . strtoupper($object_type) . "s";
        $row_results = array();
        
        foreach($all_objs as $this_obj) {
            array_push($row_results,array($this_obj->id,$this_obj->get_form_array()));
        }
        return view('objects',compact("page_title","object_type","row_results"));
    }

    public function object_edit($object_type,$object_id) {
        $this_obj = new Blank($object_type,$object_id);
        if(!$this_obj->get_value('table_name'))
            return redirect()->route('show_object_types');
        if(!$this_obj->id && $object_id != "new")
            return redirect()->route('show_objects',['object_type' => $object_type]);
        $page_title = "Edit a " . strtoupper($object_type) . " with id " . $this_obj->id;
        
        $fields = $this_obj->get_form_array(editable:true);
        (isset($this_obj->id)) ? $submit_text = "Update" : $submit_text = "Create";
        return view('objects',compact("page_title","object_type","object_id","fields","submit_text"));
    }
    
    public function object_crud(Request $request) {
        $object_type = $request->input('object_type');
        $object_id = $request->input('id');
        $delete = $request->input('delete');
        $redirect_to = $request->input('redirect_to');
        $recursive_values = array();
        $tmp_obj = new Blank($object_type,$object_id);
        
        if($delete === "solongfarewell") {
            $tmp_obj->save(delete:"DELETE");
            return redirect()->route('show_objects',['object_type' => $object_type]);
        }

        foreach($request->all() as $key => $value) {
            if($key == "id")
                continue;
            if(str_starts_with($key,"RECURSIVE_")) {
                $recursive_values[str_replace("RECURSIVE_","",$key)] = $value;
                continue;
            }
            $tmp_obj->set_value($key,$value);
        }
        
        $tmp_obj->save();
        if(!$tmp_obj->id) {
            echo "Didn't save nothing :(";
            exit;
        }
        
        if(count($recursive_values)) {
            $second_obj_type = $recursive_values['OBJECTTYPE'];
            unset($recursive_values['OBJECTTYPE']);
            $recursive_values[$recursive_values['PREVIOUSIDTOFIELD']] = $tmp_obj->id;
            unset($recursive_values['PREVIOUSIDTOFIELD']);
            $second_obj = new Blank($second_obj_type);
            foreach($recursive_values as $key => $value)
                $second_obj->set_value($key,$value);
            $second_obj->save();
        }

        return (!isset($redirect_to)) ? redirect()->route('show_object',['object_type' => $object_type, 'object_id' => $tmp_obj->id]) : redirect(str_replace("NEWID",$tmp_obj->id,$redirect_to));
    }
}
