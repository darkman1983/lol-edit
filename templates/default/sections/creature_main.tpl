<form id="c_main_frm">
<table cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td><fieldset>
      <legend>Haupteigenschaften</legend>
      <table cellspacing="0" cellpadding="0">
  <tr>
    <td>ID (entry)</td>
    <td>Schwierigkeit 1</td>
    <td>Schwierigkeit 2</td>
    <td>Schwierigkeit 3</td>
  </tr>
  <tr>
    <td><div id="c_id_field"><input type="text" name="c_id" id="c_id" value="{$data.{$fields.c_id}|default:''}" /></div></td>
    <td><input type="text" name="c_diff_entr1" id="c_diff_entr1" value="{$data.{$fields.c_diff_entr1}|default:''}" /></td>
    <td><input type="text" name="c_diff_entr2" id="c_diff_entr2" value="{$data.{$fields.c_diff_entr2}|default:''}" /></td>
    <td><input type="text" name="c_diff_entr3" id="c_diff_entr3" value="{$data.{$fields.c_diff_entr3}|default:''}" /></td>
  </tr>
  <tr>
    <td>Kill-Belohnung 1</td>
    <td>Kill-Belohnung 2</td>
    <td colspan="2" rowspan="2">&nbsp;</td>
    </tr>
  <tr>
    <td><input type="text" name="c_kcre1" id="c_kcre1" value="{$data.{$fields.c_kcre1}|default:''}" /></td>
    <td><input type="text" name="c_kcre2" id="c_kcre2" value="{$data.{$fields.c_kcre2}|default:''}" /></td>
    </tr>
  <tr>
    <td>Name</td>
    <td>Zusatzname</td>
    <td colspan="2">Icon Name</td>
    </tr>
  <tr>
    <td><input name="c_name" type="text" id="c_name" value="{$data.{$fields.c_name}|default:''}" /></td>
    <td><input type="text" name="c_subn" id="c_subn" value="{$data.{$fields.c_subn}|default:''}" /></td>
    <td colspan="2"><input type="text" name="c_icon_name" id="c_icon_name" value="{$data.{$fields.c_icon_name}|default:''}" /></td>
    </tr>
  <tr>
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr>
    <td>Model 1</td>
    <td>Model 2</td>
    <td>Model 3</td>
    <td>Model 4</td>
  </tr>
  <tr>
    <td>
    <div class="search_div">
    <input type="text" name="c_m_id1" id="c_m_id1" value="{$data.{$fields.c_m_id1}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_m_id1_a"></a>
    </div>
    </td>
    <td>
    <div class="search_div">
    <input type="text" name="c_m_id2" id="c_m_id2" value="{$data.{$fields.c_m_id2}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_m_id2_a"></a>
    </div>
    </td>
    <td>
    <div class="search_div">
    <input type="text" name="c_m_id3" id="c_m_id3" value="{$data.{$fields.c_m_id3}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_m_id3_a"></a>
    </div>
    </td>
    <td>
    <div class="search_div">
    <input type="text" name="c_m_id4" id="c_m_id4" value="{$data.{$fields.c_m_id4}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_m_id4_a"></a>
    </div>
    </td>
  </tr>
  <tr>
    <td>Min Gold</td>
    <td>Max Gold</td>
    <td>Min Level</td>
    <td>Max Level</td>
  </tr>
  <tr>
    <td><input type="text" name="c_migo" id="c_migo" value="{$data.{$fields.c_migo}|default:''}" /></td>
    <td><input type="text" name="c_mago" id="c_mago" value="{$data.{$fields.c_mago}|default:''}" /></td>
    <td><input type="text" name="c_milvl" id="c_milvl" value="{$data.{$fields.c_milvl}|default:''}" /></td>
    <td><input type="text" name="c_malvl" id="c_malvl" value="{$data.{$fields.c_malvl}|default:''}" /></td>
  </tr>
  <tr>
    <td>Leben Multi.</td>
    <td>Mana Multi.</td>
    <td>Fahrzeug ID</td>
    <td>Kreatur Expansion</td>
  </tr>
  <tr>
    <td><input type="text" name="c_hmod" id="c_hmod" value="{$data.{$fields.c_hmod}|default:''}" /></td>
    <td><input type="text" name="c_mamod" id="c_mamod" value="{$data.{$fields.c_mamod}|default:''}" /></td>
    <td><input type="text" name="c_veh_id" id="c_veh_id" value="{$data.{$fields.c_veh_id}|default:''}" /></td>
    <td><input type="text" name="c_exp" id="c_exp" value="{$data.{$fields.c_exp}|default:''}" /></td>
  </tr>
</table>
    </fieldset></td>
    <td rowspan="2"><fieldset>
      <legend>Weitere Eigenschaften</legend>
      <table cellspacing="0" cellpadding="0">
  <tr>
    <td>Min Schaden</td>
    <td>Max Schaden</td>
    <td>Basisangriffskraft</td>
    <td>Schaden Multi</td>
    <td>Zeit (Basis)</td>
  </tr>
  <tr>
    <td><input type="text" name="c_midmg" id="c_midmg" value="{$data.{$fields.c_midmg}|default:''}" /></td>
    <td><input type="text" name="c_madmg" id="c_madmg" value="{$data.{$fields.c_madmg}|default:''}" /></td>
    <td><input type="text" name="c_attpow" id="c_attpow" value="{$data.{$fields.c_attpow}|default:''}" /></td>
    <td><input type="text" name="c_dmg_multi" id="c_dmg_multi" value="{$data.{$fields.c_dmg_multi}|default:''}" /></td>
    <td><input type="text" name="c_battti" id="c_battti" value="{$data.{$fields.c_battti}|default:''}" /></td>
  </tr>
  <tr>
    <td>Min Dist. Schaden</td>
    <td>Max Dist. Schaden</td>
    <td>Schadenstyp</td>
    <td>Zeit (Dist.)</td>
    <td>Distanzangriffskraft</td>
  </tr>
  <tr>
    <td><input type="text" name="c_miradmg" id="c_miradmg" value="{$data.{$fields.c_miradmg}|default:''}" /></td>
    <td><input type="text" name="c_maradmg" id="c_maradmg" value="{$data.{$fields.c_maradmg}|default:''}" /></td>
    <td><input type="text" name="c_dmgsch" id="c_dmgsch" value="{$data.{$fields.c_dmgsch}|default:''}" /></td>
    <td><input type="text" name="c_ratti" id="c_ratti" value="{$data.{$fields.c_ratti}|default:''}" /></td>
    <td><input type="text" name="c_raattpow" id="c_raattpow" value="{$data.{$fields.c_raattpow}|default:''}" /></td>
  </tr>
  <tr>
    <td>Leben Reg.</td>
    <td>NPC Klasse</td>
    <td>NPC Flag2</td>
    <td>&nbsp;</td>
    <td>WDB Verified</td>
  </tr>
  <tr>
    <td><input type="text" name="c_rehe" id="c_rehe" value="{$data.{$fields.c_rehe}|default:''}" /></td>
    <td><input type="text" name="c_ucla" id="c_ucla" value="{$data.{$fields.c_ucla}|default:''}" /></td>
    <td><input type="text" name="unit_flags2" id="unit_flags2" value="{$data.{$fields.unit_flags2}|default:''}" /></td>
    <td>&nbsp;</td>
    <td><input type="text" name="c_wdbv" id="c_wdbv" value="{$data.{$fields.c_wdbv}|default:''}" /></td>
  </tr>
  <tr>
    <td>Rang</td>
    <td>Familie</td>
    <td>Fraktion Allianz</td>
    <td>Fraktion Horde</td>
    <td>Typ</td>
  </tr>
  <tr>
    <td><input type="text" name="c_rnk" id="c_rnk" value="{$data.{$fields.c_rnk}|default:''}" /></td>
    <td>
    <div class="search_div">
    <input type="text" name="c_fam" id="c_fam" value="{$data.{$fields.c_fam}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_fam_a"></a>
    </div>
    </td>
    <td><input type="text" name="c_faca" id="c_faca" value="{$data.{$fields.c_faca}|default:''}" /></td>
    <td><input type="text" name="c_facb" id="c_facb" value="{$data.{$fields.c_facb}|default:''}" /></td>
    <td><input type="text" name="c_type" id="c_type" value="{$data.{$fields.c_type}|default:''}" /></td>
  </tr>
  <tr>
    <td>NPC Flag</td>
    <td>NPC Flags</td>
    <td>Typ Flags</td>
    <td>Dynamic Flags</td>
  </tr>
  <tr>
    <td>
    <div class="search_div">
    <input type="text" name="c_flag" id="c_flag" value="{$data.{$fields.c_flag}|default:''}" />
    <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_flag_a"></a>
    </div>
    </td>
    <td><input type="text" name="c_uflag" id="c_uflag" value="{$data.{$fields.c_uflag}|default:''}" /></td>
    <td><input type="text" name="c_typef" id="c_typef" value="{$data.{$fields.c_typef}|default:''}" /></td>
    <td><input type="text" name="c_dynflag" id="c_dynflag" value="{$data.{$fields.c_dynflag}|default:''}" /></td>
  </tr>
</table>
    </fieldset>      <table cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td><fieldset>
            <legend>Trainer</legend>
            <table cellspacing="0" cellpadding="0">
              <tr>
                <td>Typ</td>
                <td>Zauber</td>
                </tr>
              <tr>
                <td><input type="text" name="c_ttyp" id="c_ttyp" value="{$data.{$fields.c_ttyp}|default:''}" /></td>
                <td><input type="text" name="c_tspell" id="c_tspell" value="{$data.{$fields.c_tspell}|default:''}" /></td>
                </tr>
              <tr>
                <td>Rasse</td>
                <td>Klasse</td>
                </tr>
              <tr>
                <td><input type="text" name="c_trace" id="c_trace" value="{$data.{$fields.c_trace}|default:''}" /></td>
                <td><input type="text" name="c_tclass" id="c_tclass" value="{$data.{$fields.c_tclass}|default:''}" /></td>
                </tr>
              </table>
            </fieldset>          <fieldset>
              <legend>Geschwindigkeit / Größe</legend>
              <table cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="2">Rüstungs Multi.</td>
                </tr>
                <tr>
                  <td colspan="2"><input type="text" name="c_armod" id="c_armod" value="{$data.{$fields.c_armod}|default:''}" /></td>
                </tr>
                <tr>
                  <td>Laufgeschwindigkeit</td>
                  <td>Renngeschwindigkeit</td>
                </tr>
                <tr>
                  <td><input type="text" name="c_sw" id="c_sw" value="{$data.{$fields.c_sw}|default:''}" /></td>
                  <td><input type="text" name="c_sr" id="c_sr" value="{$data.{$fields.c_sr}|default:''}" /></td>
                </tr>
                <tr>
                  <td colspan="2">Größe</td>
                </tr>
                <tr>
                  <td colspan="2"><input type="text" name="c_sc" id="c_sc" value="{$data.{$fields.c_sc}|default:''}" /></td>
                </tr>
              </table>
              </fieldset>          <fieldset>
                <legend>Zauber</legend>
                <table cellspacing="0" cellpadding="0">
                  <tr>
                    <td>Zauber 1</td>
                    <td>Zauber 2</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="c_sp1" id="c_sp1" value="{$data.{$fields.c_sp1}|default:''}" /></td>
                    <td><input type="text" name="c_sp2" id="c_sp2" value="{$data.{$fields.c_sp2}|default:''}" /></td>
                  </tr>
                  <tr>
                    <td>Zauber 3</td>
                    <td>Zauber 4</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="c_sp3" id="c_sp3" value="{$data.{$fields.c_sp3}|default:''}" /></td>
                    <td><input type="text" name="c_sp4" id="c_sp4" value="{$data.{$fields.c_sp4}|default:''}" /></td>
                  </tr>
                  <tr>
                    <td>Zauber 5</td>
                    <td>Zauber 6</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="c_sp5" id="c_sp5" value="{$data.{$fields.c_sp5}|default:''}" /></td>
                    <td><input type="text" name="c_sp6" id="c_sp6" value="{$data.{$fields.c_sp6}|default:''}" /></td>
                  </tr>
                  <tr>
                    <td>Zauber 7</td>
                    <td>Zauber 8</td>
                  </tr>
                  <tr>
                    <td><input type="text" name="c_sp7" id="c_sp7" value="{$data.{$fields.c_sp7}|default:''}" /></td>
                    <td><input type="text" name="c_sp8" id="c_sp8" value="{$data.{$fields.c_sp8}|default:''}" /></td>
                  </tr>
                </table>
          </fieldset></td>
          <td><fieldset>
            <legend>Verhalten</legend>
            <table cellspacing="0" cellpadding="0">
              <tr>
                <td>AI Name</td>
                </tr>
              <tr>
                <td><input type="text" name="c_ai" id="c_ai" value="{$data.{$fields.c_ai}|default:''}" /></td>
                </tr>
              <tr>
                <td>Bewegungs Typ</td>
                </tr>
              <tr>
                <td><input type="text" name="c_mov_id" id="c_mov_id" value="{$data.{$fields.c_mov_id}|default:''}" /></td>
                </tr>
              <tr>
                <td>Bewegungs ID</td>
                </tr>
              <tr>
                <td><input type="text" name="c_mtyp" id="c_mtyp" value="{$data.{$fields.c_mtyp}|default:''}" /></td>
                </tr>
              <tr>
                <td>Bewegungs Ebene</td>
                </tr>
              <tr>
                <td><input type="text" name="c_inhatyp" id="c_inhatyp" value="{$data.{$fields.c_inhatyp}|default:''}" /></td>
                </tr>
              <tr>
                <td>Schwebe Höhe</td>
                </tr>
              <tr>
                <td><input type="text" name="c_hohi" id="c_hohi" value="{$data.{$fields.c_hohi}|default:''}" /></td>
                </tr>
              <tr>
                <td>Menü ID</td>
                </tr>
              <tr>
                <td><input type="text" name="c_gossm_id" id="c_gossm_id" value="{$data.{$fields.c_gossm_id}|default:''}" /></td>
                </tr>
              <tr>
                <td>Script Name</td>
                </tr>
              <tr>
                <td><input type="text" name="c_scrnam" id="c_scrnam" value="{$data.{$fields.c_scrnam}|default:''}" /></td>
                </tr>
              </table>
            
          </fieldset></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table cellspacing="0" cellpadding="0">
      <tr>
        <td><fieldset>
          <legend>Beute</legend>
          <table cellspacing="0" cellpadding="0">
            <tr>
              <td>Allgemein</td>
              </tr>
            <tr>
              <td><input type="text" name="c_lo_id" id="c_lo_id" value="{$data.{$fields.c_lo_id}|default:''}" /></td>
              </tr>
            <tr>
              <td>Tschendiebstahl</td>
              </tr>
            <tr>
              <td><input type="text" name="c_pilo" id="c_pilo" value="{$data.{$fields.c_pilo}|default:''}" /></td>
              </tr>
            <tr>
              <td>Haut</td>
              </tr>
            <tr>
              <td><input type="text" name="c_sklo" id="c_sklo" value="{$data.{$fields.c_sklo}|default:''}" /></td>
              </tr>
  </table>
          </fieldset></td>
        <td><fieldset>
          <legend>Resistenzen</legend>
          
          <table cellspacing="0" cellpadding="0">
            <tr>
              <td>Heilig</td>
              <td>Frost</td>
              </tr>
            <tr>
              <td><input type="text" name="c_res1" id="c_res1" value="{$data.{$fields.c_res1}|default:''}" /></td>
              <td><input type="text" name="c_res2" id="c_res2" value="{$data.{$fields.c_res2}|default:''}" /></td>
              </tr>
            <tr>
              <td>Feuer</td>
              <td>Schatten</td>
              </tr>
            <tr>
              <td><input type="text" name="c_res3" id="c_res3" value="{$data.{$fields.c_res3}|default:''}" /></td>
              <td><input type="text" name="c_res5" id="c_res5" value="{$data.{$fields.c_res4}|default:''}" /></td>
              </tr>
            <tr>
              <td>Natur</td>
              <td>Arkan</td>
              </tr>
            <tr>
              <td><input type="text" name="c_res4" id="c_res4" value="{$data.{$fields.c_res5}|default:''}" /></td>
              <td><input type="text" name="c_res6" id="c_res6" value="{$data.{$fields.c_res6}|default:''}" /></td>
              </tr>
  </table>
          </fieldset></td>
        </tr>
      </table>      <table cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><fieldset>
            <legend>Quest Gegenstände</legend>
            <table cellspacing="0" cellpadding="0">
              <tr>
                <td>Gegenstand 1</td>
                <td>Gegenstand 2</td>
                </tr>
              <tr>
                <td><input type="text" name="c_qitem1" id="c_qitem1" value="{$data.{$fields.c_qitem1}|default:''}" /></td>
                <td><input type="text" name="c_qitem2" id="c_qitem2" value="{$data.{$fields.c_qitem2}|default:''}" /></td>
                </tr>
              <tr>
                <td>Gegenstand 3</td>
                <td>Gegenstand 4</td>
                </tr>
              <tr>
                <td><input type="text" name="c_qitem3" id="c_qitem3" value="{$data.{$fields.c_qitem3}|default:''}" /></td>
                <td><input type="text" name="c_qitem4" id="c_qitem4" value="{$data.{$fields.c_qitem4}|default:''}" /></td>
                </tr>
              <tr>
                <td>Gegenstand 5</td>
                <td>Gegenstand 6</td>
                </tr>
              <tr>
                <td><input type="text" name="c_qitem5" id="c_qitem5" value="{$data.{$fields.c_qitem5}|default:''}" /></td>
                <td><input type="text" name="c_qitem6" id="c_qitem6" value="{$data.{$fields.c_qitem6}|default:''}" /></td>
                </tr>
              </table>
          </fieldset></td>
          <td><fieldset>
            <legend>Zusatz</legend>
            <table cellspacing="0" cellpadding="0">
              <tr>
                <td>Immunitäten</td>
                </tr>
              <tr>
                <td>
                <div class="search_div">
                <input type="text" name="c_meimmm" id="c_meimmm" value="{$data.{$fields.c_meimmm}|default:''}" />
                <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_meimmm_a"></a>
    			</div>
                </td>
                </tr>
              <tr>
                <td>Tier ID</td>
                </tr>
              <tr>
                <td><input type="text" name="c_petsp_id" id="c_petsp_id" value="{$data.{$fields.c_petsp_id}|default:''}" /></td>
                </tr>
              <tr>
                <td>Extra Flags</td>
                </tr>
              <tr>
                <td>
                <div class="search_div">
                <input type="text" name="c_flage" id="c_flage" value="{$data.{$fields.c_flage}|default:''}" />
                <a href="javascript:void(null);" title="Auswählen" class="search_a" id="c_flage_a"></a>
    			</div>
                </td>
                </tr>
              <tr>
                <td><input name="c_rale" type="checkbox" id="c_rale" value="1"{if $data.{$fields.c_rale} != 0} CHECKED{/if} />
                  Rassen Anführer</td>
                </tr>
              </table>
          </fieldset></td>
        </tr>
    </table></td>
  </tr>
  <tr>
  <td colspan="4">
  <div id="creature_locales"></div>
  </td>
  </tr>
</table>
</form>
    <fieldset style="width: 300px;"><legend>Weitere Sprache Laden</legend>
    {literal}<form id="add_locale_c" autocomplete="off" onSubmit="if ($('cloc' + $('creature_locale_select').options[$('creature_locale_select').selectedIndex].text + '_div') != undefined) { alert('Diese Sprache wurde schon geladen!'); }else{new Ajax.Updater('creature_locales', '/index?mode=load_locale&which=c', {parameters: $('add_locale_c').serialize(true), insertion: 'bottom'});}; return false;">{/literal}
    <table width="300">
    <tr>
    <td>
    <select name="locale" id="creature_locale_select">
    <option value="1">Koreanisch</option>
    <option value="2">Französisch</option>
    <option value="3" SELECTED>Deutsch</option>
    <option value="4">Chinesisch</option>
    <option value="5">Taiwanesisch</option>
    <option value="6">Spanisch</option>
    <option value="7">Spanisch lat. Amerika</option>
    <option value="8">Russisch</option>
    </select>
    </td><td><input type="hidden" name="cloc_id" id="cloc_id" value="{$data.{$fields.c_id}|default:''}" /><input type="submit" name="locale_sub" value="Weitere Sprache Laden" class="base_button add_lang_button" /></td>
  </tr>
  <tr>
  <td colspan="2"><div id="creature_action_status"></div></td>
  <tr>
</table>
</form>
</fieldset>
<script type="text/javascript">
{literal}
$('c_id').observe('change', function(e) {
                $('cloc_id').value = $('c_id').value;
            });

$('c_m_id1_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline', width: '620px' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=model&upt_id=c_m_id1', {method: 'get', evalScripts: true});
            });
$('c_m_id2_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline', width: '620px' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=model&upt_id=c_m_id2', {method: 'get', evalScripts: true});
            });
$('c_m_id3_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline', width: '620px' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=model&upt_id=c_m_id3', {method: 'get', evalScripts: true});
            });
$('c_m_id4_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline', width: '620px' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=model&upt_id=c_m_id4', {method: 'get', evalScripts: true});
            });
$('c_flage_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=flagse&upt_id=c_flage', {method: 'get', evalScripts: true});
            });
$('c_meimmm_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=cmeimmm&upt_id=c_meimmm', {method: 'get', evalScripts: true});
            });
$('c_fam_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=cfamily&upt_id=c_fam', {method: 'get', evalScripts: true});
            });
$('c_flag_a').observe('click', function(e) {
                $$('div.dialog_container').invoke('setStyle', { display: 'inline' });
                new Ajax.Updater('dialog', '/index?mode=dialog&dialog=cflag&upt_id=c_flag', {method: 'get', evalScripts: true});
            });

//Tooltips
new Opentip('#c_m_id1', 'Model ID Eintrag, wenn mehr als eines der Felder ausgefüllt wird, wird per Zufall eines ausgewählt!', {target: true, tipJoint: "top"});
new Opentip('#c_m_id2', 'Model ID Eintrag, wenn mehr als eines der Felder ausgefüllt wird, wird per Zufall eines ausgewählt!', {target: true, tipJoint: "top"});
new Opentip('#c_m_id3', 'Model ID Eintrag, wenn mehr als eines der Felder ausgefüllt wird, wird per Zufall eines ausgewählt!', {target: true, tipJoint: "top"});
new Opentip('#c_m_id4', 'Model ID Eintrag, wenn mehr als eines der Felder ausgefüllt wird, wird per Zufall eines ausgewählt!', {target: true, tipJoint: "top"});
new Opentip('#c_rnk', '<table><tr><td>0 - </td><td><a href="javascript:void(0);" onClick="$(\'c_rnk\').value = 0;">Normal</a></td></tr><tr><td>1 - </td><td><a href="javascript:void(0);" onClick="$(\'c_rnk\').value = 1;">Elite</a></td></tr><tr><td>2 - </td><td><a href="javascript:void(0);" onClick="$(\'c_rnk\').value = 2;">Seltener Elite</a></td></tr><tr><td>3 - </td><td><a href="javascript:void(0);" onClick="$(\'c_rnk\').value = 3;">Boss</a></td></tr><tr><td>4 - </td><td><a href="javascript:void(0);" onClick="$(\'c_rnk\').value = 4;">Selten</a></td></tr></table>', {
title: 'Einen Rang Wählen',
showOn: 'mouseover',
hideOn: 'mouseout',
hideTrigger: 'tip',
targetJoint: 'right middle',
target: true,
tipJoint: 'left bottom',
stem: 'left bottom'
});

//Opentip.debug = true;
new Opentip('#c_type', {
showOn: 'mouseover',
hideOn: 'mouseout',
hideTrigger: 'tip',
target: true,
tipJoint: 'top',
title: 'Einen Typ Wählen',
ajax: { url: '/index.php?mode=dialog&dialog=ctype&upt_id=c_type'}
});

new Opentip('#c_icon_name', {
showOn: 'mouseover',
hideOn: 'mouseout',
hideTrigger: 'tip',
target: true,
tipJoint: 'top',
title: 'Ein Icon Wählen',
ajax: { url: '/index?mode=dialog&dialog=c_icon&upt_id=c_icon_name'}
});

new Opentip('#c_ai', '<table><tr><th>Name</th><th>Beschreibung</th></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'NullAI\';">NullAI</a></td><td>Leere AI, Kreatur macht nichts.</td></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'AggressorAI\';">AggressorAI</a></td><td>Kreatur greift an, sobald etwas in Sichtweite ist.</td></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'ReactorAI\';">ReactorAI</a></td><td>Kreatur greift nur an, wenn sie selber angegriffen wird.</td></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'GuardAI\';">GuardAI</a></td><td>Beschützt z.B. Spieler der eigenen Fraktion.</td></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'PetAI\';">PetAI</a></td><td>Kreatur ist ein Haustier.</td></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'TotemAI\';">TotemAI</a></td><td>Kreatur führt Spell aus spell1 aus, ansonsten wie NullAI.</td></tr><tr><td><a href="javascript:void(0);" onClick="$(\'c_ai\').value = \'SmartAI\';">SmartAI</a></td><td>Kreatur benutzt die Smart AI.</td></tr></table>', {
title: 'AI Wählen',
showOn: 'mouseover',
hideOn: 'mouseout',
hideTrigger: 'tip',
targetJoint: 'right middle',
target: true,
tipJoint: 'left bottom',
stem: 'left bottom'
});

new Opentip('#c_mov_id', '<table><tr><th>ID</th><th>Type</th></tr><tr><td>0</td><td><a href="javascript:void(0);" onClick="$(\'c_mov_id\').value = 0;">Auf der Stelle Stehend</a></td></tr><tr><td>1</td><td><a href="javascript:void(0);" onClick="$(\'c_mov_id\').value = 1;">Zufällige Positionen im Spawnbereich</a></td></tr><tr><td>2</td><td><a href="javascript:void(0);" onClick="$(\'c_mov_id\').value = 2;">Wegpunktbewegung</a></td></tr></table>', {
title: 'Movementtyp Wählen',
showOn: 'mouseover',
hideOn: 'mouseout',
hideTrigger: 'tip',
targetJoint: 'right middle',
target: true,
tipJoint: 'left bottom',
stem: 'left bottom'
});

new Opentip('#c_inhatyp', '<table><tr><th>Bitmaske</th><th>Typ</th></tr><tr><td>1</td><td><a href="javascript:void(0);" onClick="$(\'c_inhatyp\').value = 1;">Boden</a></td></tr><tr><td>2</td><td><a href="javascript:void(0);" onClick="$(\'c_inhatyp\').value = 2;">Wasser</a></td></tr><tr><td>4</td><td><a href="javascript:void(0);" onClick="$(\'c_inhatyp\').value = 4;">Fliegend</a></td></tr></table>', {
title: 'Bewegungsebene Wählen',
showOn: 'mouseover',
hideOn: 'mouseout',
hideTrigger: 'tip',
targetJoint: 'right middle',
target: true,
tipJoint: 'left bottom',
stem: 'left bottom'
});
{/literal}
</script>