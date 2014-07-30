<table width="100%">
<tr><td></td><td>ID</td><td>Titel Englisch</td><td>Titel Deutsch</td></tr>
{foreach from=$quest_data item="qdata"}
<tr><td><input type="radio" name="qselected" id="qselected" onclick="qselected_value={$qdata.Id}" value="{$qdata.Id}" /></td><td>{$qdata.Id}</td><td>{$qdata.Title}</td><td><a href="http://loldb.landoflegends.de/?quest={$qdata.Id}" target="_blank">{$qdata.Title_loc}</a></td></tr>
{/foreach}
</table>