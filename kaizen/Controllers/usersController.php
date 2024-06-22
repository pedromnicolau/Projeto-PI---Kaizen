<?php
class usersController extends Controller
{

    public function index()
    {

        $this->loadTemplate('users/index');
    }

    public function login()
    {
        $userModel = new User();
        $email = $_POST['email'];
        $password = $_POST['password'];
        $user = $userModel->verifyUser($email, $password);
        session_start();
        $_SESSION['user_name'] = $user['name'];
        if (!empty($user)) {
            $_SESSION['loggedin'] = true;
            header("location: welcome.php");
            exit;
        } else {
            $_SESSION['loggedin'] = false;
            header('Location: ../../kaizen');
            exit;
        }
    }

    public function logout()
    {
        session_start();
        $_SESSION = array();
        session_destroy();
        header("Location: ../../kaizen");
        exit;
    }

}
