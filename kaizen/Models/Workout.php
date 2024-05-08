<?php
require_once 'Connection.php';

  class Workout{
    private $con;

    public function __construct(){
      $this->con = Connection::getConnection();
    }

    public function getWorkouts(){
      $data = array();
      $cmd = $this->con->query('SELECT w.name, wt.name as type FROM workouts w JOIN workout_types wt ON w.workout_type_id = wt.id');
      $data = $cmd->fetchAll(PDO::FETCH_ASSOC);
      return $data;
    }

    public function getWorkoutById($id){
      $data = array();
      $cmd = $this->con->prepare('SELECT * FROM workouts WHERE id = :id');
      $cmd->bindValue(':id', $id);
      $cmd->execute();
      $data = $cmd->fetch();

      return $data;
    }
  }
?>
