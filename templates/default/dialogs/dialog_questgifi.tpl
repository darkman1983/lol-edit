<form id="quest_questgiver_search" autocomplete="off" onSubmit="new Ajax.Updater('dialog_content', '/index?mode=dialog&dialog=s_questgifi_result&gifi={$dialog.gifi}&ret={$dialog.ret}',{literal} {parameters: $('quest_questgiver_search').serialize(true)}); return false;">{/literal}
<table width="100%">
  <tr>
    <td colspan="3" align="center"><fieldset>
      <legend>Typ</legend>
      <table>
        <tr>
          <td align="center"><input type="radio" name="qr_type" value="creature" checked />
            <label for="radio">Kreatur</label></td>
          <td align="center"><input type="radio" name="qr_type" value="object" />
            <label for="radio2">Gameobjekt</label></td>
          <td align="center"><input type="radio" name="qr_type" value="item" />
            <label for="radio3">Gegenstand</label></td>
        </tr>
      </table>
    </fieldset></td>
  </tr>
  <tr>
    <td>ID</td>
    <td>Name</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><label for="textfield"></label>
    <input type="text" name="s_id" /></td>
    <td><label for="textfield2"></label>
    <input type="text" name="s_name" /></td>
    <td align="center"><input type="submit" name="button" id="button" value="Suchen" /></td>
  </tr>
</table>
</form>
<fieldset>
  <legend>Ergebnisse</legend>
  <div id="dialog_content" style="overflow: auto; height: 355px; width: 100%" align="center"></div>
</fieldset>