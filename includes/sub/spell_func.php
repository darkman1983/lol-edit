<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

function spell_search($data)
{
  global $db;

  $type = '';
  $tables = array();

  $sql_parts = ' WHERE';
  if (!empty($data['s_id']))
    $sql_parts .= " t.entry = {$data['s_id']}";
  if (!empty($data['s_name']))
    $sql_parts .= ((!empty($data['s_id'])) ? ' OR' : '')." `name` LIKE '%{$data['s_name']}%' OR `name_loc3` LIKE '%{$data['s_name']}%'";
  $sql_parts = rtrim($sql_parts, ' WHERE');

  if (empty($tables))
    show_template('info', array('error' => "Fehler: Tabellen wurden nicht gefunden!", 'error_ajax' => true), 'default/error.tpl');

  $get_sql = "SELECT * FROM `{$world_db}`.`{$tables[0]}` t LEFT JOIN (`{$world_db}`.`{$tables[1]}` l) ON l.entry=t.entry{$sql_parts} LIMIT 0, 200";
  $template = 'default/dialogs/dialog_' .(($data['gifi'] == 'gi') ? 'questgiver' : 'questfinisher').'_result.tpl';

  $get = $db->QueryArray($get_sql, MYSQL_ASSOC);
  if (!$get)
    show_template('info', array('error' => "Fehler bei der Datenbankabfrage! Oder Keine Ergebnisse...", 'error_ajax' => true), 'default/error.tpl');

  for ($i=0;$i<count($get);$i++)
    if (isset($get[$i]))
    {
      $get[$i]['type'] = $type;
      $get[$i]['short_type'] = substr($data['qr_type'], 0, 1);
      $get[$i]['ret'] = $data['ret'];
    }
     
    show_template('dialog', array_merge($get, $data), $template);
}
?>