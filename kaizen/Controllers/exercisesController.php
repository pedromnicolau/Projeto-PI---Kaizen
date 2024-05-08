<?php

  Class exercisesController extends Controller{    
    public function index(){
      $w = new Exercise();
      $data = $w->getExercises();

      $this->loadTemplate('exercises', array(), $data);
    }
  }
?>