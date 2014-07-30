{include file="default/header.tpl"}
<div class="tabber" id="root_tab">
  <div class="tabbertab">
    <h2><a name="tab1">Übersicht</a></h2>
    <p align="center">Willkommen im LoL-Datenbank Editor {$info.fullname}.<br>
    Hier gibt es bald allerhand zu Entdecken und zu Tuen xD<br>
    {if !empty($info.no_db_assign)}
    <br>
    Leider konnten aus folgenden Datenbank Tabellen einige Felder nicht zugeordnet werden.
    <table>
    <tr>
    <td>Template</td>
    <td>Felder</td>
    </tr>
    {foreach from=$info.no_db_assign key="template_key" item="template"}
    <tr>
    <td>{$template_key}</td>
    <td>
    {assign var="i" value="0"}
    {foreach from=$template item="value"}
    {if $i == 5}
    <br>
    {assign var="i" value="0"}
    {/if}
    {$value}, 
    {assign var="i" value=$i+1}
    {/foreach}
    </td>
    </tr>
    {/foreach}
    </table>
    {/if}
    </p>
  </div>

  <div class="tabbertab">
    <h2>Quests</h2>
    <div class="tabber" id="quest_sub_tab">
      <div class="tabbertab">
        <h3>Suche</h3>
        {include file="default/sections/quest_search.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Quest Vorlage</h3>
        <div id="quest_main_content" align="center">
        {include file="default/sections/quest_main.tpl"}
        </div>
      </div>
      <div class="tabbertab">
        <h3>Erweitert</h3>
        <div id="quest_ext_content" align="center">
        {include file="default/sections/quest_extended.tpl"}
        </div>
      </div>
      <div class="tabbertab">
        <h3>Questgeber</h3>
        <div id="quest_giver_content_root" align="center">
        {include file="default/sections/quest_giver.tpl"}
        </div>
      </div>
      <div class="tabbertab">
        <h3>Questnehmer</h3>
        <div id="quest_finisher_content_root" align="center">
        {include file="default/sections/quest_finisher.tpl"}
        </div>
      </div>
    </div>
  </div>
  <div class="tabbertab">
    <h2>Kreaturen</h2>
    <div class="tabber" id="creature_sub_tab">
      <div class="tabbertab">
        <h3>Suche</h3>
        {include file="default/sections/creature_search.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Kreaturvorlage</h3>
        <div id="creature_main_content" align="center">
        {include file="default/sections/creature_main.tpl"}
        </div>
      </div>
      <div class="tabbertab">
        <h3>Equip (Template)</h3>
        <p align="center">Hier können die Equipment Kombinationen für Kreaturen erstellt werden.<br>Dieses Modul bezieht sich nicht auf die aktuelle Kreatur und ist ein Sonderfall!</p>
        {include file="default/sections/creature_equip.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Addon</h3>
        <p align="center">Hier können die Addons für eine einzige Kreatur eingestellt werden (muss gespawnt sein -> GUID).</p>
        {include file="default/sections/creature_addon.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Addon Template</h3>
        <p align="center">Hier können die Addons Templateweit für alle Kreaturen mit einer bestimmten ID Erstellt werden.</p>
        {include file="default/sections/creature_template_addon.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Ruf Tabelle</h3>
        <p align="center">Hier kann der Ruf eingestellt werden, die eine Kreatur gibt, wenn sie von einem Spieler getötet wird.</p>
        {include file="default/sections/creature_onkill_reputation.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Model Info</h3>
        <p align="center">Hier können die Model-Informationen der aktuellen Kreatur eingesehen werden und ggf. verändert werden.</p>
        {include file="default/sections/creature_model_info.tpl"}
      </div>
    </div>
  </div>
  <div class="tabbertab">
    <h2>Gameobjekte</h2>
    <div class="tabber" id="gameobject_sub_tab">
    <div class="tabbertab">
        <h3>Suche</h3>
        {include file="default/sections/gameobject_search.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Gameobjektvorlage</h3>
        <div id="gameobject_main_content" align="center">
        {include file="default/sections/gameobject_main.tpl"}
        </div>
      </div>
    </div>
  </div>
    <div class="tabbertab">
    <h2>Gegenstände</h2>
    <div class="tabber" id="tab1-1">
        <div class="tabbertab">
        <h3>Suche</h3>
        <p>Tab 2-1 content.</p>
      </div>
      <div class="tabbertab">
        <h3>Gegenstandsvorlage</h3>
        <p>Tab 2-2 content.</p>
      </div>
      <div class="tabbertab">
        <h3>Beute</h3>
        <p>Tab 2-3 content.</p>
      </div>
      <div class="tabbertab">
        <h3>Verzauberung</h3>
        <p>Tab 2-3 content.</p>
      </div>
      <div class="tabbertab">
        <h3>Enthalten in</h3>
        <p>Tab 2-3 content.</p>
      </div>
      <div class="tabbertab">
        <h3>item_involvedrelation</h3>
        <p>Tab 2-3 content.</p>
      </div>
    </div>
  </div>
  <div class="tabbertab">
    <h2>Loot</h2>
    <p align="center">Hier können alle möglichen Loot's erstellt werden.</p>
    {include file="default/sections/loots.tpl"}
  </div>
    <div class="tabbertab">
    <h2>SmartAI</h2>
    <p>Tab 6 content.</p>
  </div>
  <div class="tabbertab">
        <h3>SQL Script</h3>
	{include file="default/sections/gen_sql_tabs.tpl"}
      </div>
      <div class="tabbertab">
        <h3>Logs</h3>
        <div id="log_content" align="center">
        {include file="default/sections/log.tpl"}
        </div>
      </div>
    <div class="tabbertab">
    <h2>Einstellungen</h2>
    {include file="default/sections/settings.tpl"}
  </div>
    <div class="tabbertab">
    <h2><a href="index?mode=logout" id="logout">Ausloggen</a></h2>
  </div>
</div>
{include file="default/footer.tpl"}