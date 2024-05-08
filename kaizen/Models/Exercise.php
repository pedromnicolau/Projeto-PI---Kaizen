<?php
require_once 'Connection.php';

  class Exercise{
    private $con;

    public function __construct(){
      $this->con = Connection::getConnection();
    }

    public function getExercises(){
      $data = array();
      $cmd = $this->con->query('SELECT id, name FROM exercises');
      $data = $cmd->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }
  }
?>
