<?php

  Class workoutsController extends Controller{    
    public function index(){
      $w = new Workout();
      $data = $w->getWorkouts();

      $this->loadTemplate('workouts/index', array(), $data);
    }

    public function getWorkouts(){
      $w = new Workout();
      $data = $w->getWorkout();
      $this->loadTemplate('getWorkouts', array(), $data);
    }
    
    public function edit($id){
      $w = new Workout();
      $workout = $w->getWorkoutById($id);

      $this->loadTemplate('workouts/edit', array(), $workout);
    }
  }
?>