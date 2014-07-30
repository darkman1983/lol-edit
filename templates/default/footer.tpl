</div>
<div class="footer" align="center">&copy; 2012-2014 : Timo Stepputtis</div>
{if isset($info.logouttime)}
<script type="text/javascript">
/* Since we specified manualStartup=true, tabber will not run after
   the onload event. Instead let's run it now, to prevent any delay
   while images load.
*/

tabberAutomatic(tabberOptions);
new Draggable('dialog_container', { handle: 'dialog_dragger' });

var cookie_r = getCookie('root_tab');
var cookie_q = getCookie('quest_sub_tab');
var cookie_c = getCookie('creature_sub_tab');

var upt_autologout_time = false;

document.getElementById('root_tab').tabber.tabShow(cookie_r);
document.getElementById('quest_sub_tab').tabber.tabShow(cookie_q);
document.getElementById('creature_sub_tab').tabber.tabShow(cookie_c);

$$('form').each(function(element) {
      new Form.Observer(element.id, 30, function(form, value){
        upt_autologout_time = true;
      });
     });

/* Update Form Data Array */
new PeriodicalExecuter(function(pe) {

if(upt_autologout_time)
{
new Ajax.Request('/index?mode=upt_autologout_time&id={$info.id}', {
  onSuccess: function(response) {
    upt_autologout_time = false;
  }
});
}

{literal}
var q_frm1,q_frm2,q_frm3,q_frm4,q_frm,c_frm1,c_frm,c_frm2,c_frm3,c_frm4, c_frm5, c_frm6, c_frm7,g_frm1,g_frm2;

q_frm1 = $('q_main_frm').serialize(true);
q_frm2 = $('q_ext_frm').serialize(true);
q_frm3 = $('q_gi_frm').serialize(true);
q_frm4 = $('q_fi_frm').serialize(true);

q_frm = [];
q_frm.push(q_frm1);
q_frm.push(q_frm2);
q_frm.push(q_frm3);
q_frm.push(q_frm4);
q_frm = JSON.stringify(q_frm);

c_frm1 = $('c_main_frm').serialize(true);
c_frm2 = $('c_eq_frm').serialize(true);
c_frm3 = $('c_add_frm').serialize(true);
c_frm4 = $('c_tadd_frm').serialize(true);
c_frm5 = $('c_or_frm').serialize(true);
c_frm6 = $('cmi_frm').serialize(true);
c_frm7 = $('lo_add_frm').serialize(true);

c_frm = [];
c_frm.push(c_frm1);
c_frm.push(c_frm2);
c_frm.push(c_frm3);
c_frm.push(c_frm4);
c_frm.push(c_frm5);
c_frm.push(c_frm6);
c_frm.push(c_frm7);
c_frm = JSON.stringify(c_frm);

g_frm1 = $('g_main_frm').serialize(true);
g_frm2 = $('lo_add_frm').serialize(true);

g_frm = [];
g_frm.push(g_frm1);
g_frm.push(g_frm2);
g_frm = JSON.stringify(g_frm);


new Ajax.Updater('quest_sql', '/index?mode=upt_sql&tpl=quest', {parameters: {json: q_frm}, evalJSON: 'force'});
new Ajax.Updater('creature_sql', '/index?mode=upt_sql&tpl=creature', {parameters: {json: c_frm}, evalJSON: 'force'});
new Ajax.Updater('gameobject_sql', '/index?mode=upt_sql&tpl=gameobject', {parameters: {json: g_frm}, evalJSON: 'force'});
new Ajax.Updater('file_store', '/index?mode=stor_upt', {method: 'get', evalScripts: true});
}, 20);


// Tooltips for Datafields
var last_g_typ = $('g_typ').value;

var can_continue = false;
var updateStarted = false;
var gtyp_start = '';
var idtip = 0;

new PeriodicalExecuter(function(pe) {
  if($('g_typ').value != '' && $('g_typ').value != last_g_typ)
    {      
      if(!updateStarted)
        gtyp_start = $('g_typ').value;
            
      if(idtip < 24 && (idtip == 0 || (idtip > 0 && can_continue)) && $('g_typ').value == gtyp_start)
        {        
          $('g_dat_cont').style = "visibility:hidden";
          $('g_dat_loader').setStyle({background: 'url(./images/ajax-loader.gif) center center no-repeat'});
          
          updateStarted = true;
          can_continue = false;
      
          new Ajax.Request('/index?mode=dialog&dialog=g_type_desc&upt_id=g_dat'+idtip+'&field='+idtip+'&g_typ='+gtyp_start, {
          onComplete: function(response) {
            if (200 == response.status)
              {
                tip_holder[idtip].setContent(response.responseText);
                can_continue = true;
                idtip++;
            }
          }
        });
      }else 
        {
          can_continue = false;
          updateStarted = false;
          $('g_dat_loader').setStyle({background: 'none'});
          $('g_dat_cont').style = "visibility:visible";
          last_g_typ = gtyp_start;
          gtyp_start = '';
          idtip = 0;
        }
    }
  }, 1);
{/literal}
</script>
{else}
<script type="text/javascript">
setCookie('root_tab',0,360);
setCookie('quest_sub_tab',0,360);
setCookie('creature_sub_tab',0,360);
</script>
{/if}
</body>
</html>