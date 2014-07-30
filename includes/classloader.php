<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT'))
{
  exit;
}

/**
 * Autoloader for classes.
 */
function classloader($var_sClassName) {
  global $path;
  /**
   * Directories where we search for classes.
   *
   * @var array
   */
  $array_ScanDirs = array_merge(scandir("{$path}/includes/"), array("{$path}/includes/"));
  $dir_count = count($array_ScanDirs);

  for ($i=0;$i < $dir_count; $i++)
  {
    if (isset($array_ScanDirs[$i]))
      if (in_array($array_ScanDirs[$i], array(".","..")) || strstr($array_ScanDirs[$i], ".php")) unset($array_ScanDirs[$i]);
    else
    {
      if (!strstr($array_ScanDirs[$i], $path))
        $array_ScanDirs[$i] = "{$path}/includes/" . $array_ScanDirs[$i];
      if (substr($array_ScanDirs[$i], strlen($array_ScanDirs[$i])-1) != "/") $array_ScanDirs[$i] = $array_ScanDirs[$i] ."/";
    }
  }

  foreach($array_ScanDirs as $var_sDir) {
    $class = sprintf('%1$s%2$s.class.php', $var_sDir, $var_sClassName );
    if(is_dir($var_sDir) && file_exists($class))
      include_once($class);
  }
}

spl_autoload_register("classloader");
?>