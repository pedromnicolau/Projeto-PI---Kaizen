<?php
require_once 'Connection.php';
  class User{
    private $user;
    public function __construct($user) {
      $this->user = $user;
  }

  public function verifyUser($email, $password) {
    $data = array();
    $w = $this->user->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
    $w->bind_param("ss", $email, $password);
    $w->execute();
    $w->execute();
    $data = $w->fetch();
    return $data;
}

}
?>