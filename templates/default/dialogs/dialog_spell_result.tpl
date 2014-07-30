<table width="100%">
  <tr>
    <td>&nbsp;</td>
    <td>ID</td>
    <td>Name</td>
  </tr>
  {foreach from=$dialog item="d_data"}
  {if isset($d_data.id)}
  <tr>
    <td><input type="radio" name="spell" onClick="$('{$dialog.upt_id}').value = '{$d_data.id}'" /></td>
    <td>{$d_data.id}</td>
    <td><a href="http://loldb.landoflegends.de/?spell={$d_data.id}" target="_blank">{$d_data.name}</a></td>
  </tr>
  {/if}
  {/foreach}
</table>