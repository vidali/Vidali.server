 <?php

/**
 * class TOKEN
 * 
 */
class TOKEN extends CORE_MAIN{
  
  
	private function inserToken($token, $email, $ip, $cierre){
		 //Creamos la conexion
		 $connection = parent::connect();
		 
		 if ($cierre != "si"){
		 	$query = ("INSERT INTO `vdl_token`(`token`,`email`,`ip`,`expiration_time`)
				   VALUES('$token','$email','$ip', NOW() + INTERVAL 1 HOUR)");
		 }else{
			 $query = ("INSERT INTO `vdl_token`(`token`,`email`,`ip`,`expiration_time`)
				   VALUES('$token','$email','$ip', NULL)");
		 }
		$result = $connection->query($query);
		if (!$result) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message = $message . ' Whole query: ' . $query;
			die($message);
			return false;
		}
		else{
			return true;
		}
	}


	private function updateToken($token, $email){
		$connection = parent::connect();
		 
		 $query = ("UPDATE `vdl_token` 
		 			SET `expiration_time`= NOW() + INTERVAL 1 HOUR 
		 			WHERE `token`LIKE '$token' AND `email` LIKE '$email'");
				   
		$result = $connection->query($query);
		if (!$result) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message = $message . ' Whole query: ' . $query;
			die($message);
			return false;
		}
		else{
			return true;
		}
	}
	
	
	private function deleteToken($token, $email){
		$connection = parent::connect();
		 
		 $query = ("DELETE FROM `vdl_token` 
		 			WHERE `token`LIKE '$token' AND `email` LIKE '$email'");
				   
		$result = $connection->query($query);
		if (!$result) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message = $message . ' Whole query: ' . $query;
			die($message);
			return false;
		}
		else{
			return true;
		}
	}
	
	public function getEmailfromToken($token){
		$connection = parent::connect();
		 
		 $query = ("SELECT vdl_token.email
		 			FROM `vdl_token` 
		 			WHERE `token` LIKE '$token'");
				   
		$result = $connection->query($query);
		$arresult=array();
		if (!$result) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message = $message . ' Whole query: ' . $query;
			die($message);
			return false;
		}
		else{
			while ($row = $result->fetch_array()) {
				array_push($arresult,$row[0]);
			}
			return $arresult[0];
		}
	}
	  
 
	public function gen_token($_USER,$ip,$cierre){
		//Generamos numero aleatorio
		$randNum = mt_rand();
		
		//Generamos el token
		$seed = $randNum . $ip . $_USER;
		$token = sha1(md5(trim($seed)));
		
		//Guardamos el token
		$this->inserToken($token, $_USER, $ip, $cierre);
		
		//Devolvemos el token
		return $token;
		
	}// end of member function gen_token
	
	
} // end of TOKEN

?>
