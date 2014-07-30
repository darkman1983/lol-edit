<table width="100%" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center">
            <fieldset style="width: 1030px;">
                <legend>Model Info</legend>
                <form id="cmi_frm">
                    <div id="creature_model_info_content" class="white_content_div" style="height: 300px;">
                        {include file="default/sections/creature_model_info_content.tpl"}
                    </div>
                </form>
            </fieldset>
        </td>
    </tr>
    <!--     <tr>
        <td align="center">
            <fieldset style="width: 300px;">
                <legend>Werte</legend>
                <form id="creature_model_info_change" autocomplete="off" onSubmit="return false;">
                    <table width="100%">
                        <tr>
                            <td>Model ID</td>
                            <td>Bounding Radius</td>
                            <td>Combat Reach</td>
                            <td>Gender</td>
                            <td>Model id other Gender</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="{$fields.cmi_id}" id="cmi_id"/></td>
                            <td><input type="text" name="{$fields.cmi_br}" id="cmi_br"/></td>
                            <td><input type="text" name="{$fields.cmi_cr}" id="cmi_cr"/></td>
                            <td><input type="text" name="{$fields.cmi_g}" id="cmi_g"/></td>
                            <td><input type="text" name="{$fields.cmi_mog}" id="cmi_mog"/></td>
                        </tr>
                    </table>
            </fieldset>
            <fieldset style="width: 300px;">
                <legend>Aktionen</legend>
                <input type="button" name="submit" id="cmi_add" value="Hinzufügen"/>
                <input type="button" name="delete" id="cmi_del" value="Löschen"/>
            </fieldset>
            </form>
        </td>
    </tr> -->
</table>
<!-- <script type="text/javascript">
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
-->