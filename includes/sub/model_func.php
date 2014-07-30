<?php
/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

function gen_model_data($data = false)
{
  global $db, $smarty, $path;

  if (empty($data))
    show_template('info', array('error' => "Fehler: Keine Daten übergeben, Eingaben Überprüfen!", 'error_ajax' => true), 'default/error.tpl');
  
  $mv = new ModelViewer();
  
  $mv->ObjectHeight = 450;
  $mv->ObjectWidth = 300;
  $mv->SetModel($data['modelid']);
  
  /*
   $Thunderfury = ModelViewer::LookupDisplayId( 19019 );
   $mv->UnequipAll();
   $mv->EquipItem( SLOT_MAINHAND, $Thunderfury );
   echo $mv->GetWeaponHtml();
   */

  show_template('model', array('data' => $mv->GetCreatureHtml()), 'default/sections/model_viewer_result.tpl');
}
?>