<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

//SQL Injection Absicherung
if ($db && $_POST) {
  if (is_array ( $_POST ))
    foreach ( $_POST as $key => $tdata )
    {
      if(!isJson($tdata))
        $_POST [$key] = $db->quote_smart($tdata);
    }
}

if ($db && $_GET) {
  if (is_array ( $_GET ))
    foreach ( $_GET as $key => $tdata )
    if(!isJson($tdata))
    {
      $_GET [$key] = $db->quote_smart($tdata);
    }
}
?>