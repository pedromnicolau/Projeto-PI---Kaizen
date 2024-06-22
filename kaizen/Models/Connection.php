<?php
  class Connection{
    private static $instance;

    private function __construct(){}

    public static function getConnection(){
      if(!isset(self::$instance)){
        $dbname = 'Kaizen';
        $host = 'LocalHost';
        $user = 'root';
        $password = '';

        try{
          self::$instance = new PDO('mysql:dbname='.$dbname.';host='.$host,$user,$password);
        }
        catch(Exception $e){
          echo 'Erro: '.$e;
        }
      }

      return self::$instance;
    }
  }
?>