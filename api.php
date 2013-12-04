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
$app->post('/lastUpdates', 'getLastUpdates');

$app->run();
 
function getTokens() {
	//echo json_encode('token:1,token:2');
	//Recuperamos datos del usuario
		$USER = new USER("test@test.com");
		$datos = $USER->firstLoad();
		
		//Generamos token de sesion
		$TOKEN = new TOKEN();
		$token = $TOKEN->gen_token("test@test.com", "192.168.1.33", "no");
		
		//Añadimos el token al array asociativo que vamos a devolver
		$datos["token"] = $token;
		
		//$auth_session = array("session_auth" => "test");
		echo json_encode($datos);
}
 
function getToken($id) {
	if($id == 'vidaliapp'){
		$arr = array('vdl_utoken' => md5('token_example')."-".crypt("public_key"));
		echo json_encode($arr);
	}
}

function doLogin() {
	$LOGIN = new LOGIN;
	$sucess= $LOGIN->start($_POST['email'],$_POST['password']);
	if($sucess == true){
		//Recuperamos datos del usuario
		$USER = new USER($_POST['email']);
		$datos = $USER->firstLoad();
		
		//Generamos token de sesion
		$TOKEN = new TOKEN();
		$token = $TOKEN->gen_token($_POST['email'], $_POST['ip'], $_POST['no_cerrar']);
		
		//Añadimos el token al array asociativo que vamos a devolver
		$datos["token"] = $token;
		
		//$auth_session = array("session_auth" => "test");
		echo json_encode($datos);
	}
	
}

function getLastUpdates() {
	$UPDATE = new UPDATE();
		
	$datos = $UPDATE->getLastUpdates($_POST['token'], $_POST['num']);
	
	echo json_encode($datos);
}
