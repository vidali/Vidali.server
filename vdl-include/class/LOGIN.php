 <?php

/**
 * class LOGIN
 * 
 */
class LOGIN extends CORE_MAIN{
  
 
 /**
   * 
   *
   * @return void
   * @access public
   */
	public function login($_USER,$_PASS){
		//Iniciamos sesion y conectamos a la base de datos
		$connection = parent::connect();
		//Extraemos el user y la pass
		$usr = $_USER;
		$pwd = mysqli_real_escape_string($connection,sha1(md5(trim($_PASS))));
		$query = sprintf("SELECT *
						  FROM vdl_user 
						  WHERE vdl_user.email='%s' && vdl_user.password = '%s'", $usr,$pwd);
		$result= $connection->query($query);
		//DEPURACION
		 if (!$result) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message .= 'Whole query: ' . $query;
			die($message);
			return false;
		}
		if($result->num_rows){
			return true;
		}
		else{
			return false;
		}
	}// end of member function login
	
	
} // end of LOGIN

?>
