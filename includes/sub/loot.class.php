<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class loot
{
  private static $tbl      = array('creature_loot_template', 'disenchant_loot_template', 'fishing_loot_template', 'gameobject_loot_template', 'item_loot_template', 'pickpocketing_loot_template', 'prospecting_loot_template', 'skinning_loot_template', 'quest_mail_loot_template', 'reference_loot_template', 'milling_loot_template');
  private static $tbl_desc = array('Kreatur', 'Verzauberkunst', 'Angeln', 'Gameobjekt', 'Gegenstand', 'Taschendiebstahl', 'Sondieren', 'Häuten', 'Quest Mail', 'Referenz Loot', 'Kräuter Zermahlen');

  public static function load($data = false)
  {
    global $db, $field;

    if (empty($data))
      show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Überprüfen!", 'error_ajax' => true), 'default/error.tpl');

    $result   = array();
    $desc     = array();
    $refs     = array();
    $load_sql = "SELECT * FROM `dev_pve_world`.`%s` WHERE entry = %s OR mincountOrRef LIKE '%s'";
    $ref_sq   = "SELECT * FROM `dev_pve_world`.`reference_loot_template` WHERE `entry` = %s";

    if (isset($data['type']) && $data['type'] == 'all')
    {
      foreach (self::$tbl as $ttbl)
      {

        $load_sql = sprintf($load_sql, $ttbl, $data['id'], "%{$data['id']}%");
        $load     = $db->QueryArray($load_sql, MYSQL_ASSOC);

        if ($load)
          foreach ($load as $key => $val)
          {
            $load[$key] = array_merge(array('uniqid' => uniqid()), $val);

            if ($ttbl != 'reference_loot_template' && $val['mincountOrRef'] < 0)
            {
              $mioref = str_replace('-', '', $val['mincountOrRef']);

              $ref_sql = sprintf($ref_sq, $mioref);
              $ref     = $db->QueryArray($ref_sql, MYSQL_ASSOC);

              if ($ref)
                $refs    = array_merge($refs, $ref);
            }
          }

          $result [$ttbl] = $load;

          if (!isset($result['reference_loot_template']) && !empty($refs))
            $result['reference_loot_template'] = $refs;
      }
    }else {
      if (empty($data['type']))
        show_template('info', array('error' => "Fehler: Der Typ des Loots fehlt!", 'error_ajax' => true), 'default/error.tpl');

      $load_sql = sprintf($load_sql, $data['type'], $data['id'], "%{$data['id']}%");
      $load     = $db->QueryArray($load_sql, MYSQL_ASSOC);

      if ($load)
        foreach ($load as $key => $val)
        {
          $load[$key] = array_merge(array('uniqid' => uniqid()), $val);

          if ($data['type'] != 'reference_loot_template' && $val['mincountOrRef'] < 0)
          {
            $mioref = str_replace('-', '', $val['mincountOrRef']);

            $ref_sql = sprintf($ref_sq, $mioref);
            $ref     = $db->QueryArray($ref_sql, MYSQL_ASSOC);

            if ($ref)
              $refs    = array_merge($refs, $ref);
          }
        }

        $result [$data['type']] = $load;

        if (!isset($result['reference_loot_template']) && !empty($refs))
          $result['reference_loot_template'] = $refs;
    }

    foreach (self::$tbl_desc as $key => $t_desc)
    {
      $ttbl = self::$tbl;
      $desc [$ttbl[$key]] = $t_desc;
    }

    show_template('data', array('desc' => $desc, 'res' => $result), 'default/sections/loot_content.tpl');
  }

  public static function add($data = false)
  {
    global $db, $field;

  }
}
?>