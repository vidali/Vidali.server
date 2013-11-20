 <?php

/**
 * class TOKEN
 * 
 */
class TOKEN extends CORE_MAIN{
  
  
	private function inserToken($token, $email, $ip){
		 //Creamos la conexion
		 $connection = parent::connect();
		 
		 $query = ("INSERT INTO `vdl_token`(`token`,`email`,`ip`,`expiration_time`)
				   VALUES('$token','$email','$ip', NOW() + INTERVAL 1 HOUR)");
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
	  
 
	public function gen_token($_USER,$ip){
		//Generamos numero aleatorio
		$randNum = mt_rand();
		
		//Generamos el token
		$seed = $randNum . $ip . $_USER;
		$token = sha1(md5(trim($seed)));
		
		//Guardamos el token
		$this->inserToken($token, $_USER, $ip);
		
		//Devolvemos el token
		return $token;
		
	}// end of member function gen_token
	
	
} // end of TOKEN

?>
