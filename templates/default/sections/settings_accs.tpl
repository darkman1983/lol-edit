{if !isset($is_acc_ajax)}
<table>
<tr>
{if isset($info.level) && $info.level == 1}
<td>
{if isset($info.level) && $info.level == 1}<form id="usr_create_frm" autocomplete="off">{/if}
<fieldset style="width: 300px;">
<legend>Account Erstellen</legend>
<table>
<tr>
<td>Name:</td><td><input type="textfield" name="name" \></td>
</tr>
<tr>
<td>Voller Name:</td><td><input type="textfield" name="fullname" \></td>
</tr>
<tr>
<td>Passwort:</td><td><input type="password" name="password" \></td>
</tr>
<tr>
<td>Level:</td><td><select name="level"><option value="0">Normal</option><option value="1">Admin</option></select></td>
</tr>
</table>
<div id="create_status"></div>
</fieldset>
{if isset($info.level) && $info.level == 1}</form>{/if}
</td>
{/if}
<td>
<form id="usr_edit_frm" autocomplete="off">
<fieldset style="width: 300px;">
<legend>Account Editieren</legend>
<table>
<tr>
<td>Name:</td><td><input type="textfield" name="name" value="{$info.name}" \></td>
</tr>
<tr>
<td>Voller Name:</td><td><input type="textfield" name="fullname" value="{$info.fullname}" \></td>
</tr>
<tr>
<td>Passwort:</td><td><input type="password" name="password" \></td>
</tr>
<tr>
<td>Level:</td><td><select name="level"><option value="0">Normal</option>{if isset($info.level) && $info.level == 1}<option value="1">Admin</option>{/if}</select></td>
</tr>
<tr>
<td colspan="2"><input type="hidden" name="id" value="{$info.id}" \></td>
</tr>
</table>
<div id="edit_status"></div>
</fieldset>
</form>
</td></tr>
<tr><td{if isset($info.level) && $info.level == 1} colspan="2"{/if} align="center">
<fieldset style="width: 300px;"><legend>Accountliste</legend>
<form id="usr_del_frm" autocomplete="off">
<div id="acclist">
{/if}
<table>
{if empty($accounts)}<tr><td>Keine Accounts gefunden</td></tr>{/if}
{assign var=cnt value=1}
{foreach item="acc" from=$accounts}
{if $cnt == 1}<tr>{/if}
<td><input type="checkbox" name="accs[]" value="{$acc[0]}" \></td><td>{$acc[1]}</td>
{if $cnt == 3}{assign var=cnt value=0}</tr>{/if}
{assign var=cnt value=$cnt+1}
{/foreach}
</table>
{if !isset($is_acc_ajax)}
</div>
{if isset($info.level) && $info.level == 1}</form>{/if}
</fieldset>
<fieldset style="width: 300px;"><legend>Account Aktionen</legend>
<table border="0" width="300">
  <tbody><tr>
    {if isset($info.level) && $info.level == 1}<td align="center"><input type="button" value="Erstellen" id="create_acc" name="create_acc" \></td>{/if}<td align="center"><input type="button" value="Editieren" id="edit_acc" name="edit_acc" \></td>{if isset($info.level) && $info.level == 1}<td align="center"><input type="button" value="Löschen" id="acc_del_btn" name="acc_del_btn" \>{/if}</td>
  </tr>
</tbody></table>
</fieldset>
</td></tr>
</table>
<script type="text/javascript">
{if isset($info.level) && $info.level == 1}
$('create_acc').observe('click', function(e) {literal}{
                new Ajax.Updater('create_status', '/index?mode=create_user', {parameters: $('usr_create_frm').serialize(true)});
            });
$('acc_del_btn').observe('click', function(e) {
var usr_del = confirm("Die oder den Benutzer Löschen?");
if (usr_del == true)
  new Ajax.Updater('acclist', '/index?mode=del_user', {parameters: $('usr_del_frm').serialize(true)});
            });
{/literal}
{/if}
$('edit_acc').observe('click', function(e) {literal}{
                new Ajax.Updater('edit_status', '/index?mode=edit_user', {parameters: $('usr_edit_frm').serialize(true)});
            });
{/literal}
</script>
{/if}