<?php
  require_once "Models/Exercise.php";
  Class exercisesController extends Controller{    

    public function index(){
    
    $url_completa = $_SERVER["REQUEST_URI"];
    parse_str(parse_url($url_completa, PHP_URL_QUERY), $query_params);
    if (isset($query_params['page'])) {
        $page = $query_params['page'];
    } else {
        $page = 1;
    }
    $items_per_page = 10;
    $offset = ($page - 1) * $items_per_page;
    $w = new Exercise();
    $exercises = $w->getExercises($offset, $items_per_page);
      $this->loadTemplate('exercises/index', array(), $exercises);
    
    }
    public function edit($id){
      $w = new Exercise();
      $exercises = $w->getExercisesById($id);
      $this->loadTemplate('exercises/edit', array(), $exercises);
    }

    public function register(){

      $this->loadTemplate('exercises/register');
    }

    public function updateExercise() {

      if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $target_muscle = $_POST['target_muscle'];
        $type = $_POST['type'];
        $w = new Exercise();
        $w->updateExercise($id, $name, $target_muscle, $type);
      }
      header('Location: ../exercises');
      exit;
    }
    public function registerExercise() {

      if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = $_POST['name'];
        $target_muscle = $_POST['target_muscle'];
        $type = $_POST['type'];
        $w = new Exercise();
        $w->registerExercise($name, $target_muscle, $type);
      }
      header('Location: ../exercises');
      exit;
    }

    public function delete($id){
      $w = new Exercise();
      $food = $w->deleteExercise($id);
      header('Location: ../../exercises');
    }
}
?>