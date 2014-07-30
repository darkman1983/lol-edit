<table width="100%">
  <tr>
    <td>&nbsp;</td>
    <td>Type</td>
    <td>ID</td>
    <td>Name</td>
  </tr>
  {foreach from=$dialog item="d_data"}
  {if isset($d_data.id)}
  <tr>
    <td><input type="radio" name="qgiver" onClick="{if isset($d_data.ret) && empty($d_data.ret)}new Ajax.Updater('qg_table_content', '/index?mode=gifi_add&gifi_id={$d_data.short_type}{$d_data.id}&gifi=gi&ajax=true', {literal}{method: 'get', insertion: 'bottom'}{/literal}){else}$('s_questgiver').value = '{$d_data.short_type}{$d_data.id}'{/if};" /></td>
    <td>{$d_data.type}</td>
    <td>{$d_data.id}</td>
    <td><a href="http://loldb.landoflegends.de/?{if $d_data.short_type == 'c'}npc{else if $d_data.short_type == 'o'}object{else}item{/if}={$d_data.id}" target="_blank">{if empty($d_data.lname)}{$d_data.name}{else}{$d_data.lname}{/if}</a></td>
  </tr>
  {/if}
  {/foreach}
</table>