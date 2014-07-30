{if !isset($data.ajax)}
<table width="100%" cellspacing="0" cellpadding="0" id="cor_table_content">
        <tr>
          <td>&nbsp;</td>
          <td>Kreatur ID</td>
          <td>Fraktions ID</td>
          <td>Maximaler Ruf</td>
          <td>Team Belohnung</td>
          <td>Ruf Wert</td>
          <td>Fraktionsabhängig ?</td>
          <td>Fraktions ID 2</td>
          <td>Maximaler Ruf2</td>
          <td>Team Belohnung 2</td>
          <td>Ruf Wert 2</td>
        </tr>
        {/if}
        {foreach from=$data item="cor_data"}
        {if isset($cor_data.{$fields.cor_id})}
        <tr id="cor_{$cor_data.uniqid}">
          <td><input type="radio" name="cor_sel" id="cor_sel" value="{$cor_data.uniqid}" /></td>
          <td>{$cor_data.{$fields.cor_id}}<input type="hidden" name="cor_id" value="{$cor_data.{$fields.cor_id}}" /></td>
            <td><a href="http://loldb.landoflegends.de/?faction={$cor_data.{$fields.cor_rokrf1}}"
                   target="_blank">{$cor_data.{$fields.cor_rokrf1}}</a><input type="hidden" name="cor_rokrf1"
                                                                              value="{$cor_data.{$fields.cor_rokrf1}}"/>
            </td>
            <td>{$cor_data.{$fields.cor_ms1}}<input type="hidden" name="cor_ms1" value="{$cor_data.{$fields.cor_ms1}}" /></td>
          <td>{$cor_data.{$fields.cor_ita1}}<input type="hidden" name="cor_ita1" value="{$cor_data.{$fields.cor_ita1}}" /></td>
          <td>{$cor_data.{$fields.cor_rokrv1}}<input type="hidden" name="cor_rokrv1" value="{$cor_data.{$fields.cor_rokrv1}}" /><input type="hidden" name="cor_added" value="{$cor_data.{$fields.cor_id}}::{$cor_data.{$fields.cor_rokrf1}}" /></td>
          <td>{$cor_data.{$fields.cor_td}}<input type="hidden" name="cor_td" value="{$cor_data.{$fields.cor_td}}" /></td>
            <td><a href="http://loldb.landoflegends.de/?faction={$cor_data.{$fields.cor_rokrf2}}"
                   target="_blank">{$cor_data.{$fields.cor_rokrf2}}</a><input type="hidden" name="cor_rokrf2"
                                                                              value="{$cor_data.{$fields.cor_rokrf2}}"/>
            </td>
            <td>{$cor_data.{$fields.cor_ms2}}<input type="hidden" name="cor_ms2" value="{$cor_data.{$fields.cor_ms2}}" /></td>
          <td>{$cor_data.{$fields.cor_ita2}}<input type="hidden" name="cor_ita2" value="{$cor_data.{$fields.cor_ita2}}" /></td>
          <td>{$cor_data.{$fields.cor_rokrv2}}<input type="hidden" name="cor_rokrv2" value="{$cor_data.{$fields.cor_rokrv2}}" /></td>
        </tr>
        {/if}
        {/foreach}
{if !isset($data.ajax)}</table>{/if}