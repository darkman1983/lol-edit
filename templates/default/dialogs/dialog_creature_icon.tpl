<div style="overflow-y: scroll;overflow-x: hidden;height: 200px">
<table>
{foreach from=$dialog item="d_data"}
{if isset($d_data.name)}
<tr><td><a href="javascript:void(0);" onClick="$('{$dialog.upt_id}').value = '{$d_data.name}';">{$d_data.name}</a></td><td>{$d_data.desc}</td></tr>
{/if}
{/foreach}
</table>
</div>