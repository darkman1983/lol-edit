<table>
{foreach from=$dialog item="d_data"}
{if isset($d_data.field_desc)}
<tr><td>{$d_data.field_desc}</td></tr>
{/if}
{/foreach}
</table>