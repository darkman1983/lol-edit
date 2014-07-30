<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
{if isset($info.refresh)}<meta http-equiv="refresh" content="0; URL=index">{/if}
<title>LoL-DB-Editor</title>
<link href="templates/default/css/loledit.css" rel="stylesheet" type="text/css" />
<link href="templates/default/css/tabber.css" rel="stylesheet" type="text/css" />
<link href="templates/default/css/opentip.css" rel="stylesheet" type="text/css" />

{literal}
<script type="text/javascript">
/* Optional: Temporarily hide the "tabber" class so it does not "flash"
   on the page as plain HTML. After tabber runs, the class is changed
   to "tabberlive" and it will appear.
*/
document.write('<style type="text/css">.tabber{display:none;}<\/style>');

function setCookie(cname,cvalue,exdays)
{
    var d = new Date();
    d.setTime(d.getTime()+(exdays*24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname)
{
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++)
    {
        var c = ca[i].trim();
        if (c.indexOf(name)==0) return c.substring(name.length,c.length);
    }
    return 0;
}

var tabberOptions = {

  /* Optional: instead of letting tabber run during the onload event,
     we'll start it up manually. This can be useful because the onload
     even runs after all the images have finished loading, and we can
     run tabber at the bottom of our page to start it up faster. See the
     bottom of this page for more info. Note: this variable must be set
     BEFORE you include tabber.js.
  */
  'manualStartup':true,

  /* Optional: code to run after each tabber object has initialized */

  'onLoad': function(argsObj) {
    /* Display an alert only after tab2 */
    if (argsObj.tabber.id == 'tab2') {
      alert('Finished loading tab2!');
    }
  },

  /* Optional: code to run when the user clicks a tab. If this
     function returns boolean false then the tab will not be changed
     (the click is canceled). If you do not return a value or return
     something that is not boolean false, */

  'onClick': function(argsObj) {

    var t = argsObj.tabber; /* Tabber object */
    var id = t.id; /* ID of the main tabber DIV */
    var i = argsObj.index; /* Which tab was clicked (0 is the first tab) */
    var e = argsObj.event; /* Event object */

    if(id == 'root_tab')
      setCookie('root_tab',i,360);
    if(id == 'quest_sub_tab')
      setCookie('quest_sub_tab',i,360);
    if(id == 'creature_sub_tab')
      setCookie('creature_sub_tab',i,360);

    if (id == 'tab2') {
      return confirm('Swtich to '+t.tabs[i].headingText+'?\nEvent type: '+e.type);
    }
  },

  /* Optional: set an ID for each tab navigation link */
  'addLinkId': true

};

//Tip Pointer holder for gameobject data fields
var tip_holder = [];
</script>
{/literal}

<!-- Load the tabber code -->
<script type="text/javascript" src="templates/default/js/tabber.js"></script>
<script type="text/javascript" src="http://loldb.landoflegends.de/power.js"></script>
<!-- Load Prototype for Ajax -->
<script type="text/javascript" src="templates/default/js/prototype.js"></script>
<script type="text/javascript" src="templates/default/js/scriptaculous.js"></script>
<script type="text/javascript" src="templates/default/js/opentip-native.js"></script>

<script type="text/javascript">
/* Prototype center function */
Element.addMethods(
{
		center: function ( element, limitX, limitY )
		{
			element = $(element);
			
			var elementDims = element.getDimensions();
			var viewPort = document.viewport.getDimensions();
			var offsets = document.viewport.getScrollOffsets();
			var centerX = viewPort.width / 2 + offsets.left - elementDims.width / 2;
			var centerY = viewPort.height / 2 + offsets.top - elementDims.height / 2;
			if ( limitX && centerX < limitX )
			{
				centerX = parseInt(limitX);
			}
			if ( limitY && centerY < limitY )
			{
				centerY = parseInt(limitY);
			}
			
			element.setStyle( { position: 'absolute', top: Math.floor(centerY) + 'px', left: Math.floor(centerX) + 'px' } );
			
			return element;			
		}
	}
);

var qselected_value = '';

//Update Logout Time
new Ajax.PeriodicalUpdater('autologout', '/index?mode=upt_autologout', {literal}{method: 'get', frequency: 20});{/literal}
new Ajax.PeriodicalUpdater('usr_sess', '/index?mode=upt_usr_sess', {literal}{method: 'get', frequency: 60});{/literal}

function serialize_form(frm)
{
if($(frm) != undefined)
{
return $(frm).serialize(true);
}
alert('nix gefunden');
}

//Add Checkbox Values togehter
function checkAdd(form)
{
   var tform = $(form); 
   
   var arr = tform.getInputs('checkbox');
   var int = 0;
   
   arr.each(function(item) {
   if( $(item).checked )
     int = parseInt(int) + parseInt(item.value);
   });
   
return int;
}

//Update SQL
var quest, creature, object, item, gen_sql;
</script>
</head>
<body{if isset($info.logouttime)} onload="new Ajax.Updater('log_content', '/index?mode=load_log&id={$info.id}', {literal}{method: 'get'}{/literal});"{/if}>
<div class="page_content">
{if isset($info.logouttime)}
<div class="autologout">Automatischer logout bei Inaktivität: <span id="autologout">{$info.logouttime}</span></div>
<div class="user_sessions">Aktuell eingeloggte Benutzer: <span id="usr_sess">{$info.usr_sess}</span></div>
{/if}
<div id="dialog_container" class="dialog_container">
<div id="dialog_dragger" class="dialog_dragger" align="right"><a onClick="$$('div.dialog_container').invoke('setStyle', { display: 'none', width: '500px', height: '514px' });">X&nbsp;</a></div>
<div id="dialog" class="dialog"></div>
</div>