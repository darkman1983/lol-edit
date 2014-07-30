<table width="100%">
<tr><td></td><td>ID</td><td>Name Englisch</td><td>Name Deutsch</td><td>Typ</td><td>Fraktion</td></tr>
{foreach from=$gameobject_data item="gdata"}
<tr><td><input type="radio" name="gselected" id="gselected" onclick="gselected_value={$gdata.entry}" value="{$gdata.entry}" /></td><td>{$gdata.entry}</td><td>{$gdata.name}</td><td><a href="http://loldb.landoflegends.de/?object={$gdata.entry}" target="_blank">{$gdata.name_loc3}</a></td><td>{$gdata.type}</td><td>{$gdata.faction}</td></tr>
{/foreach}
</table>