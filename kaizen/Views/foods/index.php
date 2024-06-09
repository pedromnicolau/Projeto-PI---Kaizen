
<div id="food-backgroud">
  <h1 style="text-align: center;">Alimentos!!!</h1>

  <div class="foods-div" style="border-radius: 30px 30px 0 0;">
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
    </table>
  </div>
  <div class="foods-div">
    <table class="table">
      <tbody>
        <?php
          foreach ($this->data2 as $food) {
              echo "<tr><td scope='row'>{$food['id']}</td><td scope='row'>{$food['name']}</td><td scope='row'>{$food['kcal']}<td scope='row'>{$food['carbo']}<td>{$food['proteins']}</td></tr>";
            }
        ?>
      </tbody>
    </table>
  </div>
</div>