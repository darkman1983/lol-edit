<?php
ini_set('display_errors', '1');
error_reporting(E_ALL);

define ( 'IN_LOLEDIT', true );

$path   = realpath(dirname(__FILE__));
$date_f = date("d-m-Y");

// Default language
$DEFAULT_LANGUAGE = 'en';
// Languages directory
$LANGUAGE_DIR = 'language';

// Initialize the Classloader
include("includes/classloader.php");

//Initialize error handler as first
$handler = new error_handler("127.0.0.1",0,14,NULL,"{$path}/logs/error_log-{$date_f}.log");
set_error_handler(array(&$handler, "handler"));

//Start Session as second and before language
$session = new session();

// Connect to Database
include("includes/db_connect.php");

// Make all $_POST & $_GET injection secured
include("includes/injection_secure.php");

// Initialze language before functions
$language = new language();
$lang = $language->getLanguage(@$_POST['lang']);

include("includes/functions.php");
include("template.php");

$world_db = get_world();

$mode = isset ( $_GET ['mode'] ) ? $_GET ['mode'] : false;

$smarty->assign('info');
$smarty->assign('data');
$smarty->assign('lang', $lang);

$logged_in = $session->auth (array_merge($_GET, $_POST));

//Load field associations into template engine
$db_fields = new dbfield_assign();
$field = dbfield_assign::$field;
$smarty->assign('fields', $field);

switch ($mode) {
  case 'login' :
    $logged_in = $session->login ( $_POST );
    break;
  case 'create_user' :
    if ($session->get_data('level') == 1)
      $created = create_user($_POST);
    else
      show_template('info', array('error' => "Fehler: Leider keine Berechtigung!", 'error_ajax' => true), 'default/error.tpl');
    break;
  case 'edit_user' :
    $edit_usr = edit_user($_POST);
    break;
  case 'del_user':
    if ($session->get_data('level') == 1)
    $del_usr = del_user($_POST);
    else
      show_template('info', array('error' => "Fehler: Leider keine Berechtigung!", 'error_ajax' => true), 'default/error.tpl');
    break;
  case 'quest_search' :
    $qsearch = quest::quest_search($_POST);
    break;
  case 'creature_search' :
    $csearch = creature::creature_search($_POST);
    break;
  case 'gameobject_search' :
    $gsearch = gameobject::gameobject_search($_POST);
    break;
  case 'quest_new' :
    $q_new = quest::quest_new();
    break;
  case 'creature_new' :
    $c_new = creature::creature_new();
    break;
  case 'gameobject_new':
   $g_new = gameobject::gameobject_new();
   break;
  case 'quest_load' :
    $q_new = quest::quest_load(array_merge($_GET, $_POST));
    break;
  case 'creature_load' :
    $c_new = creature::creature_load(array_merge($_GET, $_POST));
    break;
  case 'gameobject_load' :
    $g_new = gameobject::gameobject_load(array_merge($_GET, $_POST));
    break;
  case 'creature_equip_add' :
    $c_eq_add = creature::creature_equip_template(array_merge($_GET, $_POST));
    break;
  case 'creature_addon' :
    $c_add_add = creature::creature_addon(array_merge($_GET, $_POST));
    break;
  case 'creature_template_addon' :
    $c_tadd_add = creature::creature_template_addon(array_merge($_GET, $_POST));
    break;
  case 'creature_onkill_rep' :
    $c_okr_add = creature::creature_onkill_reputation(array_merge($_GET, $_POST));
    break;
  case 'load_locale' :
    $q_locale = load_locale(array_merge($_GET, $_POST));
    break;
  case 'loot_load' :
    $lo_load = loot::load(array_merge($_GET, $_POST));
    break;
  case 'loot_add' :
    $lo_add = loot::add(array_merge($_GET, $_POST));
    break;
  case 'gifi_load' :
    $q_gifi_load = quest_gifi::load($_GET);
    break;
  case 'gifi_add' :
    $q_gifi_add = quest_gifi::add($_GET);
    break;
  case 'load_log':
    $log = load_log();
    break;
  case 'save_log':
    $log = save_log($_GET);
    break;
  case 'upt_autologout_time':
   session::update_session($_GET['id']);
   exit();
   break;
  case 'upt_autologout':
    show_template('info', array('alogout' => $session->get_data('logouttime')), 'default/logouttime.tpl');
    break;
  case 'upt_usr_sess':
    show_template('info', array('usr_sess' => session::get_user_sessions()), 'default/usr_sess_cnt.tpl');
    break;
  case 'upt_sql':
    generate_sql(array_merge($_GET, $_POST));
    break;
  case 'get_file':
    $get_file = storage::get_file($_GET);
    break;
  case 'stor_file':
    $stor_file = storage::stor_file(array_merge($_GET, $_POST));
    break;
  case 'stor_upt':
    $stor_upt = storage::load_files(true);
    break;
  case 'del_file':
    $del_file = storage::del_file(array_merge($_GET, $_POST));
    break;
  case 'dialog' :
    $dialog = get_dialog(array_merge($_GET, $_POST));
    break;
  case 'logout' :
    save_log(array('desc_id' => 'u_lo'), true);
    $session->logout();
    break;
  default:
    break;
}

$err = $smarty->getTemplateVars('info');
if($logged_in)
{
$smarty->append('info', array('logouttime' => $session->get_data('logouttime'), 'user_sessions' => session::get_user_sessions(), 'name' => $session->get_data('name'), 'fullname' => $session->get_data('fullname'), 'level' => $session->get_data('level'), 'id' => $session->get_data('id')), true);
$smarty->append('file_data', storage::load_files(), true);
if ($session->get_data('level') == 1)
  $smarty->append('accounts', load_users(), true);
}
if (in_array($mode, array('login','logout')) && empty($err['error'])) $smarty->append('info', array('refresh' => true), true);

$db_fields->check_assignments();

if ($logged_in)
  $smarty->display ( "default/main.tpl" );
else $smarty->display ( "default/login.tpl" );
?>