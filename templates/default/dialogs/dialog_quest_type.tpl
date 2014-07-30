<div id="dialog_content" style="overflow: auto; width: 100%; height: 470px;" align="center">
<table width="100%">
<tr><td></td><td>ID</td><td>Name</td></tr>
{foreach from=$dialog item="d_data"}
{if isset($d_data.id)}<tr><td><input type="radio" name="qtype" onClick="$('{$dialog.upt_id}').value = '{$d_data.id}';" /></td><td>{$d_data.id}</td><td>{$d_data.name}</td></tr>{/if}
{/foreach}
</table>
</div>