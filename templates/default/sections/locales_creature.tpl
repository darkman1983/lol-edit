<div id="cloc{$data.loc|default:''}_div">
    <fieldset>
      <legend>Namen der Kreatur ({if !empty($data.loc)}{$data.loc}{else}Englisch{/if})</legend>
      {if !empty($data.loc)}<a onClick="$('cloc{$data.loc|default:''}_div').remove();" style="cursor: default; float:right;">Schließen</a>{/if}
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left">Name</td>
          <td align="left">Zusatzname</td>
          </tr>
        <tr>
          <td><input type="text" name="{if isset($data.locn)}cloc_name{$data.locn}{else}c_name{/if}" id="{if isset($data.locn)}cloc_name{$data.locn}{else}c_name{/if}" style="width:99%" value="{$data.{$fields.c_name}|default:''}" /></td>
          <td><input type="text" name="{if isset($data.locn)}cloc_subn{$data.locn}{else}c_subn{/if}" id="{if isset($data.locn)}cloc_subn{$data.locn}{else}c_subn{/if}" style="width:99%" value="{$data.{$fields.c_subn}|default:''}" /></td>
        </tr>
      </table>
          </fieldset>
      </div>