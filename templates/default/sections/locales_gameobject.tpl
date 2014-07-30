<div id="gloc{$data.loc|default:''}_div">
    <fieldset>
      <legend>Name des Gameobjekts ({if !empty($data.loc)}{$data.loc}{else}Englisch{/if})</legend>
      {if !empty($data.loc)}<a onClick="$('gloc{$data.loc|default:''}_div').remove();" style="cursor: default; float:right;">Schließen</a>{/if}
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left">Name</td>
          <td align="left">castBarCaption</td>
          </tr>
        <tr>
          <td><input type="text" name="{if isset($data.locn)}gloc_name{$data.locn}{else}g_name{/if}" id="{if isset($data.locn)}gloc_name{$data.locn}{else}g_name{/if}" style="width:99%" value="{$data.{$fields.g_name}|default:''}" /></td>
          <td><input type="text" name="{if isset($data.locn)}gloc_cbc{$data.locn}{else}g_cbc{/if}" id="{if isset($data.locn)}gloc_cbc{$data.locn}{else}g_cbc{/if}" style="width:99%" value="{$data.{$fields.g_cbc}|default:''}" /></td>
        </tr>
      </table>
          </fieldset>
      </div>