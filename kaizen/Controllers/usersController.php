<?php
Class usersController extends Controller{

  public function index(){

    $this->loadTemplate('users/index');
  }

  public function login() {
    $userModel = new User();
    $email = $_POST['email'];
    $password = $_POST['password'];
    $user = $userModel->verifyUser($email, $password);
    session_start();
    $_SESSION['user_name'] = $user['name'];
    if (!empty($user)) {
        $_SESSION['loggedin'] = TRUE;
        header("location: welcome.php");
        exit;
    } else {
        $_SESSION['loggedin'] = FALSE;
        header('Location: ../../kaizen');
        exit;
    }
}
}

?>