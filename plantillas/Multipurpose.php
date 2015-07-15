<?php

/**
 * Description of Multipurpose
 *
 * @author Roberto
 */
class Multipurpose {

    public function formateo_fecha($fecha) {
        $date = new DateTime($fecha);
        return $date->format('d/m/Y');

    }

    public function CalculaEdad($fecha) {
        list($Y, $m, $d) = explode("-", $fecha);
        return( date("md") < $m . $d ? date("Y") - $Y - 1 : date("Y") - $Y );

    }

}

?>
