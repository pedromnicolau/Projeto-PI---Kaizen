<?php
require_once 'Connection.php';

class MealFood
{
    private $con;

    public function __construct()
    {
        $this->con = Connection::getConnection();
    }

}
