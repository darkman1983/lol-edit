<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

/**
 * @param $search
 * @param $arr
 * @param $exact
 * @param $trav_keys
 * @return unknown_type
 */
function array_search_ext ( $search, $arr, $exact = true, $trav_keys = null )
{
  if ( ! is_array ( $arr ) || ! $search || ( $trav_keys && ! is_array ( $trav_keys ) ) ) return false;
  $res_arr = array ();
  foreach ( $arr as $key => $val ) {
    $used_keys = $trav_keys ? array_merge ( $trav_keys, array ( $key ) ) : array ( $key );
    if ( ( $key === $search ) || ( ! $exact && ( strpos ( strtolower ( $key ), strtolower ( $search ) ) !== false ) ) ) $res_arr [ ] = array ( 'type' => "key", 'hit' => $key, 'keys' => $used_keys, 'val' => $val );
    if ( is_array ( $val ) && ( $children_res = array_search_ext ( $search, $val, $exact, $used_keys ) ) ) $res_arr = array_merge ( $res_arr, $children_res );
    else if ( ! is_array ( $val ) && ( ( $val === $search ) || ( ! $exact && ( strpos ( strtolower ( $val ), strtolower ( $search ) ) !== false ) ) ) ) $res_arr [ ] = array ( 'type' => "val", 'hit' => $val, 'keys' => $used_keys, 'val' => $val );
  }
  return $res_arr ? $res_arr : false;
}

function getRealIpAddr()
{
  if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
  {
    $ip=$_SERVER['HTTP_CLIENT_IP'];
  }
  elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
  {
    $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
  }
  else
  {
    $ip=$_SERVER['REMOTE_ADDR'];
  }
  return $ip;
}

function sha_password($username, $pass) {

  $username = strtoupper ( $username );
  $pass = strtoupper ( $pass );
  $SHA1P = ($username . ':' . $pass);

  return hash ( 'sha1', $SHA1P );
}

function show_template($arrname, $data, $template)
{
  global $smarty;

  if (!empty($data))
  {
    if (is_array($arrname))
    {
      for ($i=0;$i < count($data);$i++)
        $smarty->append($arrname[$i], $data[$i], true);
    }else
      $smarty->append($arrname, $data, true);
  }

  $smarty->display($template);
  exit();
}

function load_users()
{
  global $db;

  $load_users_sql = "SELECT `id`,`name` FROM `users` ORDER BY `name`";
  $load_users = $db->QueryArray ( $load_users_sql, MYSQL_NUM );

  return $load_users;
}

function create_user($data = false)
{
  global $db;

  if (empty($data))
    show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Üferprüfen!", 'error_ajax' => true), 'default/error.tpl');

  $password = sha_password($data['name'], $data['password']);
  $create_user_sql = "INSERT INTO `users` (`name`,`fullname`,`pass`,`level`) VALUES('{$data['name']}','{$data['fullname']}', '{$password}', '{$data['level']}')";
  $create_user = $db->Query ( $create_user_sql );

  if ($create_user)
    show_template('data', array('str' => "Der Benutzer: {$data['name']} wurde erfolgreich erstellt!"), 'default/ajax_response.tpl');

  show_template('info', array('error' => 'Fehler beim Erstellen des Benutzers!', 'error_ajax' => true), 'default/error.tpl');
}

function edit_user($data = false)
{
  global $db;

  if (empty($data))
    show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Üferprüfen!", 'error_ajax' => true), 'default/error.tpl');

  $password = !empty($data['password']) ? sprintf(",`pass` = '%s'", sha_password($data['name'], $data['password'])) : '';
  $update_user_sql = "UPDATE `users` SET `name` ='{$data['name']}',`fullname` ='{$data['fullname']}'{$password},`level` = '{$data['level']}' WHERE `id` = {$data['id']}";
  $update_user = $db->Query ( $update_user_sql );

  if ($update_user)
    show_template('data', array('str' => "Benutzerdaten wurden erfolgreich geupdated!"), 'default/ajax_response.tpl');

  show_template('info', array('error' => 'Fehler beim Updaten der Daten des Benutzers!', 'error_ajax' => true), 'default/error.tpl');
}

function del_user($data = false)
{
  global $db;

  if (empty($data))
    show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Üferprüfen!", 'error_ajax' => true), 'default/error.tpl');

  $ids = implode(",", $data['accs']);

  $del_user_sql = "DELETE u, ust, uss FROM users u LEFT JOIN user_settings ust ON ust.userid = u.id LEFT JOIN user_sessions uss ON uss.userid = u.id WHERE u.id IN({$ids})";
  $del_user = $db->Query ( $del_user_sql );

  show_template(array('is_acc_ajax','accounts'), array(true, load_users()), 'default/sections/settings.tpl');
}

function get_dialog($data = false, $ret_array = false)
{
  global $db, $smarty;

  if (empty($data))
    show_template('info', array('error' => "Kein Dialog ausgewählt!", 'error_ajax' => true), 'default/error.tpl');

  $ext_arr = array('upt_id' => @$data['upt_id'], 'gifi' => @$data['gifi'], 'ret' => @$data['ret']);
  $get = '';
  $get_sql = '';
  $template = '';

  $start = isset($data['start']) ? $data['start'] : 0;
  $itemperpage = isset($data['iperp']) ? $data['iperp'] : 50;
  $search = isset($data['searchterm']) ? $data['searchterm'] : '';

  switch ($data['dialog'])
  {
    case 'zone':
      $get_sql     = "SELECT * FROM `zones`";
      $template    = 'default/dialogs/dialog_zones.tpl';
      break;
    case 'quest_sort':
      $get_sql     = "SELECT * FROM `quest_sort`";
      $template    = 'default/dialogs/dialog_quest_sort.tpl';
      break;
    case 'quest_flags':
      $get_sql     = "SELECT * FROM `quest_flags`";
      $template    = 'default/dialogs/dialog_quest_flags.tpl';
      break;
    case 'zonesort':
      $get         = get_dialog(array('dialog' => 'quest_sort','upt_id' => $data['upt_id']), true);
      $template    = 'default/dialogs/dialog_zonesort.tpl';
      break;
    case 's_questgifi':
      $get         = array(array());
      $template    = 'default/dialogs/dialog_questgifi.tpl';
      break;
    case 's_questgifi_result':
      quest_gifi::search($data);
      break;
    case 'skillline':
      $get_sql     = "SELECT * FROM `skillline`";
      $template    = 'default/dialogs/dialog_skillline.tpl';
      break;
    case 'faction':
      $get_sql     = "SELECT * FROM `factions`";
      $template    = 'default/dialogs/dialog_faction.tpl';
      break;
    case 'race':
      $get_sql     = "SELECT * FROM `races`";
      $template    = 'default/dialogs/dialog_race.tpl';
      break;
    case 'class':
      $get_sql     = "SELECT * FROM `classes`";
      $template    = 'default/dialogs/dialog_class.tpl';
      break;
    case 'qtype':
      $get_sql     = "SELECT * FROM `quest_type`";
      $template    = 'default/dialogs/dialog_quest_type.tpl';
      break;
    case 'spell':
      $get         = array(array());
      $template    = 'default/dialogs/dialog_spell.tpl';
      break;
    case 'spell_result':
      $get_sql     = "SELECT * FROM `spells` WHERE `id` = '{$data['spell_id']}' OR `name` LIKE '%{$data['spell_name']}%'";
      $template    = 'default/dialogs/dialog_spell_result.tpl';
      break;
    case 'item':
      $get         = array(array());
      $template    = 'default/dialogs/dialog_item.tpl';
      break;
    case 'item_result':
      include_once("sub/item_func.php");
      item_search($data);
      break;
    case 'emote':
      $get_sql     = "SELECT * FROM `emotes`";
      $template    = 'default/dialogs/dialog_emote.tpl';
      break;
    case 'title':
      $get_sql     = "SELECT * FROM `titles`";
      $template    = 'default/dialogs/dialog_titles.tpl';
      break;
    case 'model':
      $get_sql     = "SELECT * FROM `creaturemodeldata` WHERE `name` LIKE '%{$search}%' OR `id` = '{$search}'";
      $get = $db->QueryArray($get_sql, MYSQL_ASSOC);
      $num = $db->RowCount();
      $ext_arr = array_merge($ext_arr, array('nav' => generate_pagination("index.php?mode=dialog&dialog=model&upt_id={$data['upt_id']}&searchterm={$search}", $num, $itemperpage, $start, true, true, 'dialog_content')));
      if (empty($get))
        $get = array();
      else
        $get = array_slice($get, $start, $itemperpage, true);
      show_template('dialog', array_merge($get,$ext_arr), 'default/dialogs/dialog_model.tpl');
      break;
    case 'model_result':
      include_once("sub/model_func.php");
      gen_model_data($data);
      break;
    case 'flagse':
      $get_sql     = "SELECT * FROM `creature_flags_extra`";
      $template    = 'default/dialogs/dialog_flagse.tpl';
      break;
    case 'cmeimmm':
      $get_sql     = "SELECT * FROM `mechanic_immune`";
      $template    = 'default/dialogs/dialog_immune.tpl';
      break;
    case 'cfamily':
      $get_sql     = "SELECT * FROM `creature_family`";
      $template    = 'default/dialogs/dialog_family.tpl';
      break;
    case 'cflag':
      $get_sql     = "SELECT * FROM `npc_flags`";
      $template    = 'default/dialogs/dialog_nflags.tpl';
      break;
    case 'ctype':
      $get_sql     = "SELECT * FROM `creature_type`";
      $template    = 'default/dialogs/dialog_creature_type.tpl';
      break;
    case 'c_eq':
      $get         = array(array());
      $template    = 'default/dialogs/dialog_creature_equip.tpl';
      break;
    case 'c_icon':
      $get_sql     = "SELECT * FROM `creature_icon`";
      $template    = 'default/dialogs/dialog_creature_icon.tpl';
      break;
    case 'g_type':
      $get_sql     = "SELECT * FROM `gameobject_type`";
      $template    = 'default/dialogs/dialog_gameobject_type.tpl';
      break;
    case 'g_type_desc':
     $default     = "Dieses Feld hat für den gewählten Gameobjekt Typ keinen Wert, also immer 0";
     $get_sql     = "SELECT `field_desc` FROM `gameobject_type_desc` WHERE `type` = {$data['g_typ']} AND `field` = {$data['field']}";
     $template    = 'default/dialogs/dialog_gameobject_type_desc.tpl';
     break;
    default:
      show_template('info', array('error' => "Der Dialog existiert nicht!", 'error_ajax' => true), 'default/error.tpl');
      break;
  }

  if (!empty($get_sql) && !empty($template))
  {
    $get = $db->QueryArray($get_sql, MYSQL_ASSOC);
    if (!$get && $data['dialog'] != 'g_type_desc')
     show_template('info', array('error' => "Fehler bei der Datenbankabfrage!<br>{$db->Error()}<br>{$get_sql}", 'error_ajax' => true), 'default/error.tpl');
    if (!$get && $data['dialog'] == 'g_type_desc')
     $get = array( 0 => array('field_desc' => $default));

    if ($ret_array)
      return $get;
  }

  show_template('dialog', array_merge($get,$ext_arr), $template);
}

function get_name ($id, $template, $locale = 3)
{
  global $db, $field;

  switch ($template)
  {
    case 'quest':
      $get_name_sql = "SELECT q.{$field['q_title']}, l.Title_loc3 as Title_loc FROM `dev_pve_world`.`quest_template` q LEFT JOIN (`dev_pve_world`.`locales_quest` l) ON l.{$field['qloc_id']}=q.{$field['q_id']} WHERE q.`{$field['q_id']}` = '{$id}'";
      break;
    case 'creature':
      $get_name_sql = "SELECT c.{$field['c_name']}, l.name_loc3 as l_name FROM `dev_pve_world`.`creature_template` c LEFT JOIN (`dev_pve_world`.`locales_creature` l) ON l.{$field['cloc_id']}=c.{$field['c_id']} WHERE c.`{$field['c_id']}` = '{$id}'";
      break;
    case 'gameobject':
     $get_name_sql = "SELECT g.{$field['g_name']}, l.name_loc3 as l_name FROM `dev_pve_world`.`gameobject_template` g LEFT JOIN (`dev_pve_world`.`locales_gameobject` l) ON l.{$field['gloc_id']}=g.{$field['g_id']} WHERE g.`{$field['g_id']}` = '{$id}'";
     break;
  }
  
  $get_name = $db->QuerySingleRowArray($get_name_sql, MYSQL_ASSOC);

  return $get_name;
}

function load_log ()
{
  global $db, $session;

  $lvl = $session->get_data('level');
  if (isset($lvl) && $lvl == 1)
    $get_log_sql = "SELECT * FROM `logs`";
  else $get_log_sql = "SELECT * FROM `logs` WHERE `user` = '{$session->get_data('id')}'";

  $get_log = $db->QueryArray($get_log_sql, MYSQL_ASSOC);

  return show_template('data', array('log' => $get_log), "default/sections/log.tpl");
}

function save_log($data, $silent = false, $usr_override = '')
{
  global $db, $session, $field;

  $u_name = $session->get_data('name');

  if (empty($u_name))
    return;
  switch ( $data ['desc_id'] )
   {
    case 'q_n' :
     $q_id = get_next_id ( $field ['q_id'], 'quest_template' );
     $desc = "Es wurde eine neue Quest mit der ID: {$q_id} erzeugt.";
     break;
    case 'c_n' :
     $c_id = get_next_id ( $field ['c_id'], 'creature_template' );
     $desc = "Es wurde eine neue Kreatur mit der ID: {$c_id} erzeugt.";
     break;
    case 'g_n' :
     $g_id = get_next_id ( $field ['g_id'], 'gameobject_template' );
     $desc = "Es wurde ein Gameobjekt mit der ID: {$g_id} erzeugt.";
     break; 
    case 'q_l' :
     $name = get_name ( $data ['id'], 'quest' );
     $name = ( ! empty ( $name ['Title_loc'] ) ) ? $name ['Title_loc'] : $name ['Title'];
     $desc = "Es wurde die Quest \"{$name}\" mit der ID: {$data['id']} geladen.";
     break;
    case 'c_l' :
     $name = get_name ( $data ['id'], 'creature' );
     $name = ( ! empty ( $name ['l_name'] ) ) ? $name ['l_name'] : $name ['name'];
     $desc = "Es wurde die Kreatur \"{$name}\" mit der ID: {$data['id']} geladen.";
     break;
    case 'g_l' :
     $name = get_name ( $data ['id'], 'gameobject' );
     $name = ( ! empty ( $name ['l_name'] ) ) ? $name ['l_name'] : $name ['name'];
     $desc = "Es wurde das Gameobjekt \"{$name}\" mit der ID: {$data['id']} geladen.";
     break;
    case 'q_s' :
     $desc = "Es wurde eine Questsuche ausgeführt";
     break;
    case 'c_s' :
     $desc = "Es wurde eine Kreaturensuche ausgeführt";
     break;
    case 'g_s' :
     $desc = "Es wurde eine Gameobjektsuche ausgeführt";
     break;
    case 'u_li' :
     $desc = "Der Benutzer hat sich eingeloggt";
     break;
    case 'u_lo' :
     $desc = "Der Benutzer hat sich ausgeloggt";
     break;
    case 'u_alo' :
     $desc = "Der Benutzer wurde wegen inaktivität ausgeloggt";
     break;
    case 'u_sqsav' :
     $desc = "Es wurde die SQL-Datei: {$data['file_nam']} gespeichert.";
     break;
    case 'u_sqdelp' :
     $desc = $data ['file_str'];
     break;
    case 'u_sqdels' :
     $desc = $data ['file_str'];
     break;
   }

  $date         = time();
  $usr_id       = !empty($usr_override) ? $usr_override : $session->get_data('id');
  $save_log_sql = "INSERT INTO `logs` (`date`,`description`,`user`,`name`) VALUES('{$date}','{$desc}','{$usr_id }','{$u_name}')";
  $save_log     = $db->Query($save_log_sql);

  if (!$silent)
    load_log();
}

function generate_sql($data)
{
  switch ($data['tpl'])
  {
    case 'quest':
      quest_sql::gen_sql($data);
      break;
    case 'creature':
      creature_sql::gen_sql($data);
      break;
    case 'gameobject':
      gameobject_sql::gen_sql($data);
      break;
    case 'item':
      @require_once('sub/gen_item_sql.php');
      gen_item_sql($data);
      break;
  }
}

function isJson($var) {
  return ((is_string($var) && (is_object(json_decode($var)) || is_array(json_decode($var))))) ? true : false;
}

function replace_db_field_content()
{
  global $db;
  $get_sql = "SELECT ci.id, cm.field_2 AS name FROM `dbc335enGB`.`creaturedisplayinfo` ci LEFT JOIN (`dbc335enGB`.`creaturemodeldata` cm) ON cm.id=ci.modeldata_id1";
  $get_data = $db->QueryArray($get_sql, MYSQL_ASSOC);

  foreach ($get_data as $data)
  {
    if (strstr($data['name'], "\\"))
    {
      $new_data = '';
      $tmp   = explode("\\",$data['name']);
      $final = rtrim($tmp[(count($tmp)-1)], '.mdx');

      $new_data = ucfirst($final);
      $update_sql = "INSERT IGNORE `creaturemodeldata` VALUES('{$data['id']}','{$final}')";
      $update = $db->Query($update_sql);
    }
  }
  print "OK, DONE!";
}

//##########################################################################################
// Generate paging navigation.
// Original from PHPBB with some modifications to make them more simple
/**
 * @param $base_url
 * @param $num_items
 * @param $per_page
 * @param $start_item
 * @param $add_prevnext_text
 * @param $thash
 * @param $tcs
 * @return page_navigation
 */
function generate_pagination ( $base_url, $num_items, $per_page, $start_item, $add_prevnext_text = true, $ajax = false, $div_id = '' )
{
  if ( ! $num_items ) return "";
  $total_pages = ceil ( $num_items / $per_page );
  if ( $total_pages == 1 ) {
    return "";
  }
  $on_page = floor ( $start_item / $per_page ) + 1;
  $page_string = "";
  if ( $total_pages > 10 ) {
    $init_page_max = ( $total_pages > 3 ) ? 3 : $total_pages;
    for ( $i = 1; $i < $init_page_max + 1; $i ++ ) {
      $page_string .= ( $i == $on_page ) ? "<b>{$i}</b>" : ( ( $ajax && ! empty ( $div_id ) ) ? "<a href=\"javascript:void(null);\" onclick=\"new Ajax.Updater('{$div_id}', '{$base_url}&amp;start=" . ( ( $i - 1 ) * $per_page ) . "', {method: 'get', evalScripts: true})\">{$i}</a>" : "<a href=\"$base_url&amp;start=" . ( ( $i - 1 ) * $per_page ) . "\">{$i}</a>" );
      if ( $i < $init_page_max ) {
        $page_string .= ", ";
      }
    }
    if ( $total_pages > 3 ) {
      if ( $on_page > 1 && $on_page < $total_pages ) {
        $page_string .= ( $on_page > 5 ) ? " ... " : ", ";
        $init_page_min = ( $on_page > 4 ) ? $on_page : 5;
        $init_page_max = ( $on_page < $total_pages - 4 ) ? $on_page : $total_pages - 4;
        for ( $i = $init_page_min - 1; $i < $init_page_max + 2; $i ++ ) {
          $page_string .= ( $i == $on_page ) ? "<b>{$i}</b>" : ( ( $ajax && ! empty ( $div_id ) ) ? "<a href=\"javascript:void(null);\" onclick=\"new Ajax.Updater('{$div_id}', '{$base_url}&amp;start=" . ( ( $i - 1 ) * $per_page ) . "', {method: 'get', evalScripts: true})\">{$i}</a>" : "<a href=\"$base_url&amp;start=" . ( ( $i - 1 ) * $per_page ) . "\">{$i}</a>" );
          if ( $i < $init_page_max + 1 ) $page_string .= ", ";
        }
        $page_string .= ( $on_page < $total_pages - 4 ) ? " ... " : ", ";
      }
      else
        $page_string .= " ... ";
      for ( $i = $total_pages - 2; $i < $total_pages + 1; $i ++ ) {
        $page_string .= ( $i == $on_page ) ? "<b>{$i}</b>" : ( ( $ajax && ! empty ( $div_id ) ) ? "<a href=\"javascript:void(null);\" onclick=\"new Ajax.Updater('{$div_id}', '{$base_url}&amp;start=" . ( ( $i - 1 ) * $per_page ) . "', {method: 'get', evalScripts: true})\">{$i}</a>" : "<a href=\"$base_url&amp;start=" . ( ( $i - 1 ) * $per_page ) . "\">{$i}</a>" );
        if ( $i < $total_pages ) {
          $page_string .= ", ";
        }
      }
    }
  }
  else {
    for ( $i = 1; $i < $total_pages + 1; $i ++ ) {
      $page_string .= ( $i == $on_page ) ? "<b>{$i}</b>" : ( ( $ajax && ! empty ( $div_id ) ) ? "<a href=\"javascript:void(null);\" onclick=\"new Ajax.Updater('{$div_id}', '{$base_url}&amp;start=" . ( ( $i - 1 ) * $per_page ) . "', {method: 'get', evalScripts: true})\">{$i}</a>" : "<a href=\"$base_url&amp;start=" . ( ( $i - 1 ) * $per_page ) . "\">{$i}</a>" );
      if ( $i < $total_pages ) $page_string .= ", ";
    }
  }
  if ( $add_prevnext_text ) {
    if ( $on_page > 1 ) {

      $page_string = ( $ajax && ! empty ( $div_id ) ) ? " <a href=\"javascript:void(null);\" onclick=\"new Ajax.Updater('{$div_id}', '{$base_url}&amp;start=" . ( ( $on_page - 2 ) * $per_page ) . "', {method: 'get', evalScripts: true})\">Zurück</a>&nbsp;&nbsp;" . $page_string : " <a href=\"$base_url&amp;start=" . ( ( $on_page - 2 ) * $per_page ) . "\">Zurück</a>&nbsp;&nbsp;" . $page_string;
    }
    if ( $on_page < $total_pages ) {
      $page_string .= ( $ajax && ! empty ( $div_id ) ) ? "&nbsp;&nbsp;<a href=\"javascript:void(null);\" onclick=\"new Ajax.Updater('{$div_id}', '{$base_url}&amp;start=" . ( $on_page * $per_page ) . "', {method: 'get', evalScripts: true})\">Weiter</a>" : "&nbsp;&nbsp;<a href=\"$base_url&amp;start=" . ( $on_page * $per_page ) . "\">Weiter</a>";
    }
  }
  $page_string = "Seite: " . $page_string;
  return $page_string;
}

function load_locale($data = false)
{
  global $db, $field;

  if (empty($data['locale']) || empty($data['which']))
    show_template('info', array('error' => "Fehler: Sprache oder Tabelle leer!", 'error_ajax' => true), 'default/error.tpl');

  $table                = 'locales_';
  $get_quest_locale_sql = '';
  $l_parts              = '';
  $loc_assign           = array();
  $loc                  = array();

  switch ($data['locale'])
  {
    case '1':
      $loc = array('loc' => 'Koreanisch', 'locn' => 1);
      break;
    case '2':
      $loc = array('loc' => 'Französisch', 'locn' => 2);
      break;
    case '3':
      $loc = array('loc' => 'Deutsch', 'locn' => 3);
      break;
    case '4':
      $loc = array('loc' => 'Chinesisch', 'locn' => 4);
      break;
    case '5':
      $loc = array('loc' => 'Taiwanesisch', 'locn' => 5);
      break;
    case '6':
      $loc = array('loc' => 'Spanisch', 'locn' => 6);
      break;
    case '7':
      $loc = array('loc' => 'Spanisch lat. Amerika', 'locn' => 7);
      break;
    case '8':
      $loc = array('loc' => 'Russisch', 'locn' => 8);
      break;
  }

  switch ($data['which'])
  {
    case 'c':
      $table .= "creature";
      break;
    case 'ct':
      $table .= "creature_text";
      break;
    case 'g':
      $table .= "gameobject";
      break;
    case 'gmo':
      $table .= "gossip_menu_option";
      break;
    case 'i':
      $table .= "item";
      break;
    case 'isn':
      $table .= "item_set_names";
      break;
    case 'no':
      $table .= "npc_option";
      break;
    case 'nt':
      $table .= "npc_text";
      break;
    case 'pt':
      $table .= "page_text";
      break;
    case 'poi':
      $table .= "points_of_interest";
      break;
    case 'q':
      $table .= "quest";
      break;
  }

  foreach ($field as $k => $f)
    if (strstr($k, "{$data['which']}loc_") && strstr($f, "loc{$data['locale']}"))
    {
      $as = str_replace("_loc{$data['locale']}", '', $f);
      $as = preg_replace(array('/%_loc(\d+)%/', '%tails(\d+)%', '%tle(\d+)%'), array('','tails','tle'), $as);
       
      $loc_assign["{$as}_fid"] = $f;
      $l_parts .= "{$f} as {$as}, ";
    }
     
    $l_parts = rtrim($l_parts,', ');

    $get_locale_sql = "SELECT {$l_parts} FROM `dev_pve_world`.`{$table}` WHERE `{$field["{$data['which']}loc_id"]}` = '{$data["{$data['which']}loc_id"]}'";

    if (!empty($data["{$data['which']}loc_id"]) && !empty($get_locale_sql))
      $get_locale = $db->QuerySingleRowArray($get_locale_sql, MYSQL_ASSOC );
    else $get_locale = array();

    if (!$get_locale)
      $get_locale = array();

    show_template('data', @array_merge($loc,$get_locale, $loc_assign), "default/sections/{$table}.tpl");
}

function get_next_id($id, $tpl)
{
  global $db;

  $get_id_sql = "SELECT `{$id}` FROM `dev_pve_world`.`{$tpl}` ORDER BY `{$id}` DESC LIMIT 0, 1";
  $get_id = $db->QuerySingleValue($get_id_sql);

  $n_id = $get_id+1;

  return $n_id;
}

/**
 * This function uses the array below to calculate the pixel width of a string
 * of characters. The widths of each character are based on a 12px Helvetica font.
 * Kerning is not taken into account so RESULTS ARE APPROXIMATE.
 *
 * The purpose is to return a relative size to help in formatting. For example,
 *
 * strPixels('I like cake') == 54
 * strPixels('I LIKE CAKE') == 67
 *
 * @param string $string characters to measure size
 *
 * @return integer size in pixels.
 */
$strPixelWidths = array(
        " " => 3, "!" => 3, '"' => 4, "#" => 7, "$" => 7, "%" => 11, "&" => 8, "'" => 2, "(" => 4, ")" => 4, "*" => 5, "+" => 7, "," => 3, "-" => 4,
        "." => 3, "/" => 3, "0" => 7, "1" => 7, "2" => 7, "3" => 7, "4" => 7, "5" => 7, "6" => 7, "7" => 7, "8" => 7, "9" => 7, ":" => 3, ";" => 3,
        "<" => 7, "=" => 7, ">" => 7, "?" => 7, "@" => 12, "A" => 7, "B" => 8, "C" => 9, "D" => 9, "E" => 8, "F" => 7, "G" => 9, "H" => 9, "I" => 3,
        "J" => 6, "K" => 8, "L" => 7, "M" => 9, "N" => 9, "O" => 9, "P" => 8, "Q" => 9, "R" => 9, "S" => 8, "T" => 7, "U" => 9, "V" => 7, "W" => 11,
        "X" => 7, "Y" => 7, "Z" => 7, "[" => 3, "]" => 3, "\\" => 3, "^" => 5, "_" => 7, "`" => 4, "a" => 7, "b" => 7, "c" => 6, "d" => 7, "e" => 7,
        "f" => 3, "g" => 7, "h" => 7, "i" => 3, "j" => 3, "k" => 6, "l" => 3, "m" => 11, "n" => 7, "o" => 7, "p" => 7, "q" => 7, "r" => 4, "s" => 7,
        "t" => 3, "u" => 7, "v" => 5, "w" => 9, "x" => 5, "y" => 5, "z" => 5, "{" => 4, "|" => 3, "}" => 4, "~" => 7);

function strPixels($string) {
  $weight = 0;
  if (!empty($string)) {
    for ($i = 0; $i < strlen($string); $i++) {
      $w = $strPixelWidths[substr($string, $i, 1)];
      if ($w) $weight += $w;
    }
  }

  return $weight;
}
?>