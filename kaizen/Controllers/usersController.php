<?php

Class usersController extends Controller{
  private $con;
  public function __construct($con) {
    $this->con = $con;
}  

  public function index(){

    $this->loadTemplate('users/index');
  }

  public function login() {
    $w = new User($this->con);
    $email = $_POST['email'];
    $password = $_POST['password'];

    $user = $w->verifyUser($email, $password);
      if($_POST['email'] == $email and $_POST['password'] == $password){
        $_SESSION['loggedin'] = TRUE;
        header("location: welcome.php");
      } else {
        $_SESSION['loggedin'] = FALSE;
  }



  }
}

?>