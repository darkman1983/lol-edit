<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class quest
{
  public static function quest_search($data = false)
  {
    global $db, $smarty, $field;

    if (empty($data))
      show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Überprüfen!", 'error_ajax' => true), 'default/error.tpl');

    $sql_parts = ' WHERE';
    $last_length = 6;

    foreach ($data as $key => $value)
    {
      if (!empty($value))
      {
        switch ($key)
        {
          case 'button':
          case 'button2':
            break;
          case 'q_zos':
            $sql_parts .= " q.`{$field['q_zos']}` = '{$value}'";
            break;
          case 'q_id':
            $sql_parts .= " q.`{$field['q_id']}` = {$value}";
            break;
          case 'q_title':
            $sql_parts .= " q.`{$field['q_title']}` LIKE '%{$value}%' OR l.`Title_loc3` LIKE '%{$value}%'";
            break;
          case 's_questgiver':
            $real_value = substr($value, 1);
            $is_item = false;
            switch (substr($value, 0, 1))
            {
              case 'c':
                $qgiver_table = 'creature_queststarter';
                break;
              case 'o':
                $qgiver_table = 'gameobject_queststarter';
                break;
              case 'i':
                $is_item = true;
                $qgiver_table = 'item_template';
                break;
              default:
                $qgiver_table = 'creature_queststarter';
                break;
            }
            if (!$is_item)
              $sql_parts .= " q.`{$field['q_id']}` IN (SELECT `quest` FROM `dev_pve_world`.`{$qgiver_table}` WHERE `id` = {$real_value})";
            else
              $sql_parts .= " q.`{$field['q_id']}` IN (SELECT `startquest` FROM `dev_pve_world`.`{$qgiver_table}` WHERE `entry` = {$real_value})";
            break;
          case 's_questfinisher':
            $real_value = substr($value, 1);
            switch (substr($value, 0, 1))
            {
              case 'c':
                $qinvolve_table = 'creature_questender';
                break;
              case 'o':
                $qinvolve_table = 'gameobject_questender';
                break;
              default:
                $qinvolve_table = 'creature_questender';
                break;
            }
            $sql_parts .= " q.`{$field['q_id']}` IN (SELECT `quest` FROM `dev_pve_world`.`{$qinvolve_table}` WHERE `id` = {$real_value})";
            break;
          case 'q_prev':
            $sql_parts .= " q.`{$field['q_prev']}`  = {$value}";
            break;
          case 'q_next':
            $sql_parts .= " q.`{$field['q_next']}` = {$value}";
            break;
        }
      }
      if (strlen($sql_parts) > $last_length)
      {
        $sql_parts .= ' OR';
        $last_length = strlen($sql_parts);
      }
    }

    $sql_parts = rtrim($sql_parts,' OR');
    $sql_parts = rtrim($sql_parts,' WHERE');

    if (empty($sql_parts))
      show_template('info', array('error' => "Du musst etwas zum Suchen Eingeben!", 'error_ajax' => true), 'default/error.tpl');

    $get_quests_sql = "SELECT q.{$field['q_id']}, q.{$field['q_title']}, l.Title_loc3 as Title_loc FROM `dev_pve_world`.`quest_template` q LEFT JOIN (`dev_pve_world`.`locales_quest` l) ON l.{$field['qloc_id']}=q.{$field['q_id']}{$sql_parts} LIMIT 0, 200";
    $get_quests = $db->QueryArray( $get_quests_sql, MYSQL_ASSOC );

    if (!$get_quests)
      show_template('info', array('error' => "Fehler bei der Dantenbankabfrage der Quests: {$db->Error()} ! Oder nichts gefunden.", 'error_ajax' => true), 'default/error.tpl');

    show_template('quest_data', $get_quests, 'default/sections/quest_search_result.tpl');
  }

  public static function quest_new()
  {
    global $field;

    show_template('data', array('next_id' => get_next_id($field['q_id'], 'quest_template')), 'default/sections/quest_new.tpl');
  }

  public static function quest_load($data = false)
  {
    global $db, $field;

    $get_quest_sql = "SELECT * FROM `dev_pve_world`.`quest_template` WHERE `{$field['q_id']}` = '{$data['qselected']}'";

    switch ($data['tpl'])
    {
      case 'main':
        $template = "quest_main";
        break;
      case 'ext':
        $template = "quest_extended";
        break;
      default:
        $template = "quest_main";
        break;
    }

    show_template('data', isset($data['qselected']) ? $db->QuerySingleRowArray($get_quest_sql, MYSQL_ASSOC ) : '', "default/sections/{$template}.tpl");
  }
}
?>