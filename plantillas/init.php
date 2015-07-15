<?php
session_start();
/**
 * 
 *
 * @author Roberto
 */
include_once(dirname(__FILE__) . '/conect/BD.php');


include_once(dirname(__FILE__) . '/multipurpose.php');


include_once(dirname(__FILE__) . '/controller/Users.php');


$_SESSION['SITE']=dirname(__FILE__);

?>
