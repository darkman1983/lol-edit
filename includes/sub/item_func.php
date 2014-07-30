<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

function item_search($data)
{
  global $db, $field;

  $sql_parts = ' WHERE';
  if (!empty($data['sitem_id']))
    $sql_parts .= " t.{$field['i_id']} = {$data['sitem_id']}";
  if (!empty($data['sitem_name']))
    $sql_parts .= ((!empty($data['sitem_id'])) ? ' OR' : '')." `{$field['i_name']}` LIKE '%{$data['sitem_name']}%' OR `{$field['iloc_name3']}` LIKE '%{$data['sitem_name']}%'";
  $sql_parts = rtrim($sql_parts, ' WHERE');
  
  $sql_parts = empty($sql_parts) ? ' ORDER BY RAND()' : $sql_parts;

  $get_sql = "SELECT t.{$field['i_id']} as id, t.{$field['i_name']} as iname, l.{$field['iloc_name3']} as iname_loc FROM `dev_pve_world`.`item_template` t LEFT JOIN (`dev_pve_world`.`locales_item` l) ON l.{$field['iloc_id']}=t.{$field['i_id']}{$sql_parts} LIMIT 0, 200";

  $get = $db->QueryArray($get_sql, MYSQL_ASSOC);
  if (!$get)
    show_template('info', array('error' => "Fehler bei der Datenbankabfrage! Oder Keine Ergebnisse...", 'error_ajax' => true), 'default/error.tpl');
   
  show_template('dialog', array_merge($get, $data), 'default/dialogs/dialog_item_result.tpl');
}
?>