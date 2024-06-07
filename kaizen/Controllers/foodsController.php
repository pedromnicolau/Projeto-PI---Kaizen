<?php
  require_once "Models/food.php";
  Class foodsController extends Controller{    
    public function index(){

      $w = new Foods();
      $foods = $w->getFoods();

      $this->loadTemplate('foods/index', array(), $foods);
    }

    public function edit($id){
      $w = new Foods();
      $food = $w->getFoodsById($id);

      $this->loadTemplate('foods/edit', array(), $food);
    }
    public function delete($id){
      $w = new Foods();
      $foods = $w->deleteFood($id);
      $this->loadTemplate('foods/delete');
    }
}

?>