<div id="dialog_content" style="overflow: auto; width: 100%; height: 470px;" align="center">
<form id="cflage_form">
<table width="100%">
<tr><td></td><td>Flag</td><td>Name</td></tr>
{foreach from=$dialog item="d_data"}
{if isset($d_data.flag)}<tr><td><input type="checkbox" name="cflage" value="{$d_data.flag}" /></td><td>{$d_data.flag}</td><td>{$d_data.name}</td></tr>{/if}
{/foreach}
<tr><td colspan="4"><input type="button" id="cflage_sub" value="Hinzufügen" /></td></tr>
</table>
</form>
<script type="text/javascript">
{literal}
$('cflage_sub').observe('click', function(e) {
$('c_flage').value = checkAdd('cflage_form');
});
</script>
{/literal}
</div>