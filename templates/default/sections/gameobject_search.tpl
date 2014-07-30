<div align="center">
{literal}<form id="gameobject_search" autocomplete="off" onSubmit="new Ajax.Updater('gameobject_search_content', '/index?mode=gameobject_search', {parameters: $('gameobject_search').serialize(true)}); new Ajax.Updater('log_content', '/index.php?mode=save_log&desc_id=g_s', {method: 'get'}); return false;">{/literal}
<fieldset style="width: 300px;">
  <table width="100%" cellspacing="0" cellpadding="0">
    <tr>
      <td>ID (entry)</td>
      <td>Name</td>
      <td>Type</td>
      <td>Fraktion</td>
    </tr>
    <tr>
      <td><input type="text" name="g_id" id="gs_id" /></td>
      <td><input type="text" name="g_name" id="gs_name" /></td>
      <td><div class="search_div"><input type="text" name="g_typ" id="gs_typ" /><a href="javascript:void(null);" title="Auswählen" class="search_a" id="s_gtype_a1"></div></td>
      <td><input type="text" name="g_fac" id="gs_fac" /></td>
      <td><input type="hidden" name="c_flag_exco" id="g_flag_exco" /><input type="submit" name="gs_subm" id="gs_subm" value="Suchen" class="base_button search_button" /></td>
    </tr>
    <tr>
      <td>Data0</td>
      <td>Data1</td>
      <td colspan="2">Data2</td>
    </tr>
    <tr>
      <td><input type="text" name="g_dat0" id="gs_dat0" /></td>
      <td><input type="text" name="g_dat1" id="gs_dat1" /></td>
      <td colspan="2"><input type="text" name="g_dat2" id="gs_dat2" /></td>
      <td><input type="reset" name="gs_reset" id="gs_reset" value="Zurücksetzen" class="base_button reset_button" /></td>
    </tr>
  </table>
  </fieldset>
</form>
{literal}
<fieldset style="width: 300px;"><legend>Ergebnisse</legend>
<form id="gameobject_s_content_form" autocomplete="off" onSubmit="return false;">{/literal}
<div id="gameobject_search_content" class="white_content_div" style="height: 600px;">
</div>
</form>
</fieldset>
<fieldset style="width: 300px;"><legend>Aktionen</legend>
<table width="300">
  <tr>
    <td align="center"><input type="button" name="new_gameobject" id="new_gameobject" value="Neue Kreatur" class="base_button new_button" /></td>
    <td align="center"><input type="button" name="edit_gameobject" id="edit_gameobject" value="Kreatur Editieren" class="base_button edit_button" /></td>
    <td align="center"><input type="button" name="delete_gameobject" id="delete_gameobject" value="Kreatur Löschen" class="base_button del_button" /></td>
  </tr>
  <tr>
  <td colspan="3"><div id="gameobject_action_status"></div></td>
  <tr>
</table>
</fieldset>
<script type="text/javascript">
{literal}
$('new_gameobject').observe('click', function(e) {
  new Ajax.Updater('gameobject_main_content', '/index?mode=gameobject_load&tpl=main', {evalScripts: true, onSuccess: function(response) {
    new Ajax.Updater('g_id_field', '/index?mode=gameobject_new', {method: 'get'});
    }
  });

  new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=g_n', {method: 'get'});
  $('gameobject_sub_tab').tabber.tabShow(1);
});
            
$('edit_gameobject').observe('click', function(e) {
                new Ajax.Updater('gameobject_main_content', '/index?mode=gameobject_load&tpl=main', {parameters: $('gameobject_s_content_form').serialize(true), evalScripts: true});
                new Ajax.Updater('log_content', '/index?mode=save_log&desc_id=g_l', {method: 'get', parameters: {'id': gselected_value}});

                $('gameobject_sub_tab').tabber.tabShow(1);
            });
            
$('s_gtype_a1').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=g_type&upt_id=gs_typ', {method: 'get'});
            });
{/literal}
</script>
</div>