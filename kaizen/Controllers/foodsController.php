<?php
  require_once "Models/food.php";
  Class foodsController extends Controller{
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
        $w = new Foods();
        $foods = $w->getFoods($offset, $items_per_page);
        $this->loadTemplate('foods/index', array(), $foods);

    }

    public function edit($id){
      $w = new Foods();
      $food = $w->getFoodsById($id);
      $this->loadTemplate('foods/edit', array(), $food);
    }

    public function register(){

      $this->loadTemplate('foods/register');
    }

    public function updateFood() {

      if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $kcal = $_POST['kcal'];
        $carbo = $_POST['carbo'];
        $proteins = $_POST['proteins'];
        $w = new Foods();
        $w->updateFood($id, $kcal, $carbo, $proteins, $name);
      }
      header('Location: ../foods');
      exit;
    }
    public function registerFood() {

      if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = $_POST['name'];
        $kcal = $_POST['kcal'];
        $carbo = $_POST['carbo'];
        $proteins = $_POST['proteins'];
        $w = new Foods();
        $w->registerFood($kcal, $carbo, $proteins, $name);
      }
      header('Location: ../foods');
      exit;
    }

    public function delete($id){
      $w = new Foods();
      $food = $w->deleteFood($id);
      header('Location: ../../foods');
    }
}

?>