<?php
require_once 'Connection.php';

  class Foods{
    private $con;

    public function __construct(){
      $this->con = Connection::getConnection();
    }

    public function getFoods($offset, $items_per_page){
      $data = array();
      $w = $this->con->query('SELECT id, name, kcal, carbo, proteins FROM foods ORDER BY 2 LIMIT '. $items_per_page . ' OFFSET ' .$offset);
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function getFoodsById($id){
      $data = array();
      $w = $this->con->prepare('SELECT id, name, kcal, carbo, proteins FROM foods WHERE id =' . $id);
      $w->execute();
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function updateFood($id, $kcal, $carbo, $proteins, $name){
      $data = array();
      $w = $this->con->prepare('UPDATE `foods` SET `kcal`=:kcal, `carbo`=:carbo, `proteins`=:proteins, `name`=:name WHERE `id`=:id');
      $w->bindParam(':kcal', $kcal);
      $w->bindParam(':carbo', $carbo);
      $w->bindParam(':proteins', $proteins);
      $w->bindParam(':name', $name);
      $w->bindParam(':id', $id);
      $w->execute();
      $data = $w->fetch();
    }

    
    public function registerFood($kcal, $carbo, $proteins, $name){
      $data = array();
      $w = $this->con->prepare('INSERT INTO `foods`(`kcal`, `carbo`, `proteins`, `name`) VALUES (:kcal, :carbo, :proteins, :name)');
      $w->bindParam(':kcal', $kcal);
      $w->bindParam(':carbo', $carbo);
      $w->bindParam(':proteins', $proteins);
      $w->bindParam(':name', $name);
      $w->execute();
      $data = $w->fetch();
    }
    
    public function deleteFood($id){
      $data = array();
      $w = $this->con->prepare('DELETE FROM foods WHERE id =' . $id);
      $w->execute();
      $data = $w->fetch();
    }
  }
?>