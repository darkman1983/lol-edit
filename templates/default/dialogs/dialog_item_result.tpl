<table width="100%">
  <tr>
    <td>&nbsp;</td>
    <td>ID</td>
    <td>Name</td>
  </tr>
  {foreach from=$dialog item="d_data"}
  {if isset($d_data.id)}
  <tr>
    <td><input type="radio" name="item" onClick="$('{$dialog.upt_id}').value = '{$d_data.id}'" /></td>
    <td>{$d_data.id}</td>
    <td><a href="http://loldb.landoflegends.de/?item={$d_data.id}" target="_blank">{$d_data.iname_loc|default:$d_data.iname}</a></td>
  </tr>
  {/if}
  {/foreach}
</table>