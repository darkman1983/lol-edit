{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="lo_add_table_content">
        <tr>
          <td>&nbsp;</td>
          <td>Typ</td>
          <td>Entry</td>
          <td>Gegenstand</td>
          <td>Chance normal oder Quest</td>
          <td>Lootmodus</td>
          <td>Gruppen ID</td>
          <td>Min Anzahl oder Referenz</td>
          <td>Max Anzahl</td>
        </tr>
        {/if}
        {foreach key="lo_key" item="lo_data" from=$data.res}
        {foreach key="lo_key2" item="lo_data2" from=$lo_data}
        {if isset($lo_data2.{$fields.lo_id})}
        <tr id="lo_add_{$lo_data2.uniqid}">
          <td><input type="radio" name="lo_add_sel" id="lo_add_sel" value="{$lo_data2.uniqid}" /></td>
          <td>{$data.desc.{$lo_key}}<input type="hidden" name="lo_type" value="{$lo_key}" /></td>
          <td>{$lo_data2.{$fields.lo_id}}<input type="hidden" name="lo_id" value="{$lo_data2.{$fields.lo_id}}" /></td>
          <td><a href="http://loldb.landoflegends.de/?item={$lo_data2.{$fields.lo_itm}}" target="_blank">{$lo_data2.{$fields.lo_itm}}</a><input type="hidden" name="lo_itm" value="{$lo_data2.{$fields.lo_itm}}" /></td>
          <td>{$lo_data2.{$fields.lo_coqc}}<input type="hidden" name="lo_coqc" value="{$lo_data2.{$fields.lo_coqc}}" /></td>
          <td>{$lo_data2.{$fields.lo_lomod}}<input type="hidden" name="lo_lomod" value="{$lo_data2.{$fields.lo_lomod}}" /></td>
          <td>{$lo_data2.{$fields.lo_grpid}}<input type="hidden" name="lo_grpid" value="{$lo_data2.{$fields.lo_grpid}}" /></td>
          <td>{$lo_data2.{$fields.lo_micor}}<input type="hidden" name="lo_micor" value="{$lo_data2.{$fields.lo_micor}}" /><input type="hidden" name="lo_added" value="{$lo_data2.{$fields.lo_id}}" /></td>
          <td>{$lo_data2.{$fields.lo_mac}}<input type="hidden" name="lo_mac" value="{$lo_data2.{$fields.lo_mac}}" /></td>
        </tr>
        {/if}
        {/foreach}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}