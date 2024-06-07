<?php

  Class workoutsController extends Controller{    
    public function index(){
      $w = new Workout();
      $workouts = $w->getWorkouts();

      $this->loadTemplate('workouts/index', array(), $workouts);
    }

    // public function getWorkouts(){
    //   $w = new Workout();
    //   $data = $w->getWorkouts();
    //   $this->loadTemplate('getWorkouts', array(), $data);
    // }
    
    public function edit($id){
      $w = new Workout();
      $workout = $w->getWorkoutById($id);

      $this->loadTemplate('workouts/edit', array(), $workout);
    }
    public function delete($id){
      $w = new Foods();
      $workout = $w->getFoodsById($id);

      $this->loadTemplate('workouts/edit', array(), $workout);
    }
  }
?>