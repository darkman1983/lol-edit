<table width="100%">
<tr><td></td><td>ID</td><td>Name Englisch</td><td>Name Deutsch</td><td>Zusatzname Englisch</td><td>Zusatzname Deutsch</td><td>NPCFlag</td><td>MinLevel</td><td>MaxLevel</td></tr>
{foreach from=$creature_data item="cdata"}
<tr><td><input type="radio" name="cselected" id="cselected" onclick="cselected_value={$cdata.entry}" value="{$cdata.entry}" /></td><td>{$cdata.entry}</td><td>{$cdata.name}</td><td><a href="http://loldb.landoflegends.de/?npc={$cdata.entry}" target="_blank">{$cdata.name_loc3}</a></td><td>{$cdata.subname}</td><td>{$cdata.subname_loc3}</td><td>{$cdata.npcflag}</td><td>{$cdata.minlevel}</td><td>{$cdata.maxlevel}</td></tr>
{/foreach}
</table>