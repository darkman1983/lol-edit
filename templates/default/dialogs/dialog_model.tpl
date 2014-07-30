<div id="dialog_content" style="overflow: hidden; width: 100%; height: 490px;" align="center">
<table width="100%">
<tr>
<td colspan="2">
<form id="model_search" autocomplete="off" onSubmit="new Ajax.Updater('dialog_content', '/index?mode=dialog&dialog=model&upt_id={$dialog.upt_id}',{literal}{parameters: $('model_search').serialize(true)}); return false;">{/literal}
<table>
<tr>
<td colspan="2">Name</td>
</tr>
<tr>
<td><input type="text" name="searchterm" /></td><td><input type="submit" name="button" id="button" value="Suchen" /></td>
</tr>
</table>
</form>
</td>
</tr>
<tr>
<td colspan="2">{$dialog.nav}</td>
</tr>
<tr>
<td>
<div style="overflow-y: auto; overflow-x: hidden; width: 300px; height: 440px;">
<table width="100%">
  <tr>
    <td>&nbsp;</td>
    <td>ID</td>
    <td>Name</td>
  </tr>
  {foreach from=$dialog item="d_data"}
  {if isset($d_data.id)}
  <tr>
    <td><input type="radio" name="title" onClick="$('{$dialog.upt_id}').value = '{$d_data.id}'; new Ajax.Updater('model_content', '/index?mode=dialog&dialog=model_result&modelid={$d_data.id}', {literal}{method: 'get', evalScripts: true}{/literal})" /></td>
    <td>{$d_data.id}</td>
    <td>{$d_data.name}</td>
  </tr>
  {/if}
  {/foreach}
</table>
</div>
</td><td>
<div id="model_content" style="position:absolute; top:40px; left:310px;"></div>
</td></tr>
</table>
</div>