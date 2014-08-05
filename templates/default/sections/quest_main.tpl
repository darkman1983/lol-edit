<form id="q_main_frm">
<table cellspaceing="0" cellpadding="0">
  <tr>
    <td valign="top"><fieldset>
      <legend>Quest Id's & Verkettungen</legend>
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td>Id</td>
          <td>VorQuest</td>
        </tr>
        <tr>
          <td><div id="q_id_field"><input type="text" name="q_id" id="q_id" value="{$data.{$fields.q_id}|default:''}" /></div></td>
          <td><input type="text" name="q_prev_id" id="q_prev_id" value="{$data.{$fields.q_prev_id}|default:''}" /></td>
        </tr>
        <tr>
          <td>Gruppe</td>
          <td>FolgeQuest</td>
        </tr>
        <tr>
          <td><input type="text" name="q_exc_grp" id="q_exc_grp" value="{$data.{$fields.q_exc_grp}|default:''}" /></td>
          <td><input type="text" name="q_next_id" id="q_next_id" value="{$data.{$fields.q_next_id}|default:''}" /></td>
        </tr>
        <tr>
          <td>Nächste Quest in Reihe</td>
          <td>RewardXPId</td>
        </tr>
        <tr>
          <td><input type="text" name="q_next_id_chain" id="q_next_id_chain" value="{$data.{$fields.q_next_id_chain}|default:''}" /></td>
          <td><input type="text" name="q_rew_xp_id" id="q_rew_xp_id" value="{$data.{$fields.q_rew_xp_id}|default:''}" /></td>
        </tr>
      </table>
    </fieldset></td>
    <td valign="top"><fieldset>
      <legend>Allgemeine Vorraussetzungen</legend>
      <table width="100%" cellspaceing="0" cellpadding="0">
        <tr>
          <td><label for="q_zonesort">Zone / Sorte</label></td>
          <td>Rasse</td>
          <td>Klasse</td>
          </tr>
        <tr>
          <td>
          <div class="search_div">
          <input type="text" name="q_zos" id="q_zos" value="{$data.{$fields.q_zos}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_gifi_a"></a>
          </div>
          </td>
          <td>
          <div class="search_div">
          <input type="text" name="q_req_race" id="q_req_race" value="{$data.{$fields.q_req_race}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_req_race_a"></a>
          </div>
          </td>
          <td>
          <div class="search_div">
          <input type="text" name="q_req_class" id="q_req_class" value="{$data.{$fields.q_req_class}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_req_class_a"></a>
          </div>
          </td>
          </tr>
        <tr>
          <td>Benötigter Skill (ID)</td>
          <td>Min. Ruf Fraktion (ID)</td>
          <td>Min. Ruf Wert</td>
          </tr>
        <tr>
          <td>
          <div class="search_div">
          <input type="text" name="q_req_skill" id="q_req_skill" value="{$data.{$fields.q_req_skill}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_req_skill_a"></a>
          </div>
          </td>
          <td>
          <div class="search_div">
          <input type="text" name="q_req_min_rep_fac" id="q_req_min_rep_fac" value="{$data.{$fields.q_req_min_rep_fac}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_req_min_rep_fac_a"></a>
          </div>
          </td>
          <td><input type="text" name="q_req_min_rep_val" id="q_req_min_rep_val" value="{$data.{$fields.q_req_min_rep_val}|default:''}" /></td>
          </tr>
        <tr>
          <td>Benötigter Skill Wert</td>
          <td>Max. Ruf Fraktion (ID)</td>
          <td>Max. Ruf Wert</td>
        </tr>
        <tr>
          <td><input type="text" name="q_req_skill_points" id="q_req_skill_points" value="{$data.{$fields.q_req_skill_points}|default:''}" /></td>
          <td>
          <div class="search_div">
          <input type="text" name="q_req_max_rep_fac" id="q_req_max_rep_fac" value="{$data.{$fields.q_req_max_rep_fac}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_req_max_rep_fac_a"></a>
          </div>
          </td>
          <td><input type="text" name="q_req_max_rep_val" id="q_req_max_rep_val" value="{$data.{$fields.q_req_max_rep_val}|default:''}" /></td>
        </tr>
        <tr>
          <td>Level</td>
          <td>Min Level</td>
          <td>Max Level</td>
          </tr>
        <tr>
          <td><input type="text" name="q_lvl" id="q_lvl" value="{$data.{$fields.q_lvl}|default:''}" /></td>
          <td><input type="text" name="q_min_lvl" id="q_min_lvl" value="{$data.{$fields.q_min_lvl}|default:''}" /></td>
          <td><input type="text" name="q_max_lvl" id="q_max_lvl" value="{$data.{$fields.q_max_lvl}|default:''}" /></td>
          </tr>
        </table>
    </fieldset></td>
    <td valign="top"><fieldset>
      <legend>Flags</legend>
      <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td>Typ</td>
          </tr>
        <tr>
          <td>
          <div class="search_div">
          <input type="text" name="q_type" id="q_type" value="{$data.{$fields.q_type}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_type_a"></a>
          </div>
          </td>
          </tr>
        <tr>
          <td>QuestFlags</td>
          </tr>
        <tr>
          <td>
          <div class="search_div">
          <input type="text" name="q_flags" id="q_flags" value="{$data.{$fields.q_flags}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_flags_a"></a>
          </div>
          </td>
          </tr>
        <tr>
          <td>Zeitlimit (Millisekunden)</td>
          </tr>
        <tr>
          <td><input type="text" name="q_time" id="q_time" value="{$data.{$fields.q_time}|default:''}" /></td>
          </tr>
      </table>
    </fieldset></td>
    <td valign="top"><fieldset>
      <legend>Startausrüstung</legend>
      <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td>Gegenstand</td>
          <td><label for="q_src_item">Menge</label></td>
        </tr>
        <tr>
          <td>
          <div class="search_div">
          <input type="text" name="q_src_item_id" id="q_src_item_id" value="{$data.{$fields.q_src_item_id}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_src_item_id_a"></a>
          </div>
          </td>
          <td><input type="text" name="q_src_item_count" id="q_src_item_count" value="{$data.{$fields.q_src_item_count}|default:''}" /></td>
        </tr>
        <tr>
          <td>Zauber</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
          <div class="search_div">
          <input type="text" name="q_src_spell" id="q_src_spell" value="{$data.{$fields.q_src_spell}|default:''}" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="q_src_spell_a"></a>
          </div>
          </td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </fieldset></td>
  </tr>
  <tr>
    <td colspan="4" align="center">
    <div id="quest_locales">
    {include file="default/sections/locales_quest.tpl"}
    </div>
    </td>
  </tr>
</table>
</form>
    <fieldset style="width: 300px;"><legend>Weitere Sprache Laden</legend>
    {literal}<form id="add_locale_q" autocomplete="off" onSubmit="if ($('qloc' + $('quest_locale_select').options[$('quest_locale_select').selectedIndex].text + '_div') != undefined) { alert('Diese Sprache wurde schon geladen!'); }else{new Ajax.Updater('quest_locales', '/index?mode=load_locale&which=q', {parameters: $('add_locale_q').serialize(true), insertion: 'bottom'});}; return false;">{/literal}
    <table width="300">
    <tr>
    <td>
    <select name="locale" id="quest_locale_select">
    <option value="1">Koreanisch</option>
    <option value="2">Französisch</option>
    <option value="3" SELECTED>Deutsch</option>
    <option value="4">Chinesisch</option>
    <option value="5">Taiwanesisch</option>
    <option value="6">Spanisch</option>
    <option value="7">Spanisch lat. Amerika</option>
    <option value="8">Russisch</option>
    </select>
    </td><td><input type="hidden" name="qloc_id" id="qloc_id" value="{$data.{$fields.q_id}|default:''}" /><input type="submit" name="locale_sub" value="Weitere Sprache Laden" class="base_button add_lang_button" /></td>
  </tr>
  <tr>
  <td colspan="2"><div id="quest_action_status"></div></td>
  <tr>
</table>
</form>
</fieldset>
<script type="text/javascript">
{literal}
$('q_gifi_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=zonesort&upt_id=q_zos', {method: 'get', evalScripts: true});
            });
            
$('q_id').observe('change', function(e) {
                $('qloc_id').value = $('q_id').value;
            });
            
$('q_req_skill_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=skillline&upt_id=q_req_skill', {method: 'get', evalScripts: true});
            });
$('q_req_min_rep_fac_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=faction&upt_id=q_req_min_rep_fac', {method: 'get', evalScripts: true});
            });
$('q_req_max_rep_fac_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=faction&upt_id=q_req_max_rep_fac', {method: 'get', evalScripts: true});
            });
$('q_req_race_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=race&upt_id=q_req_race', {method: 'get', evalScripts: true});
            });
$('q_req_class_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=class&upt_id=q_req_class', {method: 'get', evalScripts: true});
            });
$('q_flags_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=quest_flags&upt_id=q_flags', {method: 'get', evalScripts: true});
            });
$('q_type_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=qtype&upt_id=q_type', {method: 'get', evalScripts: true});
            });
$('q_src_spell_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=spell&upt_id=q_src_spell', {method: 'get', evalScripts: true});
            });
$('q_src_item_id_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=item&upt_id=q_src_item_id', {method: 'get', evalScripts: true});
            });

//Tooltips
new Opentip("#q_rew_xp_id", 'Die ID\'s gehen von 2-11<br>Je höher der Wert, desto mehr XP!<br>Beispiele:<p>2 = Immer 0<br>3 = "Sprich mit X", sehr einfache Quests<br>4 = "Sprich mit X" oder "Bringe zu X" mit einer durchschnittlichen Laufdistanz<br>5 = "Sprich mit X" normalerweise außerhalb der Zone des Questgebers<br>6 = Normale Quest "Töte X" mit unter 10<br>7 = Normale Quest "Töte X" mit über 10<br>8 = Elite Quest, normalerweise wird eine Gruppe benötigt<br>9 = Normale Quest mit guter XP Belohnung, z.B. beim Abschluss einer Questreihe oder Gruppenquest<br>10 = Raid Quests</p>', {target: true, tipJoint: "top"});
{/literal}
</script>