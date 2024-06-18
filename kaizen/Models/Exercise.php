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
      $w = $this->con->prepare('UPDATE `exercises` SET `name`=:name, `target_muscle`=:target_muscle,  `type`=:type WHERE `id`=:id');
      $w->bindParam(':name', $name);
      $w->bindParam(':target_muscle', $target_muscle);
      $w->bindParam(':type', $type);
      $w->bindParam(':id', $id);
      $w->execute();
      $data = $w->fetch();
    }

    
    public function registerExercise( $name, $target_muscle, $type){
      $data = array();
      $cmd = $this->con->prepare('INSERT INTO `exercises`(`name`, `target_muscle`, `type`, `fk_users_id`) VALUES (:name, :target_muscle, :type, 1)');
      $cmd->bindParam(':name', $name);
      $cmd->bindParam(':target_muscle', $target_muscle);
      $cmd->bindParam(':type', $type);
      $cmd->execute();
      $data = $cmd->fetch();
    }
    
    public function deleteExercise($id){
      $data = array();
      $cmd = $this->con->prepare('DELETE FROM exercises WHERE id =' . $id);
      $cmd->execute();
      $data = $cmd->fetch();
    }
  }
?>
