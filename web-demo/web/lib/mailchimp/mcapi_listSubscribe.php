<?php
require_once 'inc/MCAPI.class.php';
$apikey = $_GET['api_key'];
$listId = $_GET['id_lista'];
$apiUrl = 'http://api.mailchimp.com/1.3/';
$email=$_GET['email'];
$nombre=$_GET['nombre'];
$apellidos=$_GET['apellidos'];
$api = new MCAPI($apikey);
$merge_vars = array('FNAME'=>$nombre,'LNAME'=>$apellidos,'mc_language'=>'es_ES');
$retval = $api->listSubscribe( $listId, $email, $merge_vars );
if ($api->errorCode){
	echo "Error en suscripcion a Newsletter()!\n";
	echo "\tCode=".$api->errorCode."\n";
	echo "\tMsg=".$api->errorMessage."\n";
} else {
    echo "Suscrito!\n";
	echo $nombre;
}
?>