<table>
<tr><td>ID</td><td>Name</td></tr>
{foreach from=$dialog item="d_data"}
{if isset($d_data.id)}
<tr><td>{$d_data.id}</td><td><a href="javascript:void(0);" onClick="$('{$dialog.upt_id}').value = '{$d_data.id}';">{$d_data.name}</a></td></tr>
{/if}
{/foreach}
</table>