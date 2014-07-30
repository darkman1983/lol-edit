{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="c_add_table_content">
        <tr>
          <td>&nbsp;</td>
          <td>GUID</td>
          <td>Pfad</td>
          <td>Mount</td>
          <td>Bytes1</td>
          <td>Bytes2</td>
          <td>Emote</td>
          <td>Auras</td>
        </tr>
        {/if}
        {foreach from=$data item="c_add_data"}
        {if isset($c_add_data.{$fields.cad_id})}
        <tr id="c_add_{$c_add_data.uniqid}">
          <td><input type="radio" name="c_add_sel" id="c_add_sel" value="{$c_add_data.uniqid}" /></td>
          <td>{$c_add_data.{$fields.cad_id}}<input type="hidden" name="cad_id" value="{$c_add_data.{$fields.cad_id}}" /></td>
          <td>{$c_add_data.{$fields.cad_path}}<input type="hidden" name="cad_path" value="{$c_add_data.{$fields.cad_path}}" /></td>
          <td><a href="http://loldb.landoflegends.de/?npc={$c_add_data.{$fields.cad_mnt}}" target="_blank">{$c_add_data.{$fields.cad_mnt}}</a><input type="hidden" name="cad_mnt" value="{$c_add_data.{$fields.cad_mnt}}" /></td>
          <td>{$c_add_data.{$fields.cad_bt1}}<input type="hidden" name="cad_bt1" value="{$c_add_data.{$fields.cad_bt1}}" /></td>
          <td>{$c_add_data.{$fields.cad_bt2}}<input type="hidden" name="cad_bt2" value="{$c_add_data.{$fields.cad_bt2}}" /></td>
          <td>{$c_add_data.{$fields.cad_em}}<input type="hidden" name="cad_em" value="{$c_add_data.{$fields.cad_em}}" /><input type="hidden" name="cad_added" value="{$c_add_data.{$fields.cad_id}}" /></td>
          <td>
          {foreach from=" "|explode:$c_add_data.{$fields.cad_au} item="c_aura"}
          <a href="http://loldb.landoflegends.de/?spell={$c_aura}" target="_blank">{$c_aura} </a>
          {/foreach}
          <input type="hidden" name="cad_au" value="{$c_add_data.{$fields.cad_au}}" /></td>
        </tr>
        {/if}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}