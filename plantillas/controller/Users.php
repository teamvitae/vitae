<?php

/**
 * Description of Users
 *
 * @author Roberto
 */

include($_SESSION['SITE']."/model/ModelUsers.php");

class Users {

    public function getSql($param) {
        $BD= new BD();
        $model=new ModelUsers();
        $BD->GetConect();
        $result = $BD->getresult($model->sqls_select_persona("USER", $param));
        $BD->Getclose();
        return $result;

    }

}

?>
