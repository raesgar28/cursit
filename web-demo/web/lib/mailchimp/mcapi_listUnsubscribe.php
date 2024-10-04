<?php
require_once 'inc/MCAPI.class.php';
$apikey = $_GET['api_key'];
$listId = $_GET['id_lista'];
$apiUrl = 'http://api.mailchimp.com/1.3/';
$email=$_GET['email'];
$api = new MCAPI($apikey);
$retval = $api->listUnsubscribe( $listId,$email);
if ($api->errorCode){
    echo "Error()!\n";
	echo "\tCode=".$api->errorCode."\n";
	echo "\tMsg=".$api->errorMessage."\n";
} else {
    echo "Devuelto: ".$retval."\n";
}
?>