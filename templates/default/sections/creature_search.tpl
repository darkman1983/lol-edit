<div align="center">
{literal}<form id="creature_search" autocomplete="off" onSubmit="new Ajax.Updater('creature_search_content', '/index?mode=creature_search', {parameters: $('creature_search').serialize(true)}); new Ajax.Updater('log_content', '/index.php?mode=save_log&desc_id=c_s', {method: 'get'}); return false;">{/literal}
<fieldset style="width: 300px;">
  <table width="100%" cellspacing="0" cellpadding="0">
    <tr>
      <td>ID (entry)</td>
      <td colspan="2">Name</td>
    </tr>
    <tr>
      <td><input type="text" name="c_id" id="cs_id" /></td>
      <td><input type="text" name="c_name" id="cs_name" /></td>
      <td><input type="hidden" name="c_flag_exco" id="c_flag_exco" /><input type="submit" name="cs_subm" id="cs_subm" value="Suchen" class="base_button search_button" /></td>
    </tr>
    <tr>
      <td>NPCFlag</td>
      <td colspan="2">Zweitname</td>
    </tr>
    <tr>
      <td><input type="text" name="c_flag" id="cs_flag" /></td>
      <td><input type="text" name="c_subn" id="cs_subn" /></td>
      <td><input type="reset" name="cs_reset" id="cs_reset" value="Zurücksetzen" class="base_button reset_button" /></td>
    </tr>
  </table>
  </fieldset>
</form>
{literal}
<fieldset style="width: 300px;"><legend>Ergebnisse</legend>
<form id="creature_s_content_form" autocomplete="off" onSubmit="return false;">{/literal}
<div id="creature_search_content" class="white_content_div" style="height: 600px;">
</div>
</form>
</fieldset>
<fieldset style="width: 300px;"><legend>Aktionen</legend>
<table width="300">
  <tr>
    <td align="center"><input type="button" name="new_creature" id="new_creature" value="Neue Kreatur" class="base_button new_button" /></td>
    <td align="center"><input type="button" name="edit_creature" id="edit_creature" value="Kreatur Editieren" class="base_button edit_button" /></td>
    <td align="center"><input type="button" name="delete_creature" id="delete_creature" value="Kreatur Löschen" class="base_button del_button" /></td>
  </tr>
  <tr>
  <td colspan="3"><div id="creature_action_status"></div></td>
  <tr>
</table>
</fieldset>
<script type="text/javascript">
{literal}
$('new_creature').observe('click', function(e) {
  new Ajax.Updater('creature_main_content', '/index?mode=creature_load&tpl=main', {evalScripts: true, onSuccess: function(response) {
    new Ajax.Updater('c_id_field', '/index?mode=creature_new', {method: 'get'});
    }
  });

  new Ajax.Updater('creature_equip_content', '/index?mode=creature_load&tpl=equip_tpl', {evalScripts: true});
  new Ajax.Updater('creature_template_addon_content', '/index?mode=creature_load&tpl=addon_tpl', {evalScripts: true});
  new Ajax.Updater('creature_onkill_rep_content', '/index?mode=creature_load&tpl=onkill_rep', {evalScripts: true});
  new Ajax.Updater('creature_model_info_content', '/index?mode=creature_load&tpl=model_info', {evalScripts: true});
  new Ajax.Updater('loot_content', '/index?mode=loot_load', {parameters: {'type': 'creature_loot_template'}, evalScripts: true});
  new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=c_n', {method: 'get'});
  $('creature_sub_tab').tabber.tabShow(1);
            });
            
$('edit_creature').observe('click', function(e) {
                new Ajax.Updater('creature_main_content', '/index?mode=creature_load&tpl=main', {parameters: $('creature_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('creature_equip_content', '/index?mode=creature_load&tpl=equip_tpl', {parameters: $('creature_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('creature_template_addon_content', '/index?mode=creature_load&tpl=addon_tpl', {parameters: $('creature_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('creature_onkill_rep_content', '/index?mode=creature_load&tpl=onkill_rep', {parameters: $('creature_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('creature_model_info_content', '/index?mode=creature_load&tpl=model_info', {parameters: $('creature_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('loot_content', '/index?mode=loot_load', {parameters: {'id': cselected_value, 'type': 'creature_loot_template'}, evalScripts: true});
                new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=c_l', {method: 'get', parameters: {'id': cselected_value}});

                $('creature_sub_tab').tabber.tabShow(1);
            });
{/literal}
</script>
</div>