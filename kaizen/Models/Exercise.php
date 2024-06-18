<?php
require_once 'Connection.php';

  class Exercise{
    private $con;

    public function __construct(){
      $this->con = Connection::getConnection();
    }

    public function getExercises($offset, $items_per_page){
      $data = array();
      $w = $this->con->query('SELECT * FROM exercises ORDER BY 2 LIMIT '. $items_per_page . ' OFFSET ' .$offset);
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function getExercisesById($id){
      $data = array();
      $w = $this->con->prepare('SELECT * FROM exercises WHERE id =' . $id);
      $w->execute();
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function updateExercise($id, $name, $target_muscle, $type){
      $data = array();
      $w = $this->con->prepare('CALL updateExercise(?, ?, ?, ?)');
      $w->bindParam(1, $id);
      $w->bindParam(2, $name);
      $w->bindParam(3, $target_muscle);
      $w->bindParam(4, $type);
      $w->execute();
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
    }

    
    public function registerExercise( $name, $target_muscle, $type){
      $data = array();
      $w = $this->con->prepare('call registerExercise(?, ?, ?)');
      $w->bindParam(1, $name);
      $w->bindParam(2, $target_muscle);
      $w->bindParam(3, $type);
      $w->execute();
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function deleteExercise($id){
      $data = array();
      $w = $this->con->prepare('call deleteExercise(?)');
      $w->bindParam(1, $id);
      $w->execute();
      $data = $w->fetchAll(PDO::FETCH_ASSOC);
    }
  }
?>
