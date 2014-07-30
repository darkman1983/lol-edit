{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="c_eq_table_content">
        <tr>
          <td>&nbsp;</td>
          <td>Equiptment ID</td>
          <td>Gruppen ID</td>
          <td>Rechte Hand</td>
          <td>Linke Hand</td>
          <td>Off-Hand</td>
        </tr>
        {/if}
        {foreach from=$data item="c_eq_data"}
        {if isset($c_eq_data.{$fields.ceq_id})}
        <tr id="c_eq_{$c_eq_data.uniqid}">
          <td><input type="radio" name="c_eq_sel" id="c_eq_sel" value="{$c_eq_data.uniqid}" /></td>
          <td>{$c_eq_data.{$fields.ceq_id}}<input type="hidden" name="ceq_id" value="{$c_eq_data.{$fields.ceq_id}}" /></td>
          <td>{$c_eq_data.{$fields.ceq_id2}}<input type="hidden" name="ceq_id2" value="{$c_eq_data.{$fields.ceq_id2}}" /></td>
          <td><a href="http://loldb.landoflegends.de/?item={$c_eq_data.{$fields.ceq_ient1}}" target="_blank">{$c_eq_data.{$fields.ceq_ient1}}</a><input type="hidden" name="ceq_ient1" value="{$c_eq_data.{$fields.ceq_ient1}}" /></td>
          <td><a href="http://loldb.landoflegends.de/?item={$c_eq_data.{$fields.ceq_ient2}}" target="_blank">{$c_eq_data.{$fields.ceq_ient2}}</a><input type="hidden" name="ceq_ient2" value="{$c_eq_data.{$fields.ceq_ient2}}" /></td>
          <td><a href="http://loldb.landoflegends.de/?item={$c_eq_data.{$fields.ceq_ient3}}" target="_blank">{$c_eq_data.{$fields.ceq_ient3}}</a><input type="hidden" name="ceq_ient3" value="{$c_eq_data.{$fields.ceq_ient3}}" /><input type="hidden" name="ceq_added" value="{$c_eq_data.{$fields.ceq_id}}::{$c_eq_data.{$fields.ceq_id2}}" /></td>
        </tr>
        {/if}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}