<?php

/**
 * Description of BD
 *
 * @author Roberto
 */
class BD {

    private $g_link = '';

    public function GetConect() {

        if ($this->g_link)
            return $this->g_link;
        $this->g_link = mysqli_connect('localhost', 'root', '') or die('Could not connect to server.');
        mysqli_set_charset($this->g_link, 'utf8');
        mysqli_select_db($this->g_link, 'vitae_v1') or die('Could not select database.');
        return $this->g_link;

    }

    public function Getclose() {
        if ($this->g_link != false)
            mysqli_close($this->g_link);
        $this->g_link = false;

    }

    public function getresult($sql) {
        $result = $this->g_link->query(strtolower($sql));
        $array_object = array();
        while ($modelo = mysqli_fetch_object($result)) {
            array_push($array_object, $modelo);
        }
        return $array_object;

    }

}

?>
