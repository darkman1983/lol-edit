<table width="100%" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center">
            <fieldset style="width: 1030px;">
                <legend>Kreatur Ruf Tabelle</legend>
                <form id="c_or_frm">
                    <div id="creature_onkill_rep_content" class="white_content_div" style="height: 300px;">
                        {include file="default/sections/creature_onkill_rep_content.tpl"}
                    </div>
                </form>
            </fieldset>
        </td>
    </tr>
    <tr>
        <td align="center">
            <fieldset style="width: 300px;">
                <legend>Werte</legend>
                <form id="creature_onkill_rep_add" autocomplete="off" onSubmit="return false;">
                    <table width="100%">
                        <tr>
                            <td>Kreatur ID</td>
                            <td>Fraktions ID</td>
                            <td>Maximaler Ruf</td>
                            <td>Team Belohnung</td>
                            <td>Ruf Wert</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="{$fields.cor_id}" id="cor_id"/></td>
                            <td><input type="text" name="{$fields.cor_rokrf1}" id="cor_rokrf1"/></td>
                            <td><input type="text" name="{$fields.cor_ms1}" id="cor_ms1"/></td>
                            <td style="width:80px;"><input type="checkbox" name="{$fields.cor_ita1}" id="cor_ita1"/>
                            </td>
                            <td><input type="text" name="{$fields.cor_rokrv1}" id="cor_rokrv1"/></td>
                        </tr>
                        <tr>
                            <td>Fraktionsabhängig ?</td>
                            <td>Fraktions ID 2</td>
                            <td>Maximaler Ruf2</td>
                            <td>Team Belohnung 2</td>
                            <td>Ruf Wert 2</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="{$fields.cor_td}" id="cor_td"/></td>
                            <td><input type="text" name="{$fields.cor_rokrf2}" id="cor_rokrf2"/></td>
                            <td><input type="text" name="{$fields.cor_ms2}" id="cor_ms2"/></td>
                            <td style="width:80px;"><input type="checkbox" name="{$fields.cor_ita2}" id="cor_ita2"/>
                            </td>
                            <td><input type="text" name="{$fields.cor_rokrv2}" id="cor_rokrv2"/></td>
                        </tr>
                    </table>
            </fieldset>
            <fieldset style="width: 300px;">
                <legend>Aktionen</legend>
                <input type="button" name="submit" id="c_or_add" value="Hinzufügen"/>
                <input type="button" name="delete" id="c_or_del" value="Löschen"/>
            </fieldset>
            </form>
        </td>
    </tr>
</table>
<script type="text/javascript">
    {literal}
    $('c_or_add').observe('click', function (e) {
        var do_update = true;

        if ($('cor_id').value == '')
            alert('Es muss ein Kreatur Template angegeben werden!');

        $$('input[name="cor_added"]').each(function (item) {
            if (item.value == $('cor_id').value + '::' + $('cor_rokrf1').value) {
                do_update = false;
                alert('Diese Kreatur ID + Fraktions ID Kombination existiert schon!\nBitte Überprüfen!');
            } else
                do_update = true;
        });

        if (do_update)
            new Ajax.Updater('cor_table_content', '/index?mode=creature_onkill_rep', {parameters: $('creature_onkill_rep_add').serialize(true), insertion: 'bottom'});
    });

    $('c_or_del').observe('click', function (e) {
        var c_or_sel_radio = $$('input:checked[type="radio"][id="cor_sel"]').pluck('value');
        var c_or_row = $('cor_' + c_or_sel_radio);
        c_or_row.remove();
    });
    {/literal}
</script>