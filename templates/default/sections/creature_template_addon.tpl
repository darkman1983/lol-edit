<table width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <fieldset style="width: 1030px;">
      <legend>Kreatur Equip Template</legend>
      <form id="c_tadd_frm">
      <div id="creature_addon_content" class="white_content_div" style="height: 300px;">
      {include file="default/sections/creature_template_addon_content.tpl"}
      </div>
      </form>
    </fieldset></td>
  </tr>
  <tr>
    <td align="center">
    <fieldset style="width: 300px;"><legend>Werte</legend>
    <form id="creature_template_addon_add" autocomplete="off" onSubmit="return false;">
    <table width="100%">
        <tr>
          <td>Entry</td>
          <td>Pfad</td>
          <td>Mount</td>
          <td>Bytes1</td>
          <td>Bytes2</td>
          <td>Emote</td>
          <td>Auras</td>
        </tr>
        <tr>
        <td><input type="text" name="{$fields.cta_id}" id="cta_id" /></td>
        <td><input type="text" name="{$fields.cta_path}" id="cta_path" /></td>
        <td><input type="text" name="{$fields.cta_mnt}" id="cta_mnt" /></td>
        <td><input type="text" name="{$fields.cta_bt1}" id="cta_bt1" /></td>
        <td><input type="text" name="{$fields.cta_bt2}" id="cta_bt2" /></td>
        <td><input type="text" name="{$fields.cta_em}" id="cta_em" /></td>
        <td><input type="text" name="{$fields.cta_au}" id="cta_au" /></td>
        </tr>
	</table>
	</fieldset>
    <fieldset style="width: 300px;"><legend>Aktionen</legend>
    <input type="button" name="submit" id="c_tadd_add" value="Hinzufügen" />
    <input type="button" name="delete" id="c_tadd_del" value="Löschen" />
    </fieldset>
    </form>
    </td>
  </tr>
</table>
<script type="text/javascript">
{literal}
$('c_tadd_add').observe('click', function(e) {
var do_upd = true;

if($('cta_id').value == '')
  alert('Es muss eine Kreatur Entry angegeben werden!');

$$('input[name="cta_added"]').each(function(item) {
  if(item.value == $('cta_id').value)
    {
      do_upd = false;
      alert('Für diese Entry wurde schon ein Eintrag erstellt!\nBitte Überprüfen!');
    } else
        do_upd = true;
  });

if(do_upd)
  new Ajax.Updater('c_tadd_table_content', '/index?mode=creature_template_addon', {parameters: $('creature_template_addon_add').serialize(true), insertion: 'bottom'});
  });
  
$('c_tadd_del').observe('click', function(e) {
               var c_tadd_sel_radio = $$('input:checked[type="radio"][id="c_tadd_sel"]').pluck('value');
               var c_tadd_row = $('c_tadd_' + c_tadd_sel_radio);
               c_tadd_row.remove();
            });
            
//Tooltips
new Opentip("#cta_id", "Die Equipment ID muss in Verbindung mit der Gruppen ID einzigartig sein.", {target: true, tipJoint: "top"});
{/literal}
</script>