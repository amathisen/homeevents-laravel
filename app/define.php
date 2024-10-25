<?php

if(!defined("GOFIRSTDICEID"))
    define("GOFIRSTDICEID", 5);
if(!defined("GOFIRSTDICEREROLLID"))
    define("GOFIRSTDICEREROLLID", 6);
if(!defined("MTGCOMMANDERID"))
    define("MTGCOMMANDERID", 4);
if(!defined("MULLIGANID"))
    define("MULLIGANID", 7);
if(!defined("ACTIVITYOBJECTID"))
    define("ACTIVITYOBJECTID", -1);

if(!defined("DATEDISPLAY"))
    define("DATEDISPLAY", "n/j/Y");

if(!defined("TABLESNONOBJECT"))
    define("TABLESNONOBJECT",array("cache","cache_locks","failed_jobs","job_batches","jobs","migrations","password_reset_tokens","sessions"));

if(!defined("ROLEIDS")) {
    define("ROLEIDS",array(
        "ADMIN" => 1)
    );
}

if(!defined("CACHETIMEOUTS")) {
    define("CACHETIMEOUTS",array(
        "SCHEMADATA" => 6000)
    );
}

?>
