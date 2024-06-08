
<div id="food-backgroud">
<h1 style="text-align: center;">Alimentos!!!</h1>

<div id="foods">
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th class="food" scope="col">Cód</th>
        <th class="food" scope="col">Alimento</th>
        <th class="food" scope="col">KCAL</th>
        <th class="food" scope="col">Carbo</th>
        <th class="food" scope="col">Proteínas</th>
      </tr>
    </thead>
    <tbody>
      <?php
        foreach ($this->data2 as $food) {
            echo "<tr><td scope='row'>{$food['id']}</td><td scope='row'>{$food['name']}</td><td scope='row'>{$food['kcal']}<td scope='row'>{$food['carbo']}<td>{$food['proteins']}</tr>";
          }
      ?>
    </tbody>
  </table>
</div>
<div style="text-align: center;">
<a href="delete" class="btn btn-success">Cadastrar</a>
<button id="btn-delete" onclick="abrirPopup()" class="btn btn-success">Excluir</button>
</div>
<div id="popup" style="display: none; text-align: center;">
    <input type="text" id="codigo-alimento" placeholder="Código do alimento">
    <button onclick="deleteFoods()">Excluir</button>
    <button onclick="fecharPopup()">Fechar</button>
</div>
</div>