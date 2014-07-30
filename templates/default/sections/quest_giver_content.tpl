{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="qg_table_content">
        <tr>
          <td>&nbsp;</td>
          <td>type</td>
          <td>entry</td>
          <td>name</td>
        </tr>
        {/if}
        {foreach from=$data item="gifi_data"}
        {if isset($gifi_data.id)}
        <tr id="qg_{$gifi_data.short_type}{$gifi_data.id}">
          <td><input type="radio" name="qg_sel" id="qg_sel" value="{$gifi_data.short_type}{$gifi_data.id}" /><input type="hidden" name="qg_id" id="qg_id" value="{$gifi_data.short_type}{$gifi_data.id}" /></td>
          <td>{$gifi_data.type}</td>
          <td>{$gifi_data.id}</td>
          <td><a href="http://loldb.landoflegends.de/?{if $gifi_data.short_type == 'c'}npc{else if $gifi_data.short_type == 'o'}object{else}item{/if}={$gifi_data.id}" target="_blank">{$gifi_data.lname|default:$gifi_data.name}</a></td>
        </tr>
        {/if}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}