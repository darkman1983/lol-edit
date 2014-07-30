{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="cmi_table_content">
        <tr>
            <td>&nbsp;</td>
            <td>Model ID</td>
            <td>Bounding Radius</td>
            <td>Combat Reach</td>
            <td>Gender</td>
            <td>Model id other Gender</td>
        </tr>
        {/if}
        {foreach from=$data item="cmi_data"}
        {if isset($cmi_data.{$fields.cmi_id})}
        <tr id="cmi_{$cmi_data.uniqid}">
          <td><input type="radio" name="cmi_sel" id="cmi_sel" value="{$cmi_data.uniqid}" /></td>
          <td>{$cmi_data.{$fields.cmi_id}}<input type="hidden" name="cmi_id" value="{$cmi_data.{$fields.cmi_id}}" /></td>
          <td>{$cmi_data.{$fields.cmi_br}}<input type="hidden" name="cmi_br" value="{$cmi_data.{$fields.cmi_br}}" /></td>
          <td>{$cmi_data.{$fields.cmi_cr}}<input type="hidden" name="cmi_cr" value="{$cmi_data.{$fields.cmi_cr}}" /></td>
          <td>{$cmi_data.{$fields.cmi_g}}<input type="hidden" name="cmi_g" value="{$cmi_data.{$fields.cmi_g}}" /><input type="hidden" name="cmi_added" value="{$cmi_data.{$fields.cmi_id}}" /></td>
          <td>{$cmi_data.{$fields.cmi_mog}}<input type="hidden" name="cmi_mog" value="{$cmi_data.{$fields.cmi_mog}}" /></td>
        </tr>
        {/if}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}