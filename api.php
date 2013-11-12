<?php

include "vdl-include/class/CORE_MAIN.php";
foreach (glob("vdl-include/class/*.php") as $filename)
{
    include_once $filename;
}

require 'vdl-include/Slim/Slim.php';
\Slim\Slim::registerAutoloader();

session_start();
ini_set('mssql.charset', 'UTF-8');

$app = new \Slim\Slim();
 
$app->get('/tokens', 'getTokens');
$app->get('/tokens/:id', 'getToken');
$app->post('/login/', 'doLogin');

$app->run();
 
function getTokens() {
	echo json_encode('token:1,token:2');
}
 
function getToken($id) {
	if($id == 'vidaliapp'){
		$arr = array('vdl_utoken' => md5('token_example')."-".crypt("public_key"));
		echo json_encode($arr);
	}
}

function doLogin() {
	$ACTIONS = new CORE_ACTIONS();
	$sucess= $ACTIONS->login($_POST['email'], $_POST['password']);
	if($sucess == true){
		$auth_session = array("session_auth" => "test");
		echo json_encode($auth_session);
	}

}
