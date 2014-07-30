<table width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <fieldset style="width: 1030px;">
      <legend>Kreatur Equip Template</legend>
      <form id="c_add_frm">
      <div id="creature_addon_content" class="white_content_div" style="height: 300px;">
      {include file="default/sections/creature_addon_content.tpl"}
      </div>
      </form>
    </fieldset></td>
  </tr>
  <tr>
    <td align="center">
    <fieldset style="width: 300px;"><legend>Werte</legend>
    <form id="creature_addon_add" autocomplete="off" onSubmit="return false;">
    <table width="100%">
        <tr>
          <td>GUID</td>
          <td>Pfad</td>
          <td>Mount</td>
          <td>Bytes1</td>
          <td>Bytes2</td>
          <td>Emote</td>
          <td>Auras</td>
        </tr>
        <tr>
        <td><input type="text" name="{$fields.cad_id}" id="cad_id" /></td>
        <td><input type="text" name="{$fields.cad_path}" id="cad_path" /></td>
        <td><input type="text" name="{$fields.cad_mnt}" id="cad_mnt" /></td>
        <td><input type="text" name="{$fields.cad_bt1}" id="cad_bt1" /></td>
        <td><input type="text" name="{$fields.cad_bt2}" id="cad_bt2" /></td>
        <td><input type="text" name="{$fields.cad_em}" id="cad_em" /></td>
        <td><input type="text" name="{$fields.cad_au}" id="cad_au" /></td>
        </tr>
	</table>
	</fieldset>
    <fieldset style="width: 300px;"><legend>Aktionen</legend>
    <input type="button" name="submit" id="c_add_add" value="Hinzufügen" />
    <input type="button" name="delete" id="c_add_del" value="Löschen" />
    </fieldset>
    </form>
    </td>
  </tr>
</table>
<script type="text/javascript">
{literal}
$('c_add_add').observe('click', function(e) {
var do_upd = true;

if($('cad_id').value == '')
  alert('Es muss eine Kreatur GUID angegeben werden!');

$$('input[name="cad_added"]').each(function(item) {
  if(item.value == $('cad_id').value)
    {
      do_upd = false;
      alert('Für diese GUID wurde schon ein Eintrag erstellt!\nBitte Überprüfen!');
    } else
        do_upd = true;
  });

if(do_upd)
  new Ajax.Updater('c_add_table_content', '/index?mode=creature_addon', {parameters: $('creature_addon_add').serialize(true), insertion: 'bottom'});
  });
  
$('c_add_del').observe('click', function(e) {
               var c_add_sel_radio = $$('input:checked[type="radio"][id="c_add_sel"]').pluck('value');
               var c_add_row = $('c_add_' + c_add_sel_radio);
               c_add_row.remove();
            });
{/literal}
</script>