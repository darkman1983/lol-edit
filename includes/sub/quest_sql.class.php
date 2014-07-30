<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class quest_sql
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
      $t_data = array_merge($t_data, $data[$i]);
      $i++;
    }
    $data = $t_data;
    $res  = '';

    foreach ( $data as $key => $tdata )
      $data [$key] = $db->quote_smart($tdata);

    if (!empty($data['q_id']))
    {

      $data['qloc_id'] = $data['q_id'];

      $sql[0]     = "-- Einträge für quest_template<br>";
      $sql[1]     = "DELETE FROM `quest_template` WHERE `{$field['q_id']}` = '{$data['q_id']}';";
      $sql[2]     = "DELETE FROM `creature_questender` WHERE `{$field['ci_invor_qid']}` = '{$data['q_id']}';";
      $sql[3]     = "DELETE FROM `creature_queststarter` WHERE `{$field['ci_qrel_qid']}` = '{$data['q_id']}';";
      $sql[4]     = "DELETE FROM `gameobject_questender` WHERE `{$field['go_invor_qid']}` = '{$data['q_id']}';";
      $sql[5]     = "DELETE FROM `gameobject_queststarter` WHERE `{$field['go_qrel_qid']}` = '{$data['q_id']}';";
      $sql[6]     = "<br>INSERT INTO `quest_template` (";

      $res        = '';
      $pa_1       = '';
      $pa_2       = '';
      $pa_3       = '';
      $pa_4       = '';
      $pa_5       = '';
      $pa_6       = '';
      $qloc_set   = false;

      foreach ($data as $k => $v)
      {
        if (strstr($k, 'qloc_') && !strstr($k, 'qloc_id'))
          $qloc_set = true;
        if (strstr($k, 'q_') && !strstr($k, 'qloc_'))
          $pa_1 .= "`{$field[$k]}`, ";
      }

      $pa_1    = rtrim($pa_1,', '). ") VALUES<br>(";

      foreach ($data as $dk => $dv)
      {
        if (strstr($dk, 'q_')  && !strstr($dk, 'qloc_'))
          $pa_2 .= "'{$dv}', ";
        if (is_array($dv))
        {
          print $dk." : ".print_r($dv)."<br>";
        }
        //print $dk." : ".$dv."<br>";
      }

      $pa_2     = rtrim($pa_2,', '). ");<br>";
      $sql[6]   .= $pa_1.$pa_2;

      foreach ($sql as $sq)
        $res .= "{$sq}<br>";

      if (isset($data['qg_id']))
      {
        $res .= "<br><br>-- Einträge für Questgeber<br><br>";
        $q_gi_sql = "INSERT INTO `%s` (`%s`,`%s`) VALUES ('%s','%s');<br>";

        if (is_array($data['qg_id']))
        {
          foreach ($data['qg_id'] as $v)
          {
            $giver_type = substr($v, 0, 1);
            $giver_id   = substr($v, 1);

            switch ($giver_type)
            {
              case 'c':
                $pa_5 .= sprintf($q_gi_sql, 'creature_queststarter', $field['ci_qrel_id'], $field['ci_qrel_qid'], $giver_id, $data['q_id']);
                break;
              case 'o':
                $pa_5 .= sprintf($q_gi_sql, 'gameobject_queststarter', $field['go_qrel_id'], $field['go_qrel_qid'], $giver_id, $data['q_id']);
                break;
              case 'i':
                $pa_5 .= "UPDATE `item_template` SET `startquest` = '{$data['q_id']}' WHERE `entry` = '{$giver_id}';<br>";
                break;
            }
          }
        }else
        {
          $giver_type = substr($data['qg_id'], 0, 1);
          $giver_id   = substr($data['qg_id'], 1);

          switch ($giver_type)
          {
            case 'c':
              $pa_5 .= sprintf($q_gi_sql, 'creature_queststarter', $field['ci_qrel_id'], $field['ci_qrel_qid'], $giver_id, $data['q_id']);
              break;
            case 'o':
              $pa_5 .= sprintf($q_gi_sql, 'gameobject_queststarter', $field['go_qrel_id'], $field['go_qrel_qid'], $giver_id, $data['q_id']);
              break;
            case 'i':
              $pa_5 .= "UPDATE `item_template` SET `startquest` = '{$data['q_id']}' WHERE `entry` = '{$giver_id}';<br>";
              break;
          }
        }
        $res .= $pa_5;
      }

      if (isset($data['qf_id']))
      {
        $res .= "<br><br>-- Einträge für Questnehmer<br><br>";
        $q_gi_sql = "INSERT INTO `%s` (`%s`,`%s`) VALUES ('%s','%s');<br>";

        if (is_array($data['qf_id']))
        {
          foreach ($data['qf_id'] as $v)
          {
            $finisher_type = substr($v, 0, 1);
            $finisher_id   = substr($v, 1);

            switch ($finisher_type)
            {
              case 'c':
                $pa_6 .= sprintf($q_gi_sql, 'creature_queststarter', $field['ci_qrel_id'], $field['ci_qrel_qid'], $finisher_id, $data['q_id']);
                break;
              case 'o':
                $pa_6 .= sprintf($q_gi_sql, 'gameobject_queststarter', $field['go_qrel_id'], $field['go_qrel_qid'], $finisher_id, $data['q_id']);
                break;
            }
          }
        }else
        {
          $finisher_type = substr($data['qf_id'], 0, 1);
          $finisher_id   = substr($data['qf_id'], 1);

          switch ($finisher_type)
          {
            case 'c':
              $pa_6 .= sprintf($q_gi_sql, 'creature_questender', $field['ci_invor_id'], $field['ci_invor_qid'], $finisher_id, $data['q_id']);
              break;
            case 'o':
              $pa_6 .= sprintf($q_gi_sql, 'gameobject_questender', $field['ci_invor_id'], $field['ci_invor_qid'], $finisher_id, $data['q_id']);
              break;
          }
        }
        $res .= $pa_6;
      }

      if ($qloc_set)
      {
        $res .= "<br>-- Einträge für locales_quest<br><br>";
        $res .= "DELETE FROM `locales_quest` WHERE `{$field['qloc_id']}` = '{$data['q_id']}';<br>";
        $res .= "INSERT INTO `locales_quest` (";

        foreach ($data as $kl => $vl)
        {
          if (strstr($kl, 'qloc_'))
            $pa_3 .= "`{$field[$kl]}`, ";
        }

        $pa_3 = rtrim($pa_3,', '). ") VALUES (";

        foreach ($data as $dkl => $dvl)
        {
          if (strstr($dkl, 'qloc_'))
            $pa_4 .= "'{$dvl}', ";
        }

        $pa_4  = rtrim($pa_4,', '). ");<br>";
        $res  .= $pa_3.$pa_4;
      }
    }

    show_template('data', array('quest_sql' => $res, 'id' => 'quest'), 'default/sections/gen_sql_res.tpl');
  }
}
?>