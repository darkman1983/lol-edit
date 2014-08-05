<table width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <fieldset style="width: 1030px;">
      <legend>Loots</legend>
      <form id="lo_add_frm">
      <div id="loot_content" class="white_content_div" style="height: 300px;">
      {include file="default/sections/loot_content.tpl"}
      </div>
      </form>
    </fieldset></td>
  </tr>
  <tr>
    <td align="center">
    <fieldset style="width: 300px;"><legend>Werte</legend>
    <form id="loot_add" autocomplete="off" onSubmit="return false;">
    <table width="100%">
        <tr>
          <td>Typ</td>
          <td>Entry</td>
          <td>Gegenstand</td>
          <td>Chance normal oder Quest</td>
          <td>Lootmodus</td>
          <td>Gruppen ID</td>
          <td>Min Anzahl oder Referenz</td>
          <td>Max Anzahl</td>
        </tr>
        <tr>
        <td><select name="loo_type" id="loo_type">
        <option value="creature_loot_template">Kreatur</option>
        <option value="disenchant_loot_template">Verzauberkunst</option>
        <option value="fishing_loot_template">Angeln</option>
        <option value="gameobject_loot_template">Gameobjekt</option>
        <option value="item_loot_template">Gegenstand</option>
        <option value="pickpocketing_loot_template">Taschendiebstahl</option>
        <option value="prospecting_loot_template">Sondieren</option>
        <option value="skinning_loot_template">Häuten</option>
        <option value="quest_mail_loot_template">Quest Mail</option>
        <option value="reference_loot_template">Referenz Loot</option>
        <option value="milling_loot_template">Kräuter Zermahlen</option>
        </select></td>
        <td><input type="text" name="{$fields.lo_id}" id="lo_id" /></td>
        <td><input type="text" name="{$fields.lo_itm}" id="lo_itm" /></td>
        <td><input type="text" name="{$fields.lo_coqc}" id="lo_coqc" /></td>
        <td><input type="text" name="{$fields.lo_lomod}" id="lo_lomod" /></td>
        <td><input type="text" name="{$fields.lo_grpid}" id="lo_grpid" /></td>
        <td><input type="text" name="{$fields.lo_micor}" id="lo_micor" /></td>
        <td><input type="text" name="{$fields.lo_mac}" id="lo_mac" /></td>
        </tr>
	</table>
	</fieldset>
    <fieldset style="width: 300px;"><legend>Aktionen</legend>
    <input type="button" name="submit" id="lo_add_add" value="Hinzufügen" />
    <input type="button" name="delete" id="lo_add_del" value="Löschen" />
    </fieldset>
    </form>
    </td>
  </tr>
</table>
<script type="text/javascript">
{literal}
$('lo_add_add').observe('click', function(e) {
var do_upd = true;

if($('lo_id').value == '')
  alert('Es muss eine Kreatur GUID angegeben werden!');

$$('input[name="lo_added"]').each(function(item) {
  if(item.value == $('lo_id').value)
    {
      do_upd = false;
      alert('Für diesen Entry wurde schon ein Eintrag erstellt!\nBitte Überprüfen!');
    } else
        do_upd = true;
  });

if(do_upd)
  new Ajax.Updater('lo_add_table_content', '/index?mode=loot_add', {parameters: $('loot_add').serialize(true), insertion: 'bottom'});
  });
  
$('lo_add_del').observe('click', function(e) {
               var lo_add_sel_radio = $$('input:checked[type="radio"][id="lo_add_sel"]').pluck('value');
               var lo_add_row = $('lo_add_' + lo_add_sel_radio);
               lo_add_row.remove();
            });
            
//Tooltips
new Opentip("#lo_id", "Die Equipment ID muss in Verbindung mit der Gruppen ID einzigartig sein.", {target: true, tipJoint: "top"});
{/literal}
</script>