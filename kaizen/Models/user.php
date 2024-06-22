<?php
require_once 'Connection.php';
class User
{
    private $user;
    public function __construct()
    {
        $this->user = Connection::getConnection();
    }

    public function verifyUser($email, $password)
    {
        $w = $this->user->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
        $w->bindParam(1, $email);
        $w->bindParam(2, $password);
        $w->execute();
        return $w->fetchAll(PDO::FETCH_ASSOC);
    }

}
