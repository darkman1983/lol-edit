<?php
/**
 *
 */
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class dbfield_assign
{
  private $db;
  private $smarty;
  public static $field;

  public function __construct()
  {
    $this->db = $GLOBALS['db'];
    $this->smarty = $GLOBALS['smarty'];
    $this->load_fields();
  }

  public function check_assignments()
  {

    $get_templates_sql = "SELECT DISTINCT `template` FROM `field_assign`";
    $get_templates = $this->db->QueryArray($get_templates_sql, MYSQL_ASSOC);

    if (!$get_templates)
      return;

    $templates = array();
    $not_found = array();

    foreach ($get_templates as $value)
      $templates[$value['template']] = $this->get_template_fields($value['template']);

    foreach ($templates as $key => $fields)
    {
      $check_sql = "SELECT `value` FROM `field_assign` WHERE `template` = '{$key}'";
      $check = $this->db->QueryArray($check_sql, MYSQL_ASSOC);
       
      if (!$check)
        continue;

      foreach ($fields as $field)
        if(!array_search_ext($field, $check) )
        $not_found[$key][] = $field;
    }

    $this->smarty->append('info', array('no_db_assign' => $not_found), true);
  }

  public function get_field_assignment($field = false, $field_template)
  {

    if (empty($field) || empty($field_template))
      return false;

    $got_assign_sql = "SELECT * FROM `field_assign` WHERE `template` = '{$field_template}'";
    $got_assign = $this->db->QueryArray($got_assign_sql, MYSQL_ASSOC);

    if (!$got_assign)
      return false;

    return $got_assign[0];
  }

  private function load_fields()
  {

    $load_fields_sql = "SELECT `local_value`, `value` FROM `field_assign`";
    $load_fields = $this->db->QueryArray($load_fields_sql, MYSQL_ASSOC);

    $this->db->MoveFirst();
    while ( ! $this->db->EndOfSeek() )
    {
      $data = (array) $this->db->Row();
      self::$field[$data['local_value']] = $data['value'];
    }
  }

  private function get_template_fields($field_template)
  {

    if (empty($field_template))
      return false;

    $got_fields_def = "`{$world_db}`.`{$field_template}`";
    $got_fields = $this->db->GetColumnNames($got_fields_def);

    if (!$got_fields)
      return false;

    return $got_fields;
  }

  /**
   * Zuordnung der lokalen variabeln und der dynamischen in der DB
   *
   * @param array $fields
   * @param str $field_template
   * @return true or false
   */
  public function set_field_assignment($fields = false, $field_template)
  {

    if (empty($fields) || empty($field_template))
      return false;

    $set_parts = 'SET';

    foreach ($fields as $key => $field)
      $set_parts .= " `{$key}` = '{$field}',";

    $set_parts = rtrim($set_parts, ',');

    $set_fields_sql = "UPDATE {$field_template} {$set_parts} WHERE `template` = '{$field_template}";
    $set_fields = $this->db->Query($set_fields_sql);

    if (!$set_fields)
      return false;

    return true;
  }
}
?>