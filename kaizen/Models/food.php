<?php
require_once 'Connection.php';

  class Foods{
    private $con;

    public function __construct(){
      $this->con = Connection::getConnection();
    }

    public function getFoods($offset, $items_per_page){
      $data = array();
      $cmd = $this->con->query('SELECT id, name, kcal, carbo, proteins FROM foods ORDER BY 2 LIMIT '. $items_per_page . ' OFFSET ' .$offset);
      $data = $cmd->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function getFoodsById($id){
      $data = array();
      $cmd = $this->con->prepare('SELECT id, name, kcal, carbo, proteins FROM foods WHERE id =' . $id);
      $cmd->execute();
      $data = $cmd->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function updateFood($id, $kcal, $carbo, $proteins, $name){
      $data = array();
      $cmd = $this->con->prepare('UPDATE `foods` SET `kcal`=:kcal, `carbo`=:carbo, `proteins`=:proteins, `name`=:name WHERE `id`=:id');
      $cmd->bindParam(':kcal', $kcal);
      $cmd->bindParam(':carbo', $carbo);
      $cmd->bindParam(':proteins', $proteins);
      $cmd->bindParam(':name', $name);
      $cmd->bindParam(':id', $id);
      $cmd->execute();
      $data = $cmd->fetch();
    }

    
    public function registerFood($id, $kcal, $carbo, $proteins, $name){
      $data = array();
      $cmd = $this->con->prepare('INSERT INTO `foods`(`kcal`, `carbo`, `proteins`, `name`) VALUES ('. $kcal, $carbo, $proteins, $name .')');
      $cmd->bindParam(':kcal', $kcal);
      $cmd->bindParam(':carbo', $carbo);
      $cmd->bindParam(':proteins', $proteins);
      $cmd->bindParam(':name', $name);
      $cmd->execute();
      $data = $cmd->fetch();
    }

    public function deleteFood($id){
      $data = array();
      $cmd = $this->con->prepare('DELETE FROM foods WHERE id =' . $id);
      $cmd->execute();
      $data = $cmd->fetch();
    }
  }
?>