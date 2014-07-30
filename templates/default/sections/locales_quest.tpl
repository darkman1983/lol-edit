<div id="qloc{$data.loc|default:''}_div">
    <fieldset>
      <legend>Beschreibung der Quest ({if !empty($data.loc)}{$data.loc}{else}Englisch{/if})</legend>
      {if !empty($data.loc)}<a onClick="$('qloc{$data.loc|default:''}_div').remove();" style="cursor: default; float:right;">Schließen</a>{/if}
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="3" align="left">Titel</td>
          </tr>
        <tr>
          <td colspan="3"><input type="text" name="{if isset($data.locn)}qloc_title{$data.locn}{else}q_title{/if}" id="{if isset($data.locn)}qloc_title{$data.locn}{else}q_title{/if}" style="width:99%" value="{$data.{$fields.q_title}|default:''}" /></td>
          </tr>
        <tr>
          <td>Ausführliche Beschreibung</td>
          <td>Ziele</td>
          <td>Endtext</td>
        </tr>
        <tr>
          <td height="200" rowspan="2" valign="top"><textarea name="{if isset($data.locn)}qloc_details{$data.locn}{else}q_details{/if}" id="{if isset($data.locn)}qloc_details{$data.locn}{else}q_details{/if}" cols="45" rows="5" style="height:200px">{$data.{$fields.q_details}|default:''}</textarea></td>
          <td height="200" rowspan="2" valign="top"><textarea name="{if isset($data.locn)}qloc_objs{$data.locn}{else}q_objectives{/if}" id="{if isset($data.locn)}qloc_objs{$data.locn}{else}q_objectives{/if}" cols="45" rows="5" style="height:200px;">{$data.{$fields.q_objectives}|default:''}</textarea></td>
          <td height="20%"><textarea name="{if isset($data.locn)}qloc_end_txt{$data.locn}{else}q_endtxt{/if}" id="{if isset($data.locn)}qloc_end_txt{$data.locn}{else}q_endtxt{/if}" cols="45" rows="5" style="height:200px;">{$data.{$fields.q_endtxt}|default:''}</textarea></td>
        </tr>
        <tr>
          <td height="80%">Abgeschlossen Text</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><input type="text" name="{if isset($data.locn)}qloc_comp_txt{$data.locn}{else}q_comptxt{/if}" id="{if isset($data.locn)}qloc_comp_txt{$data.locn}{else}q_comptxt{/if}" style="width:98%" value="{$data.{$fields.q_comptxt}|default:''}" /></td>
        </tr>
        <tr>
          <td><label for="q_offer_reward">Abgabe Text</label></td>
          <td><label for="q_request_items">Noch nicht abgeschlossen Text</label></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="200" rowspan="8"><textarea name="{if isset($data.locn)}qloc_off_rew_txt{$data.locn}{else}q_off_rewtxt{/if}" id="{if isset($data.locn)}qloc_off_rew_txt{$data.locn}{else}q_off_rewtxt{/if}" cols="45" rows="5" style="height:200px;">{$data.{$fields.q_off_rewtxt}|default:''}</textarea></td>
          <td height="200" rowspan="8"><textarea name="{if isset($data.locn)}qloc_req_items_txt{$data.locn}{else}q_req_itemstxt{/if}" id="{if isset($data.locn)}qloc_req_items_txt{$data.locn}{else}q_req_itemstxt{/if}" cols="45" rows="5" style="height:200px;">{$data.{$fields.q_req_itemstxt}|default:''}</textarea></td>
          <td>Ziel 1</td>
        </tr>
        <tr>
          <td><input type="text" name="{if isset($data.locn)}qloc_obj_txt1{$data.locn}{else}q_objective_txt1{/if}" id="{if isset($data.locn)}qloc_obj_txt1{$data.locn}{else}q_objective_txt1{/if}" style="width:98%" value="{$data.{$fields.q_objective_txt1}|default:''}" /></td>
        </tr>
        <tr>
          <td>Ziel 2</td>
        </tr>
        <tr>
          <td><input type="text" name="{if isset($data.locn)}qloc_obj_txt2{$data.locn}{else}q_objective_txt2{/if}" id="{if isset($data.locn)}qloc_obj_txt2{$data.locn}{else}q_objective_txt2{/if}" style="width:98%" value="{$data.{$fields.q_objective_txt2}|default:''}" style="width:98%" value="{$data.{$fields.q_objective_txt2}|default:''}" /></td>
        </tr>
        <tr>
          <td>Ziel 3</td>
        </tr>
        <tr>
          <td><input type="text" name="{if isset($data.locn)}qloc_obj_txt3{$data.locn}{else}q_objective_txt3{/if}" id="{if isset($data.locn)}qloc_obj_txt3{$data.locn}{else}q_objective_txt3{/if}" style="width:98%" value="{$data.{$fields.q_objective_txt3}|default:''}" style="width:98%" value="{$data.{$fields.q_objective_txt3}|default:''}" /></td>
        </tr>
        <tr>
          <td>Ziel 4</td>
        </tr>
        <tr>
          <td><input type="text" name="{if isset($data.locn)}qloc_obj_txt4{$data.locn}{else}q_objective_txt4{/if}" id="{if isset($data.locn)}qloc_obj_txt4{$data.locn}{else}q_objective_txt4{/if}" style="width:98%" value="{$data.{$fields.q_objective_txt4}|default:''}" style="width:98%" value="{$data.{$fields.q_objective_txt4}|default:''}" /></td>
        </tr>
      </table>
          </fieldset>
      </div>