<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class gameobject_sql
{
  public static function gen_sql($data)
  {
    global $db, $field;

    $sql = '';

    $field_f = array_flip($field);
    $t_data  = array();

    $data = json_decode($data['json'], true);

    $i  = 0;
    while ($i<count($data))
    {
      if (is_array($data[$i]))
        $t_data = array_merge($t_data, $data[$i]);
      $i++;
    }
    $data = $t_data;
    $res  = '';

    foreach ( $data as $key => $tdata )
      $data [$key] = $db->quote_smart($tdata);

    if (!empty($data['g_id']))
    {

      $data['gloc_id'] = $data['g_id'];

      $sql[0]     = "-- Einträge für gameobject_template<br>";
      $sql[1]     = "DELETE FROM `gameobject_template` WHERE `{$field['g_id']}` = '{$data['g_id']}';";
      $sql[5]     = "DELETE FROM `locales_gameobject` WHERE `{$field['gloc_id']}` = '{$data['g_id']}';";
      $sql[6]     = "INSERT INTO `gameobject_template` (";

      $res        = '';
      $pa_1       = '';
      $pa_2       = '';
      $pa_3       = '';
      $pa_4       = '';
      $pa_5       = '';
      $pa_6       = '';
      $gloc_set   = false;

          foreach ($data as $k => $v)
      {
        if (strstr($k, 'gloc_') && !strstr($k, 'gloc_id'))
          $cloc_set = true;
        if (strstr($k, 'g_') && !strstr($k, 'gloc_'))
          $pa_1 .= "`{$field[$k]}`, ";
      }

      $pa_1    = rtrim($pa_1,', '). ") VALUES<br>(";

          foreach ($data as $dk => $dv)
      {
        if (strstr($dk, 'g_') && !strstr($dk, 'gloc_'))
          $pa_2 .= "'{$dv}', ";
      }

      $pa_2     = rtrim($pa_2,', '). ");<br>";
      $sql[6]   .= $pa_1.$pa_2;

      if (!$gloc_set)
        unset($sql[5]);

      foreach ($sql as $sq)
        $res .= "{$sq}<br>";

      if ($gloc_set)
      {
        $res  .= "<br>-- Einträge für locales_gameobject<br><br>";
        $res  .= "INSERT INTO `locales_gameobject` (";

        foreach ($data as $kl => $vl)
        {
          if (strstr($kl, 'gloc_'))
            $pa_3 .= "`{$field[$kl]}`, ";
        }

        $pa_3 = rtrim($pa_3,', '). ") VALUES (";

        foreach ($data as $dkl => $dvl)
        {
          if (strstr($dkl, 'gloc_'))
            $pa_4 .= "'{$dvl}', ";
        }

        $pa_4  = rtrim($pa_4,', '). ");";
        $res  .= $pa_3.$pa_4;
      }
      unset($sql);
    }

      if (!empty($data['lo_id'])) {
          $tbls = array('creature_loot_template', 'disenchant_loot_template', 'fishing_loot_template', 'gameobject_loot_template', 'item_loot_template', 'pickpocketing_loot_template', 'prospecting_loot_template', 'skinning_loot_template', 'quest_mail_loot_template', 'reference_loot_template', 'milling_loot_template');

          foreach ($tbls as &$tbl) {
              $sql[0] = "<br><br>-- Einträge für {$tbl}<br><br>";
              $sql[1] = "DELETE FROM `{$tbl}` WHERE `{$field['lo_id']}` IN (%s);<br>";
              $entrys = array();
              $id_arr = array();
              $ids = '';

              if (is_array($data['lo_id'])) {
                  for ($i = 0; $i < count($data['lo_id']); $i++) {
                      if (!isset($data['lo_id'][$i]) || $data['lo_type'][$i] != $tbl)
                          continue;

                      $entrys [] = "INSERT INTO `{$tbl}` (`{$field['lo_id']}`,`{$field['lo_itm']}`,`{$field['lo_coqc']}`,`{$field['lo_lomod']}`,`{$field['lo_grpid']}`,`{$field['lo_micor']}`,`{$field['lo_mac']}`) VALUES ('{$data['lo_id'][$i]}','{$data['lo_itm'][$i]}','{$data['lo_coqc'][$i]}','{$data['lo_lomod'][$i]}','{$data['lo_grpid'][$i]}','{$data['lo_micor'][$i]}','{$data['lo_mac'][$i]}');<br>";

                      if (!in_array($data['lo_id'][$i], $id_arr))
                          $ids .= "{$data['lo_id'][$i]},";
                      $id_arr [] = $data['lo_id'][$i];
                  }

                  if (!empty($ids))
                      $res .= $sql[0] . sprintf($sql[1], rtrim($ids, ','));

                  foreach ($entrys as $entry)
                      $res .= $entry;
              } else {
                  if ($data['lo_type'][$i] != $tbl)
                      continue;

                  $entrys [] = "INSERT INTO `{$tbl}` (`{$field['lo_id']}`,`{$field['lo_itm']}`,`{$field['lo_coqc']}`,`{$field['lo_lomod']}`,`{$field['lo_grpid']}`,`{$field['lo_micor']}`,`{$field['lo_mac']}`) VALUES ('{$data['lo_id']}','{$data['lo_itm']}','{$data['lo_coqc']}','{$data['lo_lomod']}','{$data['lo_grpid']}','{$data['lo_micor']}','{$data['lo_mac']}');<br>";
                  $ids .= "{$data['lo_id']},";
                  $res .= $sql[0] . sprintf($sql[1], rtrim($ids, ',')) . $entrys[0];
              }

              unset($sql);
              unset($entrys);
              unset($ids);
          }
      }

      show_template('data', array('gameobject_sql' => $res, 'id' => 'gameobject'), 'default/sections/gen_sql_res.tpl');
  }
}
?>