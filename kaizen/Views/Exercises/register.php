<?php
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: ../kaizen");
    exit;
}
?>
<div id="food-backgroud">
  <br>
  <h1 style="text-align: center;">Cadastro de exercícios</h1>
  <br>
  <div class="foods-div"  style="display: flex; justify-content: center;">
      <form action="../kaizen/exercises/registerExercise" method="post"  style="text-align: left; width: 80%; color: black ">
        <input type="hidden" name="action" value="registerExercise">
          <div class="form-group">
            <label for="name">Descrição:</label>
            <input type="text" id="name" name="name" class="form-control">
          </div>
          <div class="form-group">
            <label for="target_muscle">Musculo alvo:</label>
            <input type="text" id="target_muscle" name="target_muscle" class="form-control">
          <div class="form-group">
            <label for="type">Tipo:</label>
            <input type="text" id="type" name="type" class="form-control">
          </div>
            <input type="submit" value="Cadastrar">
      </form>
</div>
</div>
