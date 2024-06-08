<?php
require_once 'Connection.php';

  class Foods{
    private $con;

    public function __construct(){
      $this->con = Connection::getConnection();
    }

    public function getFoods(){
      $data = array();
      $cmd = $this->con->query('SELECT id, name FROM foods');
      $data = $cmd->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function getFoodsById($id){
      $data = array();
      $cmd = $this->con->prepare('SELECT * FROM foods WHERE id =' . $id);
      $cmd->execute();
      $data = $cmd->fetch();

      return $data;
    }
    public function deleteFood($id){
      $data = array();
      $cmd = $this->con->prepare('DELETE FROM foods WHERE id =' . $id);
      $cmd->execute();
      $data = $cmd->fetch();
    }
  }
?>