<?php
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: ../kaizen");
    exit;
}
?>

<?php
$w = new Foods();
$url_atual = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$partes_url = explode('/', $url_atual);
$food = $w->getFoodsById($partes_url[7]);
?>

<form action="../updateFood" method="post">
  <input type="hidden" name="action" value="updateFood">
  <input type="hidden" name="id" value="<?php echo isset($food[0]['id']) ? $food[0]['id'] : ''; ?>">

  <label for="name">Nome:</label><br>
  <input type="text" id="name" name="name" value="<?php echo isset($food[0]['name']) ? $food[0]['name'] : ''; ?>"><br>

  <label for="kcal">Kcal:</label><br>
  <input type="text" id="kcal" name="kcal" value="<?php echo isset($food[0]['kcal']) ? $food[0]['kcal'] : ''; ?>"><br>

  <label for="carbo">Carbo:</label><br>
  <input type="text" id="carbo" name="carbo" value="<?php echo isset($food[0]['carbo']) ? $food[0]['carbo'] : ''; ?>"><br>

  <label for="proteins">Proteínas:</label><br>
  <input type="text" id="proteins" name="proteins" value="<?php echo isset($food[0]['proteins']) ? $food[0]['proteins'] : ''; ?>"><br>

  <input type="submit" value="Atualizar">
</form>