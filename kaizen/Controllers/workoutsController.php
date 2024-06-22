<?php
require_once 'Connection.php';

class workoutsController extends Controller
{
    // public function getWorkouts(){
    //   $w = new Workout();
    //   $data = $w->getWorkouts();
    //   $this->loadTemplate('getWorkouts', array(), $data);
    // }
    public function index()
    {
        $url_completa = $_SERVER["REQUEST_URI"];
        parse_str(parse_url($url_completa, PHP_URL_QUERY), $query_params);
        if (isset($query_params['page'])) {
            $page = $query_params['page'];
        } else {
            $page = 1;
        }
        $items_per_page = 10;
        $offset = ($page - 1) * $items_per_page;
        $w = new Workout();
        $workouts = $w->getWorkouts($offset, $items_per_page);
        $this->loadTemplate('workouts/index', array(), $workouts);

    }

    public function edit($id)
    {
        $w = new Workout();
        $workout = $w->getWorkoutById($id);

        $this->loadTemplate('workouts/edit', array(), $workout);
    }
    public function delete($id)
    {
        $w = new Foods();
        $workout = $w->getFoodsById($id);

        $this->loadTemplate('workouts/edit', array(), $workout);
    }
}
