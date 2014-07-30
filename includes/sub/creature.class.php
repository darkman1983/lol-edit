<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT')) {
    exit;
}

class creature
{
    public static function creature_search($data = false)
    {
        global $db, $field, $world_db;

        if (empty($data))
            show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Überprüfen!", 'error_ajax' => true), 'default/error.tpl');

        $sql_parts = ' WHERE';
        $last_length = 6;

        foreach ($data as $key => $value) {
            if (!empty($value)) {
                switch ($key) {
                    case 'cs_subm':
                    case 'cs_reset':
                        break;
                    case 'c_id':
                        $sql_parts .= " c.`{$field['c_id']}` = '{$value}'";
                        break;
                    case 'c_name':
                        $sql_parts .= " `{$field['c_name']}` LIKE '%{$value}%' OR `{$field['cloc_name3']}` LIKE '%{$value}%'";
                        break;
                    case 'c_subn':
                        $sql_parts .= " `{$field['c_subn']}` LIKE '%{$value}%' OR `{$field['cloc_subn3']}` LIKE '%{$value}%'";
                        break;
                    case 'c_flag':
                        switch (@$data['c_flag_exco']) {
                            case 'exa':
                                $sql_parts .= " `{$field['c_flag']}` = '{$value}'";
                                break;
                            case 'con':
                                $sql_parts .= " (`{$field['c_flag']}` & {$value}) = '{$value}'";
                                break;
                            default:
                                $sql_parts .= " `{$field['c_flag']}` = '{$value}'";
                                break;
                        }
                        break;
                }
            }
            if (strlen($sql_parts) > $last_length) {
                $sql_parts .= ' OR';
                $last_length = strlen($sql_parts);
            }
        }

        $sql_parts = rtrim($sql_parts, ' OR');
        $sql_parts = rtrim($sql_parts, ' WHERE');

        if (empty($sql_parts))
            show_template('info', array('error' => "Du musst etwas zum Suchen Eingeben!", 'error_ajax' => true), 'default/error.tpl');

        $get_tpl_datas_sql = "SELECT c.{$field['c_id']}, c.{$field['c_name']}, l.{$field['cloc_name3']}, c.{$field['c_subn']}, l.{$field['cloc_subn3']}, c.{$field['c_flag']}, c.{$field['c_milvl']}, c.{$field['c_malvl']} FROM `{$world_db}`.`creature_template` c LEFT JOIN (`{$world_db}`.`locales_creature` l) ON l.entry=c.{$field['c_id']}{$sql_parts} LIMIT 0, 200";

        $get_tpl_datas = $db->QueryArray($get_tpl_datas_sql, MYSQL_ASSOC);

        if (!$get_tpl_datas)
            show_template('info', array('error' => "Es wurden keine Ergebnisse gefunden.<br>Fehler bei der Dantenbankabfrage der Kreaturen: {$db->Error()}", 'error_ajax' => true), 'default/error.tpl');

        show_template('creature_data', $get_tpl_datas, 'default/sections/creature_search_result.tpl');
    }

    public static function creature_new()
    {
        global $field;

        show_template('data', array('next_id' => get_next_id($field['c_id'], 'creature_template')), 'default/sections/creature_new.tpl');
    }

    public static function creature_load($data = false)
    {
        global $db, $field, $world_db;

        $get_tpl_sql = "SELECT * FROM `{$world_db}`.`%s` WHERE `%s` = '{$data['cselected']}'";
        $template = '';

        switch ($data['tpl']) {
            case 'main':
                $get_tpl_sql = sprintf($get_tpl_sql, 'creature_template', $field['c_id']);
                $template = "creature_main";
                break;
            case 'addon_tpl':
                $get_tpl_sql = sprintf($get_tpl_sql, 'creature_template_addon', $field['cta_id']);
                self::creature_template_addon($db->QueryArray($get_tpl_sql, MYSQL_ASSOC), true);
                break;
            case 'equip_tpl':
                $get_tpl_sql = sprintf($get_tpl_sql, 'creature_equip_template', $field['ceq_id']);
                self::creature_equip_template($db->QueryArray($get_tpl_sql, MYSQL_ASSOC), true);
                break;
            case 'onkill_rep':
                $get_tpl_sql = sprintf($get_tpl_sql, 'creature_onkill_reputation', $field['cor_id']);
                self::creature_onkill_reputation($db->QueryArray($get_tpl_sql, MYSQL_ASSOC), true);
                break;
            case 'model_info':
                $get_tpl_sql = "SELECT * FROM `{$world_db}`.`creature_model_info` WHERE `{$field['cmi_id']}` =(SELECT `{$field['c_m_id1']}` FROM `{$world_db}`.`creature_template` WHERE entry = '{$data['cselected']}') OR `{$field['cmi_id']}` =(SELECT `{$field['c_m_id2']}` FROM `{$world_db}`.`creature_template` WHERE entry = '{$data['cselected']}') OR `{$field['cmi_id']}` =(SELECT `{$field['c_m_id3']}` FROM `{$world_db}`.`creature_template` WHERE entry = '{$data['cselected']}') OR `{$field['cmi_id']}` =(SELECT `{$field['c_m_id4']}` FROM `{$world_db}`.`creature_template` WHERE `{$field['c_id']}` = '{$data['cselected']}')";
                self::creature_model_info($db->QueryArray($get_tpl_sql, MYSQL_ASSOC), true);
                break;
            default:
                $get_tpl_sql = sprintf($get_tpl_sql, 'creature_template', $field['c_id']);
                $template = "creature_main";
                break;
        }

        if (!empty($template))
            show_template('data', isset($data['cselected']) ? $db->QuerySingleRowArray($get_tpl_sql, MYSQL_ASSOC) : '', "default/sections/{$template}.tpl");

        exit();
    }

    public static function creature_template_addon($data, $load = false)
    {
        global $field;

        $new_data = array('ajax' => true);
        if (isset($data)) {
            foreach ($data as $cur_data) {
                if (!empty($cur_data[$field['cta_id']]))
                    $new_data[] = array('uniqid' => uniqid(), $field['cta_id'] => $cur_data[$field['cta_id']], $field['cta_path'] => $cur_data[$field['cta_path']], $field['cta_mnt'] => $cur_data[$field['cta_mnt']], $field['cta_bt1'] => $cur_data[$field['cta_bt1']], $field['cta_bt2'] => $cur_data[$field['cta_bt2']], $field['cta_em'] => $cur_data[$field['cta_em']], $field['cta_au'] => $cur_data[$field['cta_au']]);
            }
        }

        if ($load)
            unset($new_data['ajax']);

        show_template('data', $new_data, "default/sections/creature_template_addon_content.tpl");
    }

    public static function creature_equip_template($data, $load = false)
    {
        global $field;

        $new_data = array('ajax' => true);
        if (isset($data)) {
            foreach ($data as $cur_data) {

                if (!empty($cur_data[$field['ceq_id']]))
                    $new_data[] = array('uniqid' => uniqid(), $field['ceq_id'] => $cur_data[$field['ceq_id']], $field['ceq_id2'] => $cur_data[$field['ceq_id2']], $field['ceq_ient1'] => $cur_data[$field['ceq_ient1']], $field['ceq_ient2'] => $cur_data[$field['ceq_ient2']], $field['ceq_ient3'] => $cur_data[$field['ceq_ient3']]);
            }
        }

        if ($load)
            unset($new_data['ajax']);

        show_template('data', $new_data, "default/sections/creature_equip_content.tpl");
    }

    public static function creature_onkill_reputation($data, $load = false)
    {
        global $field;

        $new_data = array('ajax' => true);

        if (isset($data)) {
            foreach ($data as $cur_data) {
                if (!empty($cur_data[$field['cor_id']]))
                    $new_data[] = array('uniqid' => uniqid(), $field['cor_id'] => $cur_data[$field['cor_id']], $field['cor_ita1'] => $cur_data[$field['cor_ita1']], $field['cor_ita2'] => $cur_data[$field['cor_ita2']], $field['cor_ms1'] => $cur_data[$field['cor_ms1']], $field['cor_ms2'] => $cur_data[$field['cor_ms2']], $field['cor_rokrf1'] => $cur_data[$field['cor_rokrf1']], $field['cor_rokrf2'] => $cur_data[$field['cor_rokrf2']], $field['cor_rokrv1'] => $cur_data[$field['cor_rokrv1']], $field['cor_rokrv2'] => $cur_data[$field['cor_rokrv2']], $field['cor_td'] => $cur_data[$field['cor_td']]);
            }
        }

        if ($load)
            unset($new_data['ajax']);

        show_template('data', $new_data, "default/sections/creature_onkill_rep_content.tpl");
    }

    public static function creature_addon($data, $load = false)
    {
        global $field;

        $new_data = array('ajax' => true);
        if (isset($data)) {
            foreach ($data as $cur_data) {
                if (!empty($cur_data[$field['cad_id']]))
                    $new_data[] = array('uniqid' => uniqid(), $field['cad_id'] => $cur_data[$field['cad_id']], $field['cad_path'] => $cur_data[$field['cad_path']], $field['cad_mnt'] => $cur_data[$field['cad_mnt']], $field['cad_bt1'] => $cur_data[$field['cad_bt1']], $field['cad_bt2'] => $cur_data[$field['cad_bt2']], $field['cad_em'] => $cur_data[$field['cad_em']], $field['cad_au'] => $cur_data[$field['cad_au']]);
            }
        }

        if ($load)
            unset($new_data['ajax']);

        show_template('data', $new_data, "default/sections/creature_addon_content.tpl");
    }

    public static function creature_model_info($data, $load = false)
    {
        global $field;

        $new_data = array('ajax' => true);

        if (isset($data)) {
            foreach ($data as $cur_data) {
                if (!empty($cur_data[$field['cmi_id']]))
                    $new_data[] = array('uniqid' => uniqid(), $field['cmi_id'] => $cur_data[$field['cmi_id']], $field['cmi_br'] => $cur_data[$field['cmi_br']], $field['cmi_cr'] => $cur_data[$field['cmi_cr']], $field['cmi_g'] => $cur_data[$field['cmi_g']], $field['cmi_mog'] => $cur_data[$field['cmi_mog']]);
            }
        }

        if ($load)
            unset($new_data['ajax']);

        show_template('data', $new_data, "default/sections/creature_model_info_content.tpl");
    }
}

?>