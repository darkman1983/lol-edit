<form id="creature_equip_add" autocomplete="off" onSubmit="new Ajax.Updater('dialog_content', '/index?mode=dialog&dialog=c_equip_result&ret={$dialog.ret}',{literal} {parameters: $('creature_equip_add').serialize(true)}); return false;">{/literal}
<table width="100%">
        <tr>
          <td>Entry</td>
          <td>ItemEntry1</td>
          <td>ItemEntry2</td>
          <td>ItemEntry3</td>
        </tr>
        <tr>
          <td><input type="text" name="{$fields.ceq_id}" /></td>
          <td><input type="text" name="{$fields.ceq_ient1}" /></td>
          <td><input type="text" name="{$fields.ceq_ient2}" /></td>
          <td><input type="text" name="{$fields.ceq_ient3}" /></td>
        </tr>
</table>
</form>
<fieldset>
  <legend>Ergebnisse</legend>
  <div id="dialog_content" style="overflow: auto; height: 355px; width: 100%" align="center"></div>
</fieldset>