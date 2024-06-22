<?php
require_once 'Connection.php';

class Workout
{
    private $con;

    public function __construct()
    {
        $this->con = Connection::getConnection();
    }

    public function getWorkouts()
    {
        $data = array();
        $w = $this->con->query('SELECT * FROM workouts');
        $data = $w->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }

    public function getWorkoutById($id)
    {
        $data = array();
        $w = $this->con->prepare('SELECT * FROM workouts WHERE id =' . $id);
        $w->execute();
        $data = $w->fetch();

        return $data;
    }
}
