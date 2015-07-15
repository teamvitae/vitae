<?php

/**
 * Description of ModelUsers
 *
 * @author Roberto
 */
class ModelUsers {

    public function sqls_select_persona($opc, $array) {

        
        switch ($opc) {

            case "USER":
                $sql = "SELECT * FROM USER WHERE PK_USER=". $array[0]."";
                break;
        }


        return $sql;

    }

}

?>
