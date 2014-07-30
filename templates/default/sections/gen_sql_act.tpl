<fieldset style="width: 300px;"><legend>Aktionen</legend>
<table border="0" width="300">
  <tbody><tr>
    <td align="center"><input type="button" value="SQL Speichern" id="{$id}_sql_sav" name="{$id}_sql_sav" class="base_button save_button"></td>
    <td align="center"><input type="button" value="SQL Löschen" id="{$id}_sql_del" name="{$id}_sql_del" class="base_button del_button"></td>
  </tr>
  <tr>
  <td colspan="2"><div id="{$id}_sql_action_status"></div></td>
  </tr><tr>
</tr></tbody></table>
</fieldset>
<script type="text/javascript">
$('{$id}_sql_sav').observe('click', function(e) {literal}{
                new Ajax.Updater({/literal}'{$id}_sql_action_status', '/index?mode=stor_file', {literal}{parameters: {{/literal}type: '{$id}', id: $('{if $id == 'quest'}q_id{else if $id == 'creature'}c_id{else if $id == 'gameobject'}g_id{else if $id == 'item'}i_id{else}si_id{/if}').value, name: $('{if $id == 'quest'}q_title{else if $id == 'creature'}c_name{else if $id == 'gameobject'}g_name{else if $id == 'item'}i_name{else}si_name{/if}').value, content: $('{$id}_sql_script').innerHTML, evalScripts: true{literal}}}{/literal});
            });

$('{$id}_sql_del').observe('click', {literal}function(e) {
                new Ajax.Updater('{/literal}{$id}_sql_action_status', '/index?mode=del_file', {literal}{parameters: $('file_stor_frm').serialize(true), evalScripts: true});
            });
            {/literal}
</script>