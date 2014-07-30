{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="c_tadd_table_content">
        <tr>
          <td>&nbsp;</td>
          <td>Entry</td>
          <td>Pfad</td>
          <td>Mount</td>
          <td>Bytes1</td>
          <td>Bytes2</td>
          <td>Emote</td>
          <td>Auras</td>
        </tr>
        {/if}
        {foreach from=$data item="c_tadd_data"}
        {if isset($c_tadd_data.{$fields.cta_id})}
        <tr id="c_tadd_{$c_tadd_data.uniqid}">
          <td><input type="radio" name="c_tadd_sel" id="c_tadd_sel" value="{$c_tadd_data.uniqid}" /></td>
          <td>{$c_tadd_data.{$fields.cta_id}}<input type="hidden" name="cta_id" value="{$c_tadd_data.{$fields.cta_id}}" /></td>
          <td>{$c_tadd_data.{$fields.cta_path}}<input type="hidden" name="cta_path" value="{$c_tadd_data.{$fields.cta_path}}" /></td>
          <td><a href="http://loldb.landoflegends.de/?npc={$c_tadd_data.{$fields.cta_mnt}}" target="_blank">{$c_tadd_data.{$fields.cta_mnt}}</a><input type="hidden" name="cta_mnt" value="{$c_tadd_data.{$fields.cta_mnt}}" /></td>
          <td>{$c_tadd_data.{$fields.cta_bt1}}<input type="hidden" name="cta_bt1" value="{$c_tadd_data.{$fields.cta_bt1}}" /></td>
          <td>{$c_tadd_data.{$fields.cta_bt2}}<input type="hidden" name="cta_bt2" value="{$c_tadd_data.{$fields.cta_bt2}}" /></td>
          <td>{$c_tadd_data.{$fields.cta_em}}<input type="hidden" name="cta_em" value="{$c_tadd_data.{$fields.cta_em}}" /><input type="hidden" name="cta_added" value="{$c_tadd_data.{$fields.cta_id}}" /></td>
          <td>
          {foreach from=" "|explode:$c_tadd_data.{$fields.cta_au} item="c_aura"}
          <a href="http://loldb.landoflegends.de/?spell={$c_aura}" target="_blank">{$c_aura} </a>
          {/foreach}
          <input type="hidden" name="cta_au" value="{$c_tadd_data.{$fields.cta_au}}" /></td>
        </tr>
        {/if}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}