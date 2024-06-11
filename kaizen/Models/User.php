<?php
  class User{
    private $con;
    public function __construct(){
      $this->con = Connection::getConnection();
    }
  }
?>