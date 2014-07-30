<table width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <fieldset style="width: 1030px;">
      <legend>Questgeber Template</legend>
      <form id="q_gi_frm">
      <div id="quest_giver_content" class="white_content_div" style="height: 300px;">
      {include file="default/sections/quest_giver_content.tpl"}
      </div>
      </form>
    </fieldset></td>
  </tr>
  <tr>
    <td align="center">
    <fieldset style="width: 300px;"><legend>Aktionen</legend>
    <table width="300">
    <tr>
    <td align="center"><input type="button" name="submit" id="q_gi_add" value="Hinzufügen" class="base_button new_button" /></td>
    <td align="center"><input type="button" name="delete" id="q_gi_del" value="Löschen" class="base_button del_button" /></td>
    </tr>
    </table>
    </fieldset>
    </td>
  </tr>
</table>
<script type="text/javascript">
{literal}
$('q_gi_add').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=s_questgifi&gifi=gi', {method: 'get'});
            });
$('q_gi_del').observe('click', function(e) {
               var qg_sel_radio = $$('input:checked[type="radio"][id="qg_sel"]').pluck('value');
               var qg_sel_row = $('qg_' + qg_sel_radio);
               qg_sel_row.remove();
            });
{/literal}
</script>