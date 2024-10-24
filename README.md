## About Home Events

This project began as a result of my analytical nature running headlong into weekly gaming group. How often do certain numbers come up on dice rolls? Does seating order have any effect on outcomes? Who really DOES win the most? The frist step to answering these questions is to gather the data! This project aims to be a quick and easy way to manage and create events, include activities, record results, and find ways to interpret the data to prove that you are #1!


## Installation

- PHP 8.3.12
- MySQL 5.7.36 

To create the appropriate tables, run 'docs/schema.sql' against your mysql installation.
If you want to include seed data to play with, run 'seed_data.sql' to import the data.
To build the database and populate it at the same time, run 'schema_with_seed_data.sql'.

## Default login
<pre>
user: aaron
password: homeevents
</pre>

## Structure

An Event (time and place with users attending) has one or more Activities (games, dice rolls, etc) associated with it. Any objects associated with a given Activity are stored in Activity Objects (ex: A specific deck name).
For each Activity attached to an Event, we record the Event Activity Result for that user.


## Object Control

Each table in the database not listed in the app/define.php 'TABLESNONOBJECT' array is controlled via the Blank class (Models/Blank.php). If new tables are created, they will be able to be controlled by Blank unless added to this array.
All example objects and MySQL data below assume 'docs/schema_with_seed_data.sql' has been run.

When instantiated, the resultant object will contain a property for each field in the matching MySQL table.
Create an Activity object with blank values:
<pre>
$obj = new Blank('activity');
</pre>
Create an Activity object with values matching the row in the activity table with an id of 5:
<pre>
$obj = new Blank('activity',5);
</pre>
Set/update values in Activiy object $obj with values matching the row in the activity table with an id of 4:
<pre>
$obj->set_values_by_id(4);
</pre>
Return the value of the 'description' field for Activity object $obj:
<pre>
$obj->get_value('description');
</pre>
Set $all_obj to an array of Activity objects, containing all rows in the activity table:
<pre>
$all_obj = new Blank('activity');
$all_obj = $all_obj->get_all();
</pre>
Set $all_obj to an array of Activity objects, containing all rows in the activity table, sorted by the 'name' field:
<pre>
$all_obj = new Blank('activity');
$all_obj = $all_obj->get_all(sort_by:'name');
</pre>
Set $all_obj to an array of Activity objects, containing all rows in the activity table except for rows with id 4 or 7:
<pre>
$all_obj = new Blank('activity');
$all_obj = $all_obj->get_all(limit_by:'id NOT IN(4,7)');
</pre>
Set the value of the 'name' property of Activity object $obj to 'a new name':
<pre>
$obj->set_value('name','a new name');
</pre>
Add an entry in the 'notes' table for Activity object $obj with text 'a new note':
<pre>
$obj->add_note('a new note');
</pre>
As a default, the 'date' field of a note is set to the datetime value of when it was added. Add an entry in the 'notes' table for Activity object $obj with text 'an old note from a Christmas long ago' with a datetime of '1981-12-25 00:00:00' regardless of when it was added:
<pre>
$obj->add_note('an old note from a Christmas long ago','1981-12-25 00:00:00');
</pre>
Return an array with fields 'id' and 'name' that contain the respective values of the activity_result row in the database with an id matching the activity_result_id in the Activity object $obj:
<pre>
$obj->get_fk_values('activity_result_id',array('id','name'));
</pre>
Write the values of Activity object $obj to the database by performing either an update or insert, based on this being a new entry or a pre-existing one:
<pre>
$obj->save();
</pre>
Return an Activity Result object based on the value of the 'activity_result_id' value in Activity object $obj:
<pre>
$obj->get_associated_result('activity_result');
</pre>
Return an array of Activity objects that have an activity_result_id of the id of Activity Result object $obj:
<pre>
$obj->get_referring_results('activity');
</pre>
Return an array of Event Activity Results objects that have an event_activities_id of the id of Event Activities object $obj, which also have a user id of 9:
<pre>
$obj->get_referring_results('event_activities_results',array('users_id',9));
</pre>
Return an array of User objects that have a row in the event_users table with their id and the id of Event object $obj
<pre>
$obj->get_referring_results_by_link('event_users','users');
</pre>
Return an array whose first element is the name of the field, and the second is formatted HTML disabled (non-editable)form field fit for the datatype of field 'title' for Event object $obj, with a default value of the fields value for object $obj:
<pre>
$obj->write_form_field('title');
</pre>
Return an array whose first element is the name of the field, and the second is formatted HTML disabled (non-editable)form field fit for the datatype of field 'location_id' for Event object $obj, with a default value of the fields value for object $obj:
<pre>
$obj->write_form_field('location_id',editable:true);
</pre>
Return an array of arrays of disabled form fields for each field of Event object $obj:
<pre>
$obj->get_form_array();
</pre>
Return an array of arrays of editable form fields for each field of Event object $obj:
<pre>
$obj->get_form_array(editable:true);
</pre>
Return 'true' if the value of $test_value is valid given the column definition for the 'date' field of Event object $obj, 'false' otherwise:
<pre>
$obj->validate_value('date',$test_value);
</pre>
Return a string containing a formatted HTML link to the details page of Events object $obj:
<pre>
$obj->get_href();
</pre>
## File locations
Functions/definitions placed in the following files are available application-wide. Put code here:
<pre>
- css                    public/css/styles.css
- javascript functions   public/js/base.js
- constant definitions   app/define.php
- custom functions       app/Helpers/Helpers.php
</pre>

***

#### Author
By Aaron Mathisen
