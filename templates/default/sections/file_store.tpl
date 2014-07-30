{if !isset($is_ajax)}
<fieldset style="width: 600px;">
<legend>Generierte Dateien</legend>
<div class="white_content_div" style="height: 300px; text-align: left;" id="file_store">
{/if}
<form id="file_stor_frm">
<table width="100%" cellspacing="2" cellpadding="0">
{assign var=count value=1}
{foreach item="file" from=$file_data name="fil_da"}
{if $count == 1}<tr>{/if}
<td><input type="checkbox" name="file[]" value="{$file[0]}" \></td><td>{$file[1]}</td>
{if $count == 3}{assign var=count value=0}</tr>{/if}
{assign var=count value=$count+1}
{/foreach}
</table>
</form>
{if !isset($is_ajax)}
</div>
</fieldset>
{/if}