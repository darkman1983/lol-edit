<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

class storage {

  private static function get_path($long = true)
  {
    global $session, $path;

    $stor_path_short = "/store/{$session->get_data('name')}/";
    $stor_path       = $path.$stor_path_short;

    return $long ? $stor_path : $stor_path_short;
  }

  public static function load_files($ajax = false)
  {
    global $smarty;

    $file_array = array();
    $file_tmp   = array();

    if (is_dir(storage::get_path()) && $handle = opendir(storage::get_path())) {
      while (false !== ($file = readdir($handle))) {
        if ($file != "." && $file != "..")
          $file_tmp [] = $file;
      }
      closedir($handle);
    }else {
      //if usr dir is not present create it and load again.
      mkdir(storage::get_path(), 0755);

      if (is_dir(storage::get_path()))
        storage::load_files($ajax);
      else return;
    }

    asort($file_tmp);

    foreach ($file_tmp as $cur)
      $file_array [] = array($cur, storage::get_url($cur));

    unset($file_tmp);

    if ($ajax)
    {
      $smarty->append('file_data', $file_array, true);
      $smarty->append('is_ajax', true, true);
      $smarty->display('default/sections/file_store.tpl');
      unset($file_array);
      exit();
    }

    return $file_array;
  }

  public static function get_file($data)
  {
    global $session;

    if (file_exists(storage::get_path().$data['file']))
    {
      header('Content-Description: File Transfer');
      header('Content-Type: application/octet-stream');
      header('Content-Disposition: attachment; filename='.$data['file']);
      header('Content-Transfer-Encoding: binary');
      header('Expires: 0');
      header('Cache-Control: must-revalidate');
      header('Pragma: public');
      header('Content-Length: ' .storage::get_path().$data['file']);
      ob_clean();
      flush();
      readfile ( storage::get_path().$data['file'] );
      exit();
    }
    else
      show_template('info', array('error' => "Leider wurde die Datei: {$data['file']} nicht im Speicherordner von {$session->get_data('name')} gefunden."), 'default/error.tpl');
  }

  private static function get_url($file)
  {
    if (file_exists(storage::get_path().$file))
      return "<a href=\"index.php?mode=get_file&file={$file}\">{$file}</a>";
    else return;
  }

  public static function stor_file($data)
  {
    $file_name    = '';
    $file_sav_crc = 0;
    $file_cur_crc = 0;
    $last_date    = 0;
    $is_saved     = false;
    $content      = '';

    if (empty($data))
      return;

    $content      = str_replace(array("\\'","\'",'\\\n','\\\r','\r\n'), array("'","'",' ','\r',''), $data['content']);
    $file_sav_crc = crc32($content);
    $file_name    = str_replace(' ', '_', $data['name']);
    $file_name    = str_replace("\\'", '', $file_name);
    $file_name    = $data['type']."_".$data['id']."-".$file_name.'.sql';

    if (file_exists(storage::get_path().$file_name))
      $file_cur_crc = crc32(file_get_contents(storage::get_path().$file_name));

    if ($file_cur_crc != $file_sav_crc)
    {
      $sav = fopen(storage::get_path().$file_name, 'w+');
      if ($line = fgets($sav))
        $last_date = substr($line, 9, 10);

      if($last_date < time())
      {
        $sav_data = preg_replace('#<br\s*/?>#i', "\n", $content);
        fwrite($sav, '-- Date: '.time()."\n\n");
        fwrite($sav, $sav_data);
        $is_saved = true;
      }
      fclose($sav);
    }

    if (!is_saved)
      print "Die Datei: {$file_name} braucht nicht gespeichert werden, da keine Änderungen vorhanden sind.";
    else {
      print "Die Datei {$file_name} wurde gespeichert.";
      save_log(array('desc_id' => 'u_sqsav', 'file_nam' => $file_name), true);
    }
    exit();
  }

  public static function del_file($data)
  {
    if (empty($data))
      return;

    if (is_array($data['file']))
    {
      
      
      $log_files_str = 'Folgende Dateien wurden gelöscht:<br>';
      print $log_files_str;
      
      foreach ($data['file'] as $file)
      {
        if (file_exists(storage::get_path().$file))
          unlink(storage::get_path().$file);

        print $file."<br>";
        $log_files_str .= "{$file}<br>";
      }
      
      save_log(array('desc_id' => 'u_sqdelp', 'file_str' => $log_files_str), true);
      exit();
    }else {
      if (file_exists(storage::get_path().$data['name']))
        unlink(storage::get_path().$data['name']);

      if (!file_exists(storage::get_path().$data['name']))
      {
        $log_del_str = "Datei {$data['name']} wurde gelöscht.";
        print $log_del_str;
        save_log(array('desc_id' => 'u_sqdels', 'file_str' => $log_del_str), true);
        exit();
      }else {
        print "Leider gab es Probleme beim Löschen der Datei {$data['name']} oder sie existiert nicht!";
        exit();
      }
    }
  }
}
?>