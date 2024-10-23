## About Home Events

This project began as a result of my analytical nature running headlong into weekly gaming group. How often do certain numbers come up on dice rolls? Does seating order have any effect on outcomes? Who really DOES win the most? The frist step to answering these questions is to gather the data! This project aims to be a quick and easy way to manage and create events, include activities, record results, and find ways to interpret the data to prove that you are #1!


## Installation

- PHP 8.3.12
- MySQL 5.7.36 

To create the appropriate tables, run 'docs/schema.sql' against your mysql installation.
If you want to include seed data to play with, run 'seed_data.sql' to import the data.
To build the database and populate it at the same time, run 'schema_with_seed_data.sql'.


## Structure

An Event (time and place with users attending) has one or more Activities (games, dice rolls, etc) associated with it. Any objects associated with a given Activity are stored in Activity Objects (ex: A specific deck name).
For each Activity attached to an Event, we record the Event Activity Result for that user.


## Object Control

Each table in the database not listed in the app/define.php 'TABLESNONOBJECT' array is controlled via the Blank class (Models/Blank.php). If new tables are created, they will be able to be controlled by Blank unless added to this array.

To create an object, call: $temp_object = new Blank('<table name>');, replacing <table name> with the table holding the object definition.
To instantiate a specific instance of a record in the database, call $temp_object->set_values_by_id(<id>);, where <id> is the primary key of the object you'd like to access.
To do this in one step (instantiate and load), call  $temp_object = new Blank('<table name>',<id>);

For specific features of the Blank object type, view Models/Blank.php and play around, or leave me a message. If people want text, I'll provide it :)


## File locations
Here's where you can put custom stuff:
- css                    public/css/styles.css
- js                     public/js/base.js
- constant definitions   app/define.php
- custom functions       app/Helpers/Helpers.php




#### Author
By Aaron Mathisen
