<?php
/*
 * jQuery File Upload Plugin PHP Example
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * https://opensource.org/licenses/MIT
 */
$carpeta=$_GET["carpeta"];
error_reporting(E_ALL | E_STRICT);
require('UploadHandler.php');
//$options = array('upload_dir'=>$example1.'/', 'upload_url'=>$example1.'/');
//then add the array to the constructor declaration
//$upload_handler = new UploadHandler($options);
$upload_handler = new UploadHandler($carpeta);