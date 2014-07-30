<?php
include_once("{$path}/configs/config_db.php");
include("db/mysql.class.php");
$db       = new mysql();

if (! $db->Open($db_name, $db_url, $db_user, $db_pass))
  $db->Kill();
?>