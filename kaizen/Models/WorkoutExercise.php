<?php
require_once 'Connection.php';

class WorkoutExercise
{
    private $con;

    public function __construct()
    {
        $this->con = Connection::getConnection();
    }

}
