
<div id="food-backgroud">
  <br>
  <h1 style="text-align: center;">Cadastro de alimentos</h1>
  <br>
  <div class="foods-div"  style="display: flex; justify-content: center;">
      <form action="../kaizen/foods/registerFood" method="post"  style="text-align: left; width: 80%; color: black ">
        <input type="hidden" name="action" value="registerFood">
          <div class="form-group">
            <label for="name">Descrição:</label>
            <input type="text" id="name" name="name" class="form-control">
          </div>
          <div class="form-group">
            <label for="kcal">Kcal:</label>
            <input type="text" id="kcal" name="kcal" class="form-control">
          <div class="form-group">
            <label for="carbo">Carbo:</label>
            <input type="text" id="carbo" name="carbo" class="form-control">
          </div>
          <div class="form-group">
            <label for="proteins">Proteínas:</label>
            <input type="text" id="proteins" name="proteins" class="form-control">
          </div>
            <input type="submit" value="Cadastrar">
      </form>
</div>
</div>