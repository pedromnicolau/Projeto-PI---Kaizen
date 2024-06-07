
<h1>Alimentos!!!</h1>

<div id="foods">
  <table>
    <thead>
      <tr>
        <th class="food">Cód</th>
        <th>Alimento</th>
      </tr>
    </thead>
    <tbody>
      <?php
        foreach ($this->data2 as $food) {
            echo "<tr><td>{$food['id']}</td><td>{$food['name']}</td></tr>";
          }
      ?>
    </tbody>
  </table>
</div>
<a href="delete" class="btn btn-success">Cadastrar</a>
<button id="btn-delete" onclick="abrirPopup()" class="btn btn-success">Excluir</button>
<div id="popup" style="display: none;">
    <input type="text" id="codigo-alimento" placeholder="Código do alimento">
    <button onclick="deleteFoods()">Excluir</button>
    <button onclick="fecharPopup()">Fechar</button>
</div>