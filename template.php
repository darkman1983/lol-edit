<?php

$smarty = new Smarty();

$smarty->template_dir = $path.'/templates';
$smarty->compile_dir = $path.'/templates_c';
$smarty->cache_dir = $path.'/cache';
$smarty->config_dir = $path.'/configs';
$smarty->caching = false;
$smarty->force_compile = true;
$smarty->cache_lifetime = 20;
$smarty->compile_check = true;
$smarty->cache_modified_check = true;
//$smarty->debugging = true;

?>