<?php
  Class Controller{
    public $data;
    public $data2;

    public function __construct(){
      $this->data = array();
    }

    public function loadTemplate($viewName, $modelData = array(), $data2 = array()){
      $this->data = $modelData;
      $this->data2 = $data2;
      require 'Views/template.php';
    }

    public function loadViewOnTemplate($viewName, $modelData = array()){
      extract($modelData);
      require 'Views/'.$viewName.'.php';
    }
  }
?>