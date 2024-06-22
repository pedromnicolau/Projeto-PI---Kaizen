<?php
require_once 'Connection.php';

class Meal
{
    private $con;

    public function __construct()
    {
        $this->con = Connection::getConnection();
    }

}
