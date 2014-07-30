<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td align="center">
        <div class="tabber" id="sql_sub_tab">
      <div class="tabbertab">
        <h3>Quest</h3>
        <div id="quest_sql" align="center">
        {include file="default/sections/gen_sql.tpl" id="quest"}
        </div>
        {include file="default/sections/gen_sql_act.tpl" id="quest"}
      </div>
      <div class="tabbertab">
        <h3>Kreatur</h3>
        <div id="creature_sql" align="center">
        {include file="default/sections/gen_sql.tpl" id="creature"}
        </div>
        {include file="default/sections/gen_sql_act.tpl" id="creature"}
      </div>
      <div class="tabbertab">
        <h3>Gameobjekt</h3>
        <div id="gameobject_sql" align="center">
        {include file="default/sections/gen_sql.tpl" id="gameobject"}
        </div>
        {include file="default/sections/gen_sql_act.tpl" id="gameobject"}
      </div>
      <div class="tabbertab">
        <h3>Gegenstand</h3>
        <div id="item_sql" align="center">
        {include file="default/sections/gen_sql.tpl" id="item"}
        </div>
        {include file="default/sections/gen_sql_act.tpl" id="item"}
      </div>
      <div class="tabbertab">
        <h3>SmartAI</h3>
        <div id="smartai_sql" align="center">
        {include file="default/sections/gen_sql.tpl" id="smartai"}
        </div>
        {include file="default/sections/gen_sql_act.tpl" id="smartai"}
      </div>
</td>
</tr>
<tr>
<td align="center">
      {include file="default/sections/file_store.tpl"}
</td>
</tr>
</table>