<table width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <fieldset style="width: 1030px;">
      <legend>Kreatur Equip Template</legend>
      <form id="c_eq_frm">
      <div id="creature_equip_content" class="white_content_div" style="height: 300px;">
      {include file="default/sections/creature_equip_content.tpl"}
      </div>
      </form>
    </fieldset></td>
  </tr>
  <tr>
    <td align="center">
    <fieldset style="width: 300px;"><legend>Werte</legend>
    <form id="creature_equip_add" autocomplete="off" onSubmit="return false;">
    <table width="100%">
        <tr>
          <td>Equipment ID</td>
          <td>Gruppen ID</td>
          <td>Rechte Hand</td>
          <td>Linke Hand</td>
          <td>Off-Hand</td>
        </tr>
        <tr>
        <td><input type="text" name="{$fields.ceq_id}" id="ceq_id" /></td>
        <td><input type="text" name="{$fields.ceq_id2}" id="ceq_id2" value="1" /></td>
          <td>
          <div class="search_div">
          <input type="text" name="{$fields.ceq_ient1}" id="ceq_ient1" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="ceq_ient1_a"></a>
    	  </div>
          </td>
          <td>
          <div class="search_div">
          <input type="text" name="{$fields.ceq_ient2}" id="ceq_ient2" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="ceq_ient2_a"></a>
    	  </div>
          </td>
          <td>
          <div class="search_div">
          <input type="text" name="{$fields.ceq_ient3}" id="ceq_ient3" />
          <a href="javascript:void(null);" title="Auswählen" class="search_a" id="ceq_ient3_a"></a>
    	  </div>
          </td>
        </tr>
	</table>
	</fieldset>
    <fieldset style="width: 300px;"><legend>Aktionen</legend>
    <input type="button" name="submit" id="c_eq_add" value="Hinzufügen" />
    <input type="button" name="delete" id="c_eq_del" value="Löschen" />
    </fieldset>
    </form>
    </td>
  </tr>
</table>
<script type="text/javascript">
{literal}
$('c_eq_add').observe('click', function(e) {
var do_update = true;

if($('ceq_id').value == '')
  alert('Es muss ein Kreatur Template angegeben werden!');

$$('input[name="ceq_added"]').each(function(item) {
  if(item.value == $('ceq_id').value + '::' + $('ceq_id2').value)
    {
      do_update = false;
      alert('Diese Equipment ID + Gruppen ID Kombination existiert schon!\nBitte Überprüfen!');
    } else
        do_update = true;
  });

if(do_update)
  new Ajax.Updater('c_eq_table_content', '/index?mode=creature_equip_add', {parameters: $('creature_equip_add').serialize(true), insertion: 'bottom'});
  });
  
$('c_eq_del').observe('click', function(e) {
               var c_eq_sel_radio = $$('input:checked[type="radio"][id="c_eq_sel"]').pluck('value');
               var c_eq_row = $('c_eq_' + c_eq_sel_radio);
               c_eq_row.remove();
            });
            
$('ceq_ient1_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=item&upt_id=ceq_ient1', {method: 'get', evalScripts: true});
            });
$('ceq_ient2_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=item&upt_id=ceq_ient2', {method: 'get', evalScripts: true});
            });
$('ceq_ient3_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=item&upt_id=ceq_ient3', {method: 'get', evalScripts: true});
            });
            
//Tooltips
new Opentip('#ceq_id', 'Die Equipment ID muss in Verbindung mit der Gruppen ID einzigartig sein.', {target: true, tipJoint: "top"});
new Opentip('#ceq_id2', 'Um hier mehrere Equipments für eine Kreatur zu Definieren, kann hier eine Gruppen ID Vergeben werden, beginnend bei 1', {target: true, tipJoint: "top"});
{/literal}
</script>