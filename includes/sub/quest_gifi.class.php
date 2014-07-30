<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class quest_gifi
{
  public static function search($data)
  {
    global $db;

    $type = '';
    $tables = array();

    switch ($data['qr_type'])
    {
      case 'creature':
        $tables = array('creature_template', 'locales_creature');
        $type = 'Kreatur / NPC';
        break;
      case 'object':
        $tables = array('gameobject_template', 'locales_gameobject');
        $type = 'Gameobjekt';
        break;
      case 'item':
        if ($data['gifi'] == 'fi')
          show_template('info', array('error' => "Fehler: Items können keine Quests Abschließen!", 'error_ajax' => true), 'default/error.tpl');
        $tables = array('item_template', 'locales_item');
        $type = 'Gegenstand';
        break;
    }

    $sql_parts = ' WHERE';
    if (!empty($data['s_id']))
      $sql_parts .= " t.entry = {$data['s_id']}";
    if (!empty($data['s_name']))
      $sql_parts .= ((!empty($data['s_id'])) ? ' OR' : '')." `name` LIKE '%{$data['s_name']}%' OR `name_loc3` LIKE '%{$data['s_name']}%'";
    $sql_parts = rtrim($sql_parts, ' WHERE');

    if (empty($tables))
      show_template('info', array('error' => "Fehler: Tabellen wurden nicht gefunden!", 'error_ajax' => true), 'default/error.tpl');

    $get_sql = "SELECT t.entry as id, t.name, l.name_loc3 as lname FROM `dev_pve_world`.`{$tables[0]}` t LEFT JOIN (`dev_pve_world`.`{$tables[1]}` l) ON l.entry=t.entry{$sql_parts} LIMIT 0, 200";
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

  public static function load($data = false, $res = false)
  {
    global $db;

    $sql = "SELECT t.entry as id, t.name, l.name_loc3 as lname FROM `dev_pve_world`.`%s` t LEFT JOIN (`dev_pve_world`.`%s` l) ON l.entry=t.entry";
    $sql_where = " WHERE t.entry IN (SELECT `id` FROM `dev_pve_world`.`%s` WHERE `quest` = '%s')";
    $sql_where2 = " WHERE `startquest` = '%s'";
    $type = '';
    $q_gifi_res = array();
    $tpl = 'default/sections/quest_%s_content.tpl';

    if (empty($data) || (isset($data['gifi_id']) && empty($data['gifi_id'])))
      return array();

    if ($data['gifi'] == 'gi')
    {
      $gifi = '_queststarter';
      $template = sprintf($tpl, 'giver');
    }
    if ($data['gifi'] == 'fi')
    {
      $gifi = '_questender';
      $template = sprintf($tpl, 'finisher');
    }

    $q_id = substr($data['gifi_id'], 1);

    if (!is_numeric(substr($data['gifi_id'], 0, 1)))
    {
      switch (substr($data['gifi_id'], 0, 1))
      {
        case 'c':
          $sql = sprintf($sql.$sql_where, 'creature_template', 'locales_creature', "creature{$gifi}", $q_id);
          $type = 'Kreatur / NPC';
          break;
        case 'o':
          $sql = sprintf($sql.$sql_where, 'gameobject_template', 'locales_gameobject', "gameobject{$gifi}", $q_id);
          $type = 'Gameobjekt';
          break;
        case 'i':
          if($data['gifi'] == 'gi')
            $sql = sprintf($sql.$sql_where2, 'item_template', 'locales_item', $q_id);
          else $sql = '';
          $type = 'Gegenstand';
          break;
      }
      if (!empty($sql))
        $q_gifi_res = $db->QueryArray($sql, MYSQL_ASSOC);

      if ($q_gifi_res)
      {
        for ($i=0;$i<count($q_gifi_res);$i++)
          if (isset($q_gifi_res[$i]))
          {
            $q_gifi_res[$i]['type'] = $type;
            $q_gifi_res[$i]['short_type'] = substr($data['gifi_id'], 0, 1);
          }
      }
    }else
    {
      $ids = array("c{$data['gifi_id']}", "o{$data['gifi_id']}", "i{$data['gifi_id']}");

      foreach ($ids as $id)
      {
        $data['gifi_id'] = $id;
        $ress = self::load($data, true);
        if (!empty($ress))
          $q_gifi_res = array_merge($q_gifi_res, $ress);
      }
    }

    if ($res)
      return $q_gifi_res;
    else
      show_template('data', $q_gifi_res, $template);
  }

  public static function add($data = false)
  {
    global $db;

    $sql = "SELECT t.entry as id, t.name, l.name_loc3 as lname FROM `dev_pve_world`.`%s` t LEFT JOIN (`dev_pve_world`.`%s` l) ON l.entry=t.entry";
    $sql_where = " WHERE t.entry = '%s'";
    $type = '';
    $q_gifi_res = array();
    $tpl = 'default/sections/quest_%s_content.tpl';

    if (empty($data) || (isset($data['gifi_id']) && empty($data['gifi_id'])))
      return array();

    if ($data['gifi'] == 'gi')
    {
      $gifi = '_queststarter';
      $template = sprintf($tpl, 'giver');
    }
    if ($data['gifi'] == 'fi')
    {
      $gifi = '_questender';
      $template = sprintf($tpl, 'finisher');
    }

    $gifi_id = substr($data['gifi_id'], 1);

    if (!is_numeric(substr($data['gifi_id'], 0, 1)))
    {
      switch (substr($data['gifi_id'], 0, 1))
      {
        case 'c':
          $sql = sprintf($sql.$sql_where, 'creature_template', 'locales_creature', $gifi_id);
          $type = 'Kreatur / NPC';
          break;
        case 'o':
          $sql = sprintf($sql.$sql_where, 'gameobject_template', 'locales_gameobject', $gifi_id);
          $type = 'Gameobjekt';
          break;
        case 'i':
          $sql = sprintf($sql.$sql_where, 'item_template', 'locales_item', $gifi_id);
          $type = 'Gegenstand';
          break;
      }
      $q_gifi_res = $db->QueryArray($sql, MYSQL_ASSOC);

      if ($q_gifi_res)
      {
        for ($i=0;$i<count($q_gifi_res);$i++)
          if (isset($q_gifi_res[$i]))
          {
            $q_gifi_res[$i]['type'] = $type;
            $q_gifi_res[$i]['short_type'] = substr($data['gifi_id'], 0, 1);
          }
      }
    }else
    {
      $ids = array("c{$data['gifi_id']}", "o{$data['gifi_id']}", "i{$data['gifi_id']}");

      for ($i=0;$i<count($ids);$i++)
      {
        $data['gifi_id'] = $ids[$i];
        $res = q_gifi_add($data, true);
        if (!empty($res))
          $q_gifi_res = array_merge($q_gifi_res, $res);
      }
    }

    if (isset($data['ajax']))
      $q_gifi_res['ajax'] = 1;

    show_template('data', $q_gifi_res, $template);
  }
}
?>