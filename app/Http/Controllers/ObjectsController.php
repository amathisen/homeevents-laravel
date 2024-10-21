<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ObjectsController extends Controller
{
    public function index() {
        $page_title = "All the Things";
        $tables = DB::getSchemaBuilder()->getTableListing();
        $tables = array_diff($tables,TABLESNONOBJECT);
        
        return view('objects',compact("page_title","tables"));
    }
    
    public function objects_list($object_type) {
        $all_objs = new Blank($object_type);
        if(!$all_objs->get_value('table_name'))
            return redirect()->route('show_object_types');
        $page_title = "All the " . strtoupper($object_type) . "s";
        $all_objs = $all_objs->get_all();
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
        $tmp_obj = new Blank($object_type,$object_id);
        
        if($delete === "solongfarewell") {
            $tmp_obj->save(delete:"DELETE");
            return redirect()->route('show_objects',['object_type' => $object_type]);
        }

        foreach($request->all() as $key => $value) {
            if($key == "id")
                continue;
            $tmp_obj->set_value($key,$value);
        }
        
        $tmp_obj->save();
        if(!$tmp_obj->id) {
            echo "Didn't save nothing :(";
            exit;
        }

        return redirect()->route('show_object',['object_type' => $object_type, 'object_id' => $tmp_obj->id]);
    }
}
