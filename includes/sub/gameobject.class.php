<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT')) {
    exit;
}

class gameobject
{
    public static function gameobject_search($data = false)
    {
        global $db, $field;

        if (empty($data))
            show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Überprüfen!", 'error_ajax' => true), 'default/error.tpl');

        $sql_parts = ' WHERE';
        $last_length = 6;
        
    foreach ( $data as $key => $value )
     {
      if ( ! empty ( $value ) )
       {
        switch ( $key )
         {
          case 'gs_subm' :
          case 'gs_reset' :
           break;
          case 'g_id' :
           $sql_parts .= " g.`{$field['g_id']}` = '{$value}'";
           break;
          case 'g_name' :
           $sql_parts .= " `{$field['g_name']}` LIKE '%{$value}%' OR `{$field['gloc_name3']}` LIKE '%{$value}%'";
           break;
          case 'g_typ' :
           $sql_parts .= " `{$field['g_typ']}` = '{$value}'";
           break;
          case 'g_fac' :
           $sql_parts .= " `{$field['g_fac']}` = '{$value}'";
           break;
          case 'g_dat0' :
           $sql_parts .= " `{$field['g_dat0']}` = '{$value}'";
           break;
          case 'g_dat1' :
           $sql_parts .= " `{$field['g_dat1']}` = '{$value}'";
           break;
          case 'g_dat2' :
           $sql_parts .= " `{$field['g_dat2']}` = '{$value}'";
           break;
         }
       }
       
      if ( strlen ( $sql_parts ) > $last_length )
       {
        $sql_parts .= ' OR';
        $last_length = strlen ( $sql_parts );
       }
     }

        $sql_parts = rtrim($sql_parts, ' OR');
        $sql_parts = rtrim($sql_parts, ' WHERE');

        if (empty($sql_parts))
            show_template('info', array('error' => "Du musst etwas zum Suchen Eingeben!", 'error_ajax' => true), 'default/error.tpl');

        $get_tpl_datas_sql = "SELECT g.{$field['g_id']}, g.{$field['g_name']}, l.{$field['gloc_name3']}, g.{$field['g_typ']} as gtype, (SELECT `name` FROM `loledit`.`gameobject_type` WHERE `type` = gtype) as {$field['g_typ']}, g.{$field['g_fac']} FROM `dev_pve_world`.`gameobject_template` g LEFT JOIN (`dev_pve_world`.`locales_gameobject` l) ON l.entry=g.{$field['g_id']}{$sql_parts} LIMIT 0, 200";
        $get_tpl_datas = $db->QueryArray($get_tpl_datas_sql, MYSQL_ASSOC);

        if (!$get_tpl_datas)
            show_template('info', array('error' => "Es wurden keine Ergebnisse gefunden.<br>Fehler bei der Dantenbankabfrage der Gameobjekte: {$db->Error()}", 'error_ajax' => true), 'default/error.tpl');

        show_template('gameobject_data', $get_tpl_datas, 'default/sections/gameobject_search_result.tpl');
    }

    public static function gameobject_new()
    {
        global $field;

        show_template('data', array('next_id' => get_next_id($field['g_id'], 'gameobject_template')), 'default/sections/gameobject_new.tpl');
    }

    public static function gameobject_load($data = false)
    {
        global $db, $field;


        $get_tpl_sql = "SELECT * FROM `dev_pve_world`.`%s` WHERE `%s` = '{$data['gselected']}'";
        $template = '';

        switch ($data['tpl']) {
            case 'main':
                $get_tpl_sql = sprintf($get_tpl_sql, 'gameobject_template', $field['g_id']);
                $template = "gameobject_main";
                break;
            default:
                $get_tpl_sql = sprintf($get_tpl_sql, 'gameobject_template', $field['g_id']);
                $template = "gameobject_main";
                break;
        }

        if (!empty($template))
            show_template('data', isset($data['gselected']) ? $db->QuerySingleRowArray($get_tpl_sql, MYSQL_ASSOC) : '', "default/sections/{$template}.tpl");

        exit();
    }
}

?>