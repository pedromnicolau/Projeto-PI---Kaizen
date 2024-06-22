<?php
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: ../kaizen");
    exit;
}
?>
<?php
$w = new Exercise();
$url_atual = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$partes_url = explode('/', $url_atual);
$exercise = $w->getExercisesById($partes_url[7]);
?>

<form action="../kaizen/exercises/updateExercise" method="post">
  <input type="hidden" name="action" value="updateExercise">
  <input type="hidden" name="id" value="<?php echo isset($exercise[0]['id']) ? $exercise[0]['id'] : ''; ?>">

  <label for="name">Nome:</label><br>
  <input type="text" id="name" name="name" value="<?php echo isset($exercise[0]['name']) ? $exercise[0]['name'] : ''; ?>"><br>

  <label for="target_muscle">Musculo alvo:</label><br>
  <input type="text" id="target_muscle" name="target_muscle" value="<?php echo isset($exercise[0]['target_muscle']) ? $exercise[0]['target_muscle'] : ''; ?>"><br>

  <label for="type">Tipo de exercício:</label><br>
  <input type="text" id="type" name="type" value="<?php echo isset($exercise[0]['type']) ? $exercise[0]['type'] : ''; ?>"><br>

  <input type="submit" value="Atualizar">
</form>