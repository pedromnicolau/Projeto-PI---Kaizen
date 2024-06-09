<?php
  require_once "Models/food.php";
  Class foodsController extends Controller{
    public function index(){
      $con = Connection::getConnection();
      $base_url = strtok($_SERVER["REQUEST_URI"], '?');
      $items_per_page = 10;
      $page = isset($_GET['page']) ? $_GET['page'] : 1;
      $offset = ($page - 1) * $items_per_page;
      $cmd2 = $con->query('SELECT COUNT(id) as total FROM foods');
      $result = $cmd2->fetchAll(PDO::FETCH_ASSOC);
      $total_items = $result[0]['total'];
      $total_pages = ceil($total_items / $items_per_page);
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
      $this->loadTemplate('foods/register', array());
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
    public function registerFoods() {

      if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $kcal = $_POST['kcal'];
        $carbo = $_POST['carbo'];
        $proteins = $_POST['proteins'];
        $w = new Foods();
        $w->registerFood($id, $kcal, $carbo, $proteins, $name);
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