<?php
require_once 'CORE_OBJECTS.php';
require_once 'UFILE.php';
require_once 'EVENT.php';
require_once 'PLACE.php';
require_once 'TOKEN.php';


/**
 * class UPDATE
 * 
 */
class UPDATE extends CORE_MAIN
{

  /** Aggregations: */

  /** Compositions: */

   /*** Attributes: ***/
   
  /**
   * 
   * @access private
   */
   	private $_id_msg;
  /**
   * 
   * @access private
   */
	private $_id_user;
  /**
   * 
   * @access private
   */
	private $_id_group;
  /**
   * 
   * @access public
   */
	public $_date_published;
  /**
   * 
   * @access public
   */
	public $_text;
  /**
   * 
   * @access public
   */
	public $_file;
  /**
   * 
   * @access public
   */
	public $_event;
  /**
   * 
   * @access public
   */
	public $_place;


	/*
	 * 
	 * 
	 *
	public function __construct($id_msg,$id_user,$id_group,$date_published,$text,$file=null,$event=null,$place=null){
		$_id_msg = $id_msg;
		$_id_user = $id_user;
		$_id_group = $id_group;
		$_date_published = $date_published;
		$_file = $file;
		$_event = $event;
		$_place = $place;
	}*/
	
	/**
	* 
	*
	* @param mixed _id_user 

	* @return array
	* @access public
	*/
	public function getupdates( $user, $num ) {
	  	$connection = parent::connect();
		$query = ("SELECT vdl_msg.id_user, vdl_msg.text, vdl_msg.date_published, vdl_msg.lat, vdl_msg.lon
					FROM `vdl_msg`
					WHERE id_user LIKE '$user'
					ORDER BY vdl_msg.date_published DESC LIMIT $num");
					
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
				array_push($arresult,$row);
			}
			return $arresult;
		}
	} // end of member function getupdates

	/**
	* Devuelve las últimas $num actualizaciones del usuario reconocido por su $token
	*
	* @param mixed _id_user 

	* @return array
	* @access public
	*/
	public function getLastUpdates($token, $num){
		//Recuperamos el email del usuario que nos envía el token
		$TOKEN = new TOKEN();
		$email = $TOKEN->getEmailfromToken($token);
		
		//Conseguimos el id del usuario
		$USER = new USER($email);
		$id = $USER->get_id($email);
		
		//Recuperamos las ultimas actualizaciones del usuario
		return $this->getupdates($id, $num);
	}


} // end of UPDATE
?>
