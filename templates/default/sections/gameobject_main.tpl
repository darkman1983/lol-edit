<form id="g_main_frm">
<table cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td><fieldset>
      <legend>Haupteigenschaften</legend>
      <table cellspacing="0" cellpadding="0">
  <tr>
    <td>ID (entry)</td>
    <td>Name</td>
    <td>Typ</td>
    <td>Größe</td>
  </tr>
  <tr>
    <td><div id="g_id_field"><input type="text" name="g_id" id="g_id" value="{$data.{$fields.g_id}|default:''}" /></div></td>
    <td><input type="text" name="g_name" id="g_name" value="{$data.{$fields.g_name}|default:''}" /></td>
    <td>
    <div class="search_div">
    <input type="text" name="g_typ" id="g_typ" value="{$data.{$fields.g_typ}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="g_typ_a"></a>
    </div>
    </td>
    <td><input type="text" name="g_size" id="g_size" value="{$data.{$fields.g_size}|default:''}" /></td>
  </tr>
  <tr>
    <td>DisplayId</td>
    <td>Fraktion</td>
    <td>Flags</td>
    <td>ScriptName</td>
    </tr>
  <tr>
    <td><input type="text" name="g_dispid" id="g_dispid" value="{$data.{$fields.g_dispid}|default:''}" /></td>
    <td><input type="text" name="g_fac" id="g_fac" value="{$data.{$fields.g_fac}|default:''}" /></td>
    <td><input type="text" name="g_flag" id="g_flag" value="{$data.{$fields.g_flag}|default:''}" /></td>
    <td><input type="text" name="g_sc_nam" id="g_sc_nam" value="{$data.{$fields.g_sc_nam}|default:''}" /></td>
    </tr>
  <tr>
    <td>IconName</td>
    <td>castBarCaption</td>
    <td>unk1</td>
    <td>AiName</td>
    </tr>
  <tr>
    <td><input type="text" name="g_ico_nam" id="g_ico_nam" value="{$data.{$fields.g_ico_nam}|default:''}" /></td>
    <td><input type="text" name="g_cbc" id="g_cbc" value="{$data.{$fields.g_cbc}|default:''}" /></td>
    <td><input type="text" name="g_unk1" id="g_unk1" value="{$data.{$fields.g_unk1}|default:''}" /></td>
    <td><input type="text" name="g_ai_nam" id="g_ai_nam" value="{$data.{$fields.g_ai_nam}|default:''}" /></td>
    </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    <td>WDBVerified</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
    <td><input type="text" name="g_wdb_ver" id="g_wdb_ver" value="{$data.{$fields.g_wdb_ver}|default:''}" /></td>
  </tr>
</table>
    </fieldset></td>
    <td><fieldset>
      <legend>Quest Items</legend>
      <table cellspacing="0" cellpadding="0">
  <tr>
    <td>Item 1</td>
    <td>Item 2</td>
  </tr>
  <tr>
    <td><input type="text" name="g_q_itm1" id="g_q_itm1" value="{$data.{$fields.g_q_itm1}|default:''}" /></td>
    <td><input type="text" name="g_q_itm2" id="g_q_itm2" value="{$data.{$fields.g_q_itm2}|default:''}" /></td>
  </tr>
  <tr>
    <td>Item 3</td>
    <td>Item 4</td>
    </tr>
  <tr>
    <td><input type="text" name="g_q_itm3" id="g_q_itm3" value="{$data.{$fields.g_q_itm3}|default:''}" /></td>
    <td><input type="text" name="g_q_itm4" id="g_q_itm4" value="{$data.{$fields.g_q_itm4}|default:''}" /></td>
    </tr>
  <tr>
    <td>Item 5</td>
    <td>Item 6</td>
    </tr>
  <tr>
    <td><input type="text" name="g_q_itm5" id="g_q_itm5" value="{$data.{$fields.g_q_itm5}|default:''}" /></td>
    <td><input type="text" name="g_q_itm6" id="g_q_itm6" value="{$data.{$fields.g_q_itm6}|default:''}" /></td>
    </tr>
</table>
    </fieldset></td>
  </tr>
  <tr valign="top">
    <td><fieldset><legend>Gameobjekt Daten</legend><div id="g_dat_loader" style="background:none;"><div id="g_dat_cont">
      <table cellspacing="0" cellpadding="0">
  <tr>
    <td>Data0</td>
    <td>Data1</td>
    <td>Data2</td>
    <td>Data3</td>
  </tr>
  <tr>
    <td><input type="text" name="g_dat0" id="g_dat0" value="{$data.{$fields.g_dat0}|default:''}" /></td>
    <td><input type="text" name="g_dat1" id="g_dat1" value="{$data.{$fields.g_dat1}|default:''}" /></td>
    <td><input type="text" name="g_dat2" id="g_dat2" value="{$data.{$fields.g_dat2}|default:''}" /></td>
    <td><input type="text" name="g_dat3" id="g_dat3" value="{$data.{$fields.g_dat3}|default:''}" /></td>
  </tr>
  <tr>
    <td>Data4</td>
    <td>Data5</td>
    <td>Data6</td>
    <td>Data7</td>
    </tr>
  <tr>
    <td><input type="text" name="g_dat4" id="g_dat4" value="{$data.{$fields.g_dat4}|default:''}" /></td>
    <td><input type="text" name="g_dat5" id="g_dat5" value="{$data.{$fields.g_dat5}|default:''}" /></td>
    <td><input type="text" name="g_dat6" id="g_dat6" value="{$data.{$fields.g_dat6}|default:''}" /></td>
    <td><input type="text" name="g_dat7" id="g_dat7" value="{$data.{$fields.g_dat7}|default:''}" /></td>
    </tr>
  <tr>
    <td>Data8</td>
    <td>Data9</td>
    <td>Data10</td>
    <td>Data11</td>
    </tr>
  <tr>
    <td><input type="text" name="g_dat8" id="g_dat8" value="{$data.{$fields.g_dat8}|default:''}" /></td>
    <td><input type="text" name="g_dat9" id="g_dat9" value="{$data.{$fields.g_dat9}|default:''}" /></td>
    <td><input type="text" name="g_dat10" id="g_dat10" value="{$data.{$fields.g_dat10}|default:''}" /></td>
    <td><input type="text" name="g_dat11" id="g_dat11" value="{$data.{$fields.g_dat11}|default:''}" /></td>
    </tr>
  <tr>
    <td>Data12</td>
    <td>Data13</td>
    <td>Data14</td>
    <td>Data15</td>
    </tr>
  <tr>
    <td><input type="text" name="g_dat12" id="g_dat12" value="{$data.{$fields.g_dat12}|default:''}" /></td>
    <td><input type="text" name="g_dat13" id="g_dat13" value="{$data.{$fields.g_dat13}|default:''}" /></td>
    <td><input type="text" name="g_dat14" id="g_dat14" value="{$data.{$fields.g_dat14}|default:''}" /></td>
    <td><input type="text" name="g_dat15" id="g_dat15" value="{$data.{$fields.g_dat15}|default:''}" /></td>
    </tr>
  <tr>
    <td>Data16</td>
    <td>Data17</td>
    <td>Data18</td>
    <td>Data19</td>
    </tr>
  <tr>
    <td><input type="text" name="g_dat16" id="g_dat16" value="{$data.{$fields.g_dat16}|default:''}" /></td>
    <td><input type="text" name="g_dat17" id="g_dat17" value="{$data.{$fields.g_dat17}|default:''}" /></td>
    <td><input type="text" name="g_dat18" id="g_dat18" value="{$data.{$fields.g_dat18}|default:''}" /></td>
    <td><input type="text" name="g_dat19" id="g_dat19" value="{$data.{$fields.g_dat19}|default:''}" /></td>
    </tr>
  <tr>
    <td>Data20</td>
    <td>Data21</td>
    <td>Data22</td>
    <td>Data23</td>
    </tr>
  <tr>
    <td><input type="text" name="g_dat20" id="g_dat20" value="{$data.{$fields.g_dat20}|default:''}" /></td>
    <td><input type="text" name="g_dat21" id="g_dat21" value="{$data.{$fields.g_dat21}|default:''}" /></td>
    <td><input type="text" name="g_dat22" id="g_dat22" value="{$data.{$fields.g_dat22}|default:''}" /></td>
    <td><input type="text" name="g_dat23" id="g_dat23" value="{$data.{$fields.g_dat23}|default:''}" /></td>
    </tr>
</table>
    </div></div></fieldset></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td colspan="2">
  <div id="gameobject_locales"></div>
  </td>
  </tr>
</table>
</form>
    <fieldset style="width: 300px;"><legend>Weitere Sprache Laden</legend>
    {literal}<form id="add_locale_g" autocomplete="off" onSubmit="if ($('gloc' + $('gameobject_locale_select').options[$('gameobject_locale_select').selectedIndex].text + '_div') != undefined) { alert('Diese Sprache wurde schon geladen!'); }else{new Ajax.Updater('gameobject_locales', '/index?mode=load_locale&which=g', {parameters: $('add_locale_g').serialize(true), insertion: 'bottom'});}; return false;">{/literal}
    <table width="300">
    <tr>
    <td>
    <select name="locale" id="gameobject_locale_select">
    <option value="1">Koreanisch</option>
    <option value="2">Französisch</option>
    <option value="3" SELECTED>Deutsch</option>
    <option value="4">Chinesisch</option>
    <option value="5">Taiwanesisch</option>
    <option value="6">Spanisch</option>
    <option value="7">Spanisch lat. Amerika</option>
    <option value="8">Russisch</option>
    </select>
    </td><td><input type="hidden" name="gloc_id" id="gloc_id" value="{$data.{$fields.g_id}|default:''}" /><input type="submit" name="locale_sub" value="Weitere Sprache Laden" class="base_button add_lang_button" /></td>
  </tr>
  <tr>
  <td colspan="2"><div id="gameobject_action_status"></div></td>
  <tr>
</table>
</form>
</fieldset>
        <script type="text/javascript">
{literal}
var tip1 = new Opentip("#g_id", "Gameobject ID", {target: true, tipJoint: "top"});
tip_holder = [];

for(var i=0;i<24;i++) {
    tip_holder[i] = new Opentip('#g_dat'+i, {title: 'Information', target: true, tipJoint: "top"});
  }

$('g_id').observe('change', function(e) {
                $('gloc_id').value = $('g_id').value;
            });

$('g_typ_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=g_type&upt_id=g_typ', {method: 'get', evalScripts: true});
            });
{/literal}
</script>