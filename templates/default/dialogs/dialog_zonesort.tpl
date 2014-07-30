<select name="zonesort" id="select_zonesort">
<option onClick="new Ajax.Updater('dialog_content', '/index?mode=dialog&dialog=quest_sort&upt_id={$dialog.upt_id}', {literal}{method: 'get'}{/literal});">Sorte</option>
<option onClick="new Ajax.Updater('dialog_content', '/index?mode=dialog&dialog=zone&upt_id={$dialog.upt_id}', {literal}{method: 'get'}{/literal});">Zone</option>
</select>
<div id="dialog_content" style="overflow: auto; width: 100%; height: 470px;" align="center">
{include file="default/dialogs/dialog_quest_sort.tpl"}
</div>