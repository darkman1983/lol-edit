<div id="dialog_content" style="overflow: auto; width: 100%; height: 490px;" align="center">
<table width="100%">
<tr><td></td><td>Type</td><td>Name</td></tr>
{foreach from=$dialog item="d_data"}
{if isset($d_data.type)}<tr><td><input type="radio" name="type" onClick="$('{$dialog.upt_id}').value = '{$d_data.type}';" /></td><td>{$d_data.type}</td><td>{$d_data.name}</td></tr>{/if}
{/foreach}
</table>
</div>