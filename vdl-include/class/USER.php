<?php
require_once 'CORE_MAIN.php';


/**
 * class USER
 * 
 */
class USER extends CORE_MAIN
{

  /** Aggregations: */

  /** Compositions: */

   /*** Attributes: ***/

  /**
   * 
   * @access protected
   */
  protected $_id;

  /**
   * 
   * @access protected
   */
  protected $_nickname;

  /**
   * 
   * @access public
   */
  public $_name;

  /**
   * 
   * @access protected
   */
  protected $_location;

  /**
   * 
   * @access protected
   */
  protected $_sex;

  /**
   * 
   * @access protected
   */
  protected $__bday;

  /**
   * 
   * @access protected
   */
  protected $_age;

  /**
   * 
   * @access protected
   */
  protected $_email;

  /**
   * 
   * @access protected
   */
  protected $_site;

  /**
   * 
   * @access protected
   */
  protected $_bio;

  /**
   * 
   * @access protected
   */
  protected $_avatar_id;

  /**
   * 
   * @access protected
   */
  protected $_prof_visits;

  /**
   * 
   * @access protected
   */
  protected $_prof_friends;

  /**
   * 
   * @access protected
   */
  protected $_prof_groups;

  /**
   * 
   * @access protected
   */
  protected $_session_id;

	
	/**
   * 
   *
   * @return void
   * @access public
   */
	public function __construct (){
		parent::__construct();
		$connection = parent::connect();
				return true;
		$args = func_get_args();
		$nargs = func_num_args();
		if ($nargs > 0){
			self::__construct1($args);
		}
	} // end of member function __construct


  /**
   * 
   *
   * @param string __USER 

   * @return void
   * @access public
   */
	public function __construct1 ($_USER){
		parent::__construct();
		$connection = parent::connect();
		$user = htmlspecialchars(trim($_USER));
		$query = sprintf("SELECT
									vdl_user.id,
									vdl_user.nick,
									vdl_user.name,
									vdl_user.location,
									vdl_user.sex,
									vdl_user.birthdate,
									vdl_user.description,
									vdl_user.email,
									vdl_user.website,
									vdl_user.avatar_id,
									vdl_user.n_views,
									vdl_user.n_groups,
									vdl_user.n_contacts
						FROM vdl_user WHERE vdl_user.email='%s'", $user);
		$result= $connection->query($query);
		if (!$result) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message .= 'Whole query: ' . $query;
			die($message);
			return false;
		}
		while ($row = $result->fetch_assoc()){
			$this->_id = $row["id"];
			$this->_nickname = $row["nick"];
			$this->_name = $row["name"];
			$this->_location = $row["location"];
			$this->_sex = $row["sex"];
			$this->_bday = $row["birthdate"];
			$this->_bio = $row["description"];
			$this->_email = $row["email"];
			$this->_site = $row["website"];
			$this->_img_prof = $row["avatar_id"];
			$this->_prof_groups = $row["n_groups"];
			$this->_prof_friends = $row["n_contacts"];
			$this->_prof_visits = $row["n_views"];
			$this->_avatar_id = $row["avatar_id"];
		}
		return true;

	} // end of member function __construct1

	
  /**
   * 
   *
   *  

   * @return void
   * @access public
   */
  public function firstLoad() {
  	$datos = array("nick" => $this->_nickname, "name" => $this->_name, "description" => $this->_bio, "location" => $this->_location, "avatar" => $this->_avatar_id);
  	return $datos;
  } // end of member function firstLoad
		
	
	
  /**
   * 
   *
   * @param mixed _id_user 

   * @return void
   * @access public
   */
  public function get_nick( $_id_user ) {
  } // end of member function get_nick

  /**
   * 
   *
   * @param mixed _id_user 

   * @return int
   * @access public
   */
  public function get_id( $user ) {
  	$connection = parent::connect();
	$query = ("SELECT vdl_user.id
	 			FROM `vdl_user` 
	 			WHERE `email` LIKE '$user' OR `nick` LIKE '$user'");
			   
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
  } // end of member function get_id
  
  /**
   * 
   *
   * @param mixed _id_user 

   * @return void
   * @access public
   */
  public function get_friends( $_id_user ) {
	  $connection = parent::connect();
		$query = "SELECT vdl_user.nick
					FROM vdl_user
					WHERE vdl_user.id IN (SELECT vdl_friend_of.user2
					FROM vdl_friend_of
					WHERE vdl_friend_of.user1 LIKE '".$_id_user."' UNION SELECT vdl_friend_of.user1
																		FROM vdl_friend_of
																		WHERE vdl_friend_of.user2 LIKE '".$_id_user."')";
		$data=$connection->query($query);
		$arresult=array();
		if (!$data) {
			$message  = 'Invalid query: ' . mysql_error() . "\n";
			$message .= 'Whole query: ' . $query;
			die($message);
			return false;
		}
		while ($row = $data->fetch_array()) {
			array_push($arresult,$row[0]);
		}
		return $arresult;
  } // end of member function get_friends

  /**
   * 
   *
   * @param mixed _id_user1 

   * @param mixed _id_user2 

   * @return void
   * @access public
   */
  public function set_friends( $_id_user1,  $_id_user2 ) {
  } // end of member function set_friends

  /**
   * 
   *
   * @param mixed _id_user1 

   * @param mixed _id_user2 

   * @param mixed _status 

   * @return void
   * @access public
   */
  public function update_friends( $_id_user1,  $_id_user2,  $_status ) {
  } // end of member function update_friends

  /**
   * 
   *
   * @param mixed _id_user1 

   * @return void
   * @access public
   */
  public function check_friends( $_id_user1 ) {
  } // end of member function check_friends

  /**
   * 
   *
   * @param mixed _id_user1 

   * @return void
   * @access public
   */
  public function check_request( $_id_user1 ) {
  } // end of member function check_request

  /**
   * 
   *
   * @return void
   * @access public
   */
  public function set_privacy( ) {
  } // end of member function set_privacy

  /**
   * 
   *
   * @return void
   * @access public
   */
  public function add_update( ) {
  } // end of member function add_update

  /**
   * 
   *
   * @return void
   * @access public
   */
  public function join_group( ) {
  } // end of member function join_group


  /**
   * 
   *
   * @return void
   * @access public
   */
  public function set_user( $user ) {
  	$connection = parent::connect();
	$query = ("INSERT INTO `vdl_user`(`email`, `nick`, `password`, `name`, `birthdate`,
									`sex`, `location`, `website`, `description`, `avatar_id`,
									`n_views`, `n_contacts`, `n_groups`, `session_key`, `session_id`,
									`privacy_level`, `mail_notify`, `color_theme`)
				VALUES ('$user[email]','$user[nick]','$user[password]','$user[name]','$user[birthdate]','$user[sex]',
						'$user[location]','$user[website]','$user[description]','$user[avatar_id]','$user[n_views]',
						'$user[n_contacts]','$user[n_groups]','$user[session_key]','$user[session_id]',
						'$user[privacy_level]','$user[mail_notify]','$user[color_theme]')");
			   
	$result = $connection->query($query);
	if($result != 1){
		$message  = 'Invalid query: ' . mysql_error() . "\n";
		$message .= 'Whole query: ' . $query;
		die($message);
		return FALSE;
	}
	else{
		return TRUE;
	}
  } // end of member function set_user



} // end of USER
?>
