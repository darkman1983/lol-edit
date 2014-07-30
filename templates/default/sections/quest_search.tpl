<div align="center">
{literal}<form id="quest_search" autocomplete="off" onSubmit="new Ajax.Updater('quest_search_content', '/index?mode=quest_search', {parameters: $('quest_search').serialize(true)}); new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=q_s', {method: 'get'}); return false;">{/literal}
  <fieldset style="width: 300px;">
  <table cellspacing="0" cellpadding="0">
  <tr>
    <td>Quest ID (entry)</td>
    <td colspan="5">Titel</td>
  </tr>
  <tr>
    <td><input type="text" name="q_id" id="sq_id" /></td>
    <td colspan="4"><input name="q_title" type="text" id="sq_title" style="width: 560px;" /></td>
    <td><input type="submit" name="button" id="button" value="Suche" class="base_button search_button" /></td>
    </tr>
  <tr>
    <td>Questgeber</td>
    <td>Questnehmer</td>
    <td>Vorherige Quest</td>
    <td>Nächste Quest</td>
    <td colspan="2">Zone/Sorte</td>
    </tr>
  <tr>
    <td>
    <div class="search_div">
    <input type="text" name="s_questgiver" id="s_questgiver" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="s_qgi_a1"></a>
    </div>
    </td>
    <td>
    <div class="search_div">
    <input type="text" name="s_questfinisher" id="s_questfinisher" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="s_qgi_a2"></a>
    </div>
    </td>
    <td><input type="text" name="q_prev" id="sq_prev" /></td>
    <td><input type="text" name="q_next" id="sq_next" /></td>
    <td>
         <div class="search_div">
         <input type="text" name="q_zos" id="sq_zos" />
         <a href="javascript:void(null);" title="Auswählen" class="search_a" id="s_qzos_a"></a>
         </div>
      </td>
    <td><input type="reset" name="button2" id="button2" value="Zurücksetzen" class="base_button reset_button" /></td>
    </tr>
</table>
  </fieldset>
</form>
{literal}
<fieldset style="width: 300px;"><legend>Ergebnisse</legend>
<form id="quest_s_content_form" autocomplete="off" onSubmit="return false;">{/literal}
<div id="quest_search_content" class="white_content_div" style="height: 600px;">
</div>
</form>
</fieldset>
<fieldset style="width: 300px;"><legend>Aktionen</legend>
<table width="300">
  <tr>
    <td align="center"><input type="button" name="new_quest" id="new_quest" value="Neue Quest" class="base_button new_button" /></td>
    <td align="center"><input type="button" name="edit_quest" id="edit_quest" value="Quest Editieren" class="base_button edit_button" /></td>
    <td align="center"><input type="button" name="delete_quest" id="delete_quest" value="Quest Löschen" class="base_button del_button" /></td>
  </tr>
  <tr>
  <td colspan="3"><div id="quest_action_status"></div></td>
  <tr>
</table>
</fieldset>
<script type="text/javascript">
{literal}
$('new_quest').observe('click', function(e) {
  new Ajax.Updater('quest_main_content', '/index?mode=quest_load&tpl=main', {evalScripts: true, onSuccess: function(response) {
    new Ajax.Updater('q_id_field', '/index?mode=quest_new', {method: 'get'});
    }
  });

  $('q_method').value = 2;
  new Ajax.Updater('quest_ext_content', '/index?mode=quest_load&tpl=ext', {evalScripts: true});
  new Ajax.Updater('quest_giver_content', '/index?mode=gifi_load&gifi=gi', {evalScripts: true});
  new Ajax.Updater('quest_finisher_content', '/index?mode=gifi_load&gifi=fi', {evalScripts: true});
  
  new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=q_n', {method: 'get'});
  $('quest_sub_tab').tabber.tabShow(1);
            });

$('edit_quest').observe('click', function(e) {
                new Ajax.Updater('quest_main_content', '/index?mode=quest_load&tpl=main', {parameters: $('quest_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('quest_ext_content', '/index?mode=quest_load&tpl=ext', {parameters: $('quest_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=q_l', {method: 'get', parameters: {'id': qselected_value}, evalScripts: true});
                new Ajax.Updater('quest_giver_content', '/index?mode=gifi_load&gifi=gi', {method: 'get', parameters: {'gifi_id': qselected_value}, evalScripts: true});
                new Ajax.Updater('quest_finisher_content', '/index?mode=gifi_load&gifi=fi', {method: 'get', parameters: {'gifi_id': qselected_value}, evalScripts: true});

                $('quest_sub_tab').tabber.tabShow(1);
            });
            
$('s_qgi_a1').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=s_questgifi&gifi=gi&ret=s_qgi_a1', {method: 'get'});
            });

$('s_qgi_a2').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=s_questgifi&gifi=fi&ret=s_qgi_a2', {method: 'get'});
            });
            
$('s_qzos_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=zonesort&upt_id=sq_zos', {method: 'get'});
            });
{/literal}
</script>
</div>