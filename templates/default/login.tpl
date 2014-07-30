{include file="default/header.tpl"}

<div id="loginform" align="center" style="width:270px; height: 250px;">
<img src="templates/default/images/lol-trinity.png" />
<form name="login" action="index?mode=login" method="post" autocomplete="off" style="border: 2px solid black;">
<table>
<tr><td width="35"><img src="templates/default/images/users.png" width="32" height="32" /></td><td><input name="name" id="name" type="text" /></td></tr>
<tr><td width="35"><img src="templates/default/images/security.png" width="32" height="32" /></td><td><input name="pass" type="password" /></td></tr>
<tr><td colspan="2" align="center"><input name="submit" type="submit" value="Einloggen" class="c-button" /></td></tr>
</table>
</form><br>
<div id="error">{if isset($info.error)}{$info.error}{/if}</div>
</div>
<script type="text/javascript">
$('loginform').center()
{literal}setInterval(function(){$('loginform').center()},100);{/literal}
Event.observe(window, 'load', function() {
  $('name').focus();
});
</script>
{include file="default/footer.tpl"}