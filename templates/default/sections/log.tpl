<fieldset style="width: 600px;">
<legend>Log Ausgabe</legend>
<div class="white_content_div" style="height: 600px;">
<table width="100%">
<tr><td>Datum</td><td>Beschreibung</td><td>Benutzer</td></tr>
{foreach from=$data.log item="log"}
<tr><td>{$log.date|date_format:"%d.%m.%Y %T"}</td><td>{$log.description}</td><td>{$log.name}</td></tr>
{/foreach}
</table>
</div>
</fieldset>
