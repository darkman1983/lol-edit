<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class creature_sql
{
  public static function gen_sql($data)
  {
    global $db, $field, $world_db;

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

    if (!empty($data['c_id']))
    {

      $data['cloc_id'] = $data['c_id'];

      $sql[0]     = "-- Einträge für creature_template<br>";
      $sql[1]     = "DELETE FROM `creature_template` WHERE `{$field['c_id']}` = '{$data['c_id']}';";
      $sql[5]     = "DELETE FROM `locales_creature` WHERE `{$field['cloc_id']}` = '{$data['c_id']}';";
      $sql[6]     = "INSERT INTO `creature_template` (";

      $res        = '';
      $pa_1       = '';
      $pa_2       = '';
      $pa_3       = '';
      $pa_4       = '';
      $pa_5       = '';
      $pa_6       = '';
      $cloc_set   = false;

      foreach ($data as $k => $v)
      {
        if (strstr($k, 'cloc_') && !strstr($k, 'cloc_id'))
          $cloc_set = true;
        if (strstr($k, 'c_') && !strstr($k, 'cloc_') && !strstr($k, 'ceq_'))
          $pa_1 .= "`{$field[$k]}`, ";
      }

      $pa_1    = rtrim($pa_1,', '). ") VALUES<br>(";

      foreach ($data as $dk => $dv)
      {
        if (strstr($dk, 'c_') && !strstr($dk, 'cloc_') && !strstr($dk, 'ceq_'))
          $pa_2 .= "'{$dv}', ";
      }

      $pa_2     = rtrim($pa_2,', '). ");<br>";
      $sql[6]   .= $pa_1.$pa_2;

      if (!$cloc_set)
        unset($sql[5]);

      foreach ($sql as $sq)
        $res .= "{$sq}<br>";

      if ($cloc_set)
      {
        $res  .= "<br>-- Einträge für locales_creature<br><br>";
        $res  .= "INSERT INTO `locales_creature` (";

        foreach ($data as $kl => $vl)
        {
          if (strstr($kl, 'cloc_'))
            $pa_3 .= "`{$field[$kl]}`, ";
        }

        $pa_3 = rtrim($pa_3,', '). ") VALUES (";

        foreach ($data as $dkl => $dvl)
        {
          if (strstr($dkl, 'cloc_'))
            $pa_4 .= "'{$dvl}', ";
        }

        $pa_4  = rtrim($pa_4,', '). ");";
        $res  .= $pa_3.$pa_4;
      }
      unset($sql);
    }

    if (!empty($data['ceq_id']))
    {
      $sql[0] = "<br><br>-- Einträge für creature_equip_template<br><br>";
      $sql[1] = "DELETE FROM `creature_equip_template` WHERE `entry` IN (%s);<br>";
      $entrys = array();
      $ids = '';

      if (is_array($data['ceq_id']))
      {
        for ($i=0;$i < count($data['ceq_id']);$i++)
        {
          if (!isset($data['ceq_id'][$i]))
            continue;

          $entrys [] = "INSERT INTO `creature_equip_template` (`{$field['ceq_id']}`,`{$field['ceq_id2']}`,`{$field['ceq_ient1']}`,`{$field['ceq_ient2']}`,`{$field['ceq_ient3']}`) VALUES ('{$data['ceq_id'][$i]}','{$data['ceq_id2'][$i]}','{$data['ceq_ient1'][$i]}','{$data['ceq_ient2'][$i]}','{$data['ceq_ient3'][$i]}');<br>";
          $ids .= "{$data['ceq_id'][$i]},";
        }
        $res .= $sql[0].sprintf($sql[1], rtrim($ids,','));

        foreach ($entrys as $entry)
          $res .= $entry;
      }else
      {
        $entrys [] = "INSERT INTO `creature_equip_template` (`{$field['ceq_id']}`,`{$field['ceq_id2']}`,`{$field['ceq_ient1']}`,`{$field['ceq_ient2']}`,`{$field['ceq_ient3']}`) VALUES ('{$data['ceq_id']}','{$data['ceq_id2']}','{$data['ceq_ient1']}','{$data['ceq_ient2']}','{$data['ceq_ient3']}');";
        $ids .= "{$data['ceq_id']},";
        $res .= $sql[0].sprintf($sql[1], rtrim($ids,',')).$entrys[0];
      }

      unset($sql);
      unset($entrys);
      unset($ids);
    }

    if (!empty($data['cad_id']))
    {
      $sql[0] = "<br><br>-- Einträge für creature_addon<br><br>";
      $sql[1] = "DELETE FROM `creature_addon` WHERE `guid` IN (%s);<br>";
      $entrys = array();
      $ids = '';

      if (is_array($data['cad_id']))
      {
        for ($i=0;$i < count($data['cad_id']);$i++)
        {
          if (!isset($data['cad_id'][$i]))
            continue;

          $entrys [] = "INSERT INTO `creature_addon` (`{$field['cad_id']}`,`{$field['cad_path']}`,`{$field['cad_mnt']}`,`{$field['cad_bt1']}`,`{$field['cad_bt2']}`,`{$field['cad_em']}`,`{$field['cad_au']}`) VALUES ('{$data['cad_id'][$i]}','{$data['cad_path'][$i]}','{$data['cad_mnt'][$i]}','{$data['cad_bt1'][$i]}','{$data['cad_bt2'][$i]}','{$data['cad_em'][$i]}','{$data['cad_au'][$i]}');<br>";
          $ids .= "{$data['cad_id'][$i]},";
        }
        $res .= $sql[0].sprintf($sql[1], rtrim($ids,','));

        foreach ($entrys as $entry)
          $res .= $entry;
      }else
      {
        $entrys [] = "INSERT INTO `creature_addon` (`{$field['cad_id']}`,`{$field['cad_path']}`,`{$field['cad_mnt']}`,`{$field['cad_bt1']}`,`{$field['cad_bt2']}`,`{$field['cad_em']}`,`{$field['cad_au']}`) VALUES ('{$data['cad_id']}','{$data['cad_path']}','{$data['cad_mnt']}','{$data['cad_bt1']}','{$data['cad_bt2']}','{$data['cad_em']}','{$data['cad_au']}');";
        $ids .= "{$data['cad_id']},";
        $res .= $sql[0].sprintf($sql[1], rtrim($ids,',')).$entrys[0];
      }

      unset($sql);
      unset($entrys);
      unset($ids);
    }

    if (!empty($data['cta_id']))
    {
      $sql[0] = "<br><br>-- Einträge für creature_template_addon<br><br>";
      $sql[1] = "DELETE FROM `creature_template_addon` WHERE `entry` IN (%s);<br>";
      $entrys = array();
      $ids = '';

      if (is_array($data['cta_id']))
      {
        for ($i=0;$i < count($data['cta_id']);$i++)
        {
          if (!isset($data['cta_id'][$i]))
            continue;

          $entrys [] = "INSERT INTO `creature_template_addon` (`{$field['cta_id']}`,`{$field['cta_path']}`,`{$field['cta_mnt']}`,`{$field['cta_bt1']}`,`{$field['cta_bt2']}`,`{$field['cta_em']}`,`{$field['cta_au']}`) VALUES ('{$data['cta_id'][$i]}','{$data['cta_path'][$i]}','{$data['cta_mnt'][$i]}','{$data['cta_bt1'][$i]}','{$data['cta_bt2'][$i]}','{$data['cta_em'][$i]}','{$data['cta_au'][$i]}');<br>";
          $ids .= "{$data['cta_id'][$i]},";
        }
        $res .= $sql[0].sprintf($sql[1], rtrim($ids,','));

        foreach ($entrys as $entry)
          $res .= $entry;
      }else
      {
        $entrys [] = "INSERT INTO `creature_template_addon` (`{$field['cta_id']}`,`{$field['cta_path']}`,`{$field['cta_mnt']}`,`{$field['cta_bt1']}`,`{$field['cta_bt2']}`,`{$field['cta_em']}`,`{$field['cta_au']}`) VALUES ('{$data['cta_id']}','{$data['cta_path']}','{$data['cta_mnt']}','{$data['cta_bt1']}','{$data['cta_bt2']}','{$data['cta_em']}','{$data['cta_au']}');";
        $ids .= "{$data['cta_id']},";
        $res .= $sql[0].sprintf($sql[1], rtrim($ids,',')).$entrys[0];
      }

      unset($sql);
      unset($entrys);
      unset($ids);
    }

      if (!empty($data['cor_id']))
      {
          $sql[0] = "<br><br>-- Einträge für creature_onkill_reputation<br><br>";
          $sql[1] = "DELETE FROM `creature_onkill_reputation` WHERE `{$field['cor_id']}` IN (%s);<br>";
          $entrys = array();
          $ids = '';

          if (is_array($data['cor_id']))
          {
              for ($i=0;$i < count($data['cor_id']);$i++)
              {
                  if (!isset($data['cor_id'][$i]))
                      continue;

                  $entrys [] = "INSERT INTO `creature_model_info` (`{$field['cor_id']}`,`{$field['cor_rokrf1']}`,`{$field['cor_ms1']}`,`{$field['cor_ita1']}`,`{$field['cor_rokrv1']}`,`{$field['cor_td']}`,`{$field['cor_rokrf2']}`,`{$field['cor_ms2']}`,`{$field['cor_ita2']}`,`{$field['cor_rokrv2']}`) VALUES ('{$data['cor_id'][$i]}','{$data['cor_rokrf1'][$i]}','{$data['cor_ms1'][$i]}','".($data['cor_ita1'][$i] ? 1 : 0)."','{$data['cor_rokrv1'][$i]}','{$data['cor_td'][$i]}','{$data['cor_rokrf2'][$i]}','{$data['cor_ms2'][$i]}','".($data['cor_ita2'][$i] ? 1 : 0)."','{$data['cor_rokrv2'][$i]}');<br>";
                  $ids .= "{$data['cor_id'][$i]},";
              }
              $res .= $sql[0].sprintf($sql[1], rtrim($ids,','));

              foreach ($entrys as $entry)
                  $res .= $entry;
          }else
          {
              $entrys [] = "INSERT INTO `creature_model_info` (`{$field['cor_id']}`,`{$field['cor_rokrf1']}`,`{$field['cor_ms1']}`,`{$field['cor_ita1']}`,`{$field['cor_rokrv1']}`,`{$field['cor_td']}`,`{$field['cor_rokrf2']}`,`{$field['cor_ms2']}`,`{$field['cor_ita2']}`,`{$field['cor_rokrv2']}`) VALUES ('{$data['cor_id']}','{$data['cor_rokrf1']}','{$data['cor_ms1']}','".($data['cor_ita1'] ? 1 : 0)."','{$data['cor_rokrv1']}','{$data['cor_td']}','{$data['cor_rokrf2']}','{$data['cor_ms2']}','".($data['cor_ita2'] ? 1 : 0)."','{$data['cor_rokrv2']}');<br>";
              $ids .= "{$data['cor_id']},";
              $res .= $sql[0].sprintf($sql[1], rtrim($ids,',')).$entrys[0];
          }

          unset($sql);
          unset($entrys);
          unset($ids);
      }

      if (!empty($data['cmi_id']))
      {
          $sql[0] = "<br><br>-- Einträge für creature_model_info<br><br>";
          $sql[1] = "DELETE FROM `creature_model_info` WHERE `{$field['cmi_id']}` IN (%s);<br>";
          $entrys = array();
          $ids = '';

          if (is_array($data['cmi_id']))
          {
              for ($i=0;$i < count($data['cmi_id']);$i++)
              {
                  if (!isset($data['cmi_id'][$i]))
                      continue;

                  $entrys [] = "INSERT INTO `creature_model_info` (`{$field['cmi_id']}`,`{$field['cmi_br']}`,`{$field['cmi_cr']}`,`{$field['cmi_g']}`,`{$field['cmi_mog']}`) VALUES ('{$data['cta_id'][$i]}','{$data['cmi_br'][$i]}','{$data['cmi_cr'][$i]}','{$data['cmi_g'][$i]}','{$data['cmi_mog'][$i]}');<br>";
                  $ids .= "{$data['cmi_id'][$i]},";
              }
              $res .= $sql[0].sprintf($sql[1], rtrim($ids,','));

              foreach ($entrys as $entry)
                  $res .= $entry;
          }else
          {
              $entrys [] = "INSERT INTO `creature_model_info` (`{$field['cmi_id']}`,`{$field['cmi_br']}`,`{$field['cmi_cr']}`,`{$field['cmi_g']}`,`{$field['cmi_mog']}`) VALUES ('{$data['cta_id']}','{$data['cmi_br']}','{$data['cmi_cr']}','{$data['cmi_g']}','{$data['cmi_mog']}');<br>";
              $ids .= "{$data['cmi_id']},";
              $res .= $sql[0].sprintf($sql[1], rtrim($ids,',')).$entrys[0];
          }

          unset($sql);
          unset($entrys);
          unset($ids);
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

      show_template('data', array('creature_sql' => $res, 'id' => 'creature'), 'default/sections/gen_sql_res.tpl');
  }
}
?>