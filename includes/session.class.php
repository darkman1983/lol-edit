<?php

/**
 * @ignore
 */
if (!defined('IN_LOLEDIT')) {
    exit;
}

class session
{
    /**
     * Array mit Fehlernachrichten
     * @var string
     */
    public $error = array("error_data" => "Login Fehlgeschlagen
          Bitte Login Daten Überprüfen!
          Haben Sie schon einen Account?", "incomplete_data" => "Unvollständige Daten!
          Bitte Geben Sie Ihre Daten vollständig ein!", "user_not_found" => "Dieser Benutzername ist uns nicht Bekannt!",
        "db_error" => "Es ist ein Allgemeiner Datenbankfehler aufgetreten.", "settings_err" => "Benutzereinstellungen konnten nicht geladen werden",
        "no_rights" => "Leider keine Berechtigung");

    /**
     * Athentifizierungsfunktion
     * @return bool
     */
    public function auth($data)
    {

        if (isset($data['mode']) && $data['mode'] == 'login')
            return true;

        if (session_status() != PHP_SESSION_ACTIVE)
            session_start();

        if ($_SERVER ['REMOTE_ADDR'] !== self::get_data('ip') || !self::get_data('logged_in')) {
            $this->logout();
            return false;
        } else if (!$this->get_user_session(self::get_data('id'))) {
            $this->logout();
            return false;
        } else {
            /*if (isset($data['mode']) && !in_array($data['mode'], array('upt_sql','stor_upt','upt_autologout')))
                $this->update_session($this->get_data('id'));*/
        }

        //Clean other user Sessions
        $this->clean_sessions(self::get_data('id'));

        return true;
    }

    static function update_session($uid)
    {
        global $db;

        if (!$uid)
            return;

        $logout_time = strtotime('+20 minutes', time());
        $nlogout_time = date('H:i:s', $logout_time) . " Uhr";
        self::set_data(array("logouttime|||{$nlogout_time}"));

        $update_user_session_sql = "UPDATE `user_sessions` SET `expire` = '{$logout_time}' WHERE `userid` = '{$uid}'";
        $update_user_session = $db->Query($update_user_session_sql);
    }

    private function clean_sessions($uid)
    {
        global $db;

        if ($uid) {
            $get_user_session_sql = "SELECT `userid`, `expire` FROM `user_sessions`";
            $get_user_session = $db->Query($get_user_session_sql);

            $db->MoveFirst();
            while (!$db->EndOfSeek()) {
                $usr_sess = $db->Row();

                if ($usr_sess->expire < time() && $usr_sess->userid != self::get_data('id')) {
                    $delete_user_session_sql = "DELETE FROM `user_sessions` WHERE `userid` = '{$usr_sess->userid}'";
                    $delete_user_session = $db->Query($delete_user_session_sql);

                    save_log(array('desc_id' => 'u_alo'), true, $usr_sess->userid);
                }
            }
        }
    }

    static function get_user_sessions()
    {
        global $db;

        $get_user_sessions_sql = "SELECT COUNT(*) FROM `user_sessions`";
        $get_user_sessions = $db->QuerySingleValue($get_user_sessions_sql);

        return $get_user_sessions;
    }

    /**
     * Funktion um die Benutzersession in der Datenbank zu Checken
     * @param string Benutzerid
     * @return bool
     */
    private function get_user_session($uid)
    {
        global $db;

        $get_user_session_sql = "SELECT * FROM `user_sessions` WHERE `userid` = '{$uid}'";
        $get_user_session = $db->QuerySingleRowArray($get_user_session_sql, MYSQL_ASSOC);

        if ($get_user_session && is_array($get_user_session)) {
            if ($get_user_session ['expire'] < time() || session_id() != $get_user_session ['session_id']) {
                require_once('functions.php');
                save_log(array('desc_id' => 'u_alo'), true);
                return false;
            }

            return true;
        }

        return false;
    }

    /**
     * Benutzer Login Funktion
     * Generiert die Session und DB-Werte
     * @param string $username
     * @param string_type $pass
     * @return string or bool
     */
    public function login($data = NULL)
    {
        global $db, $smarty;

        if (empty ($data ['name']) || empty ($data ['pass'])) {
            $smarty->append('info', array('error' => nl2br(htmlentities($this->error ['incomplete_data'], null, 'UTF-8'))), true);
            return false;
        }

        if (session_status() != PHP_SESSION_ACTIVE)
            session_start();

        $get_user_data_sql = "SELECT * FROM `users` WHERE `name` = '{$data['name']}'";
        $have_user = $db->QuerySingleRowArray($get_user_data_sql, MYSQL_ASSOC);

        if (strlen($db->Error()) > 0) {
            $smarty->append('info', array('error' => $db->Error()), true);
            return false;
        }

        if (empty($have_user)) {
            $smarty->append('info', array('error' => nl2br(htmlentities($this->error ['user_not_found'], null, 'UTF-8'))), true);
            return false;
        }

        if ($have_user ['pass'] !== sha_password($data ['name'], $data ['pass'])) {
            /*print "Eingegebener Name: {$data ['name']}<br>Eingegebenes PW: {$data ['pass']}";
             print "<br>Hash eingegebene Daten:".sha_password ( $data ['name'], $data ['pass'] )."<br>Hash Datenbank: {$have_user ['pass']}<br>";*/
            $smarty->append('info', array('error' => nl2br(htmlentities($this->error ['error_data'], null, 'UTF-8'))), true);
            return false;
        }

        $get_user_settings_sql = "Select * FROM `user_settings` WHERE `userid` = {$have_user['id']}";
        $get_user_settings_query = $db->Query($get_user_settings_sql);
        if (!$get_user_settings_query) {
            $smarty->append('info', array('error' => nl2br(htmlentities($this->error ['settings_err'], null, 'UTF-8'))), true);
            return false;
        }

        $usettings = array();
        $db->MoveFirst();
        while (!$db->EndOfSeek()) {
            $uset = $db->Row();
            $usettings [$uset->name] = $uset->value;
        }

        $_SESSION ['settings'] = $usettings;
        $logout_time = strtotime('+20 minutes', time());
        $nlogout_time = date('H:i:s', $logout_time) . " Uhr";
        self::set_data(array("id|||{$have_user['id']}", "ip|||{$this->getip()}", "logged_in|||true", "name|||{$have_user['name']}", "fullname|||{$have_user['fullname']}", "level|||{$have_user['level']}", "logouttime|||{$nlogout_time}", "cleanname|||" . preg_replace('/\s\s+/', '_', strtolower($have_user ['name']))));

        $insert_user_session_sql = "REPLACE INTO `user_sessions` VALUES('{$have_user['id']}', '" . session_id() . "', '{$logout_time}')";
        $insert_user_session = $db->Query($insert_user_session_sql);

        if (!$insert_user_session)
            return false;

        //require_once('functions.php');
        save_log(array('desc_id' => 'u_li'), true);

        return true;
    }

    /**
     * Löscht die Benutzer Session, auch aus der DB
     */
    public function logout()
    {
        global $db;

        if (session_status() != PHP_SESSION_ACTIVE)
            session_start();

        $delete_user_session_sql = "DELETE FROM `user_sessions` WHERE `userid` = '".self::get_data('id')."'";
        $delete_user_session = $db->Query($delete_user_session_sql);

        session_destroy();
    }

    /**
     * Schreibt Daten in die Benutzer Session
     * @param array of strings
     * @param string Sessionelement
     * @return nothing
     */
    static function set_data($fill = false)
    {
        if ($fill) {
            if (is_array($fill)) {
                foreach ($fill as $fillin) {
                    $d = explode('|||', $fillin);
                    $_SESSION [$d [0]] = $d [1];
                }
            }
            if (!is_array($fill) && $fill !== false) {
                $d = explode('|||', $fill);
                $_SESSION [$d [0]] = $d [1];
            }
        }
    }

    /**
     * Holt bestimmte Daten aus der Session
     * @param array of strings
     * @param string Sessionelement
     * @return array of Sessiondata
     */
    static function get_data($get_data = false)
    {
        if ($get_data) {
            if (is_array($get_data)) {
                $got = array();
                foreach ($get_data as $getit)
                    $got [$getit [0]] = $_SESSION [$getit [0]];

                return $got;
            }
            if (array_key_exists($get_data, $_SESSION))
                return $_SESSION [$get_data];
        }
    }

    /**
     * Überprüft die IP Adresse des Benutzers
     * @param string $ip
     * @return bool
     */
    private function validip($ip)
    {
        if (!empty ($ip) && ip2long($ip) != -1) {
            $reserved_ips = array(array('0.0.0.0', '2.255.255.255'), array('10.0.0.0', '10.255.255.255'), array('127.0.0.0', '127.255.255.255'), array('169.254.0.0', '169.254.255.255'), array('172.16.0.0', '172.31.255.255'), array('192.0.2.0', '192.0.2.255'), array('192.168.0.0', '192.168.255.255'), array('255.255.255.0', '255.255.255.255'));
            foreach ($reserved_ips as $r) {
                $min = ip2long($r [0]);
                $max = ip2long($r [1]);
                if ((ip2long($ip) >= $min) && (ip2long($ip) <= $max))
                    return false;
            }
            return true;
        } else
            return false;
    }

    /**
     * Checkt ob der SERVER_VAR existiert
     * gibt true oder false zurück
     * @return bool
     */
    private function check_srv_var($srv_var)
    {
        if (array_key_exists($srv_var, $_SERVER))
            return true;

        return false;
    }

    /**
     * Versucht auf unterschiedliche weise
     * die IP des Benutzer zu Bekommen / Überprüfen
     * @return string
     */
    private function getip()
    {
        if ($this->check_srv_var("HTTP_CLIENT_IP") && $this->validip($_SERVER ["HTTP_CLIENT_IP"]))
            return $_SERVER ["HTTP_CLIENT_IP"];

        if ($this->check_srv_var("HTTP_X_FORWARDED_FOR")) {
            foreach (explode(",", $_SERVER ["HTTP_X_FORWARDED_FOR"]) as $ip) {
                if ($this->validip(trim($ip)))
                    return $ip;
            }
        }

        if ($this->check_srv_var("HTTP_X_FORWARDED") && $this->validip($_SERVER ["HTTP_X_FORWARDED"]))
            return $_SERVER ["HTTP_X_FORWARDED"];
        elseif ($this->check_srv_var("HTTP_FORWARDED_FOR") && $this->validip($_SERVER ["HTTP_FORWARDED_FOR"]))
            return $_SERVER ["HTTP_FORWARDED_FOR"];
        elseif ($this->check_srv_var("HTTP_FORWARDED") && $this->validip($_SERVER ["HTTP_FORWARDED"]))
            return $_SERVER ["HTTP_FORWARDED"];
        elseif ($this->check_srv_var("HTTP_X_FORWARDED") && $this->validip($_SERVER ["HTTP_X_FORWARDED"]))
            return $_SERVER ["HTTP_X_FORWARDED"];
        else
            return $_SERVER ["REMOTE_ADDR"];
    }
}

?>