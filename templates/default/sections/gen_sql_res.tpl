<fieldset style="width: 600px;">
<legend>Generiertes SQL</legend>
<div class="white_content_div" style="height: 550px; text-align: left;" id="{$data.id}_sql_script">
{if isset($data.quest_sql)}{$data.quest_sql}{/if}
{if isset($data.creature_sql)}{$data.creature_sql}{/if}
{if isset($data.gameobject_sql)}{$data.gameobject_sql}{/if}
{if isset($data.item_sql)}{$data.item_sql}{/if}
{if isset($data.smartai_sql)}{$data.smartai_sql}{/if}
</div>
</fieldset>