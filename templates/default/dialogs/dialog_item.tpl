<form id="item_search" autocomplete="off" onSubmit="new Ajax.Updater('dialog_content', '/index?mode=dialog&dialog=item_result&upt_id={$dialog.upt_id}',{literal}{parameters: $('item_search').serialize(true)}); return false;">{/literal}
<table width="100%">
  <tr>
    <td>ID</td>
    <td>Name</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="text" name="sitem_id" /></td>
    <td><input type="text" name="sitem_name" /></td>
    <td align="center"><input type="submit" name="button" id="button" value="Suchen" /></td>
  </tr>
</table>
</form>
<fieldset>
  <legend>Ergebnisse</legend>
  <div id="dialog_content" style="overflow: auto; height: 415px; width: 100%" align="center"></div>
</fieldset>