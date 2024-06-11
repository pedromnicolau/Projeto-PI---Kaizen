<div id="food-backgroud">
  <br>
  <h1 style="text-align: center;">Cadastro de alimentos</h1>
  <br>
  <div class="foods-div">
    <table class="table">
    <thead class="thead-dark">
            <tr>
              <th class="food" scope="col"  style='text-align: center;'>Cód</th>
              <th class="food" scope="col">Alimento</th>
              <th class="food" scope="col" style='text-align: center;'>KCAL</th>
              <th class="food" scope="col" style='text-align: center;'>Carbo</th>
              <th class="food" scope="col" style='text-align: center;'>Proteínas</th>
              <th class="food" scope="col" colspan="2" style="text-align: center;">Ações</th>
            </tr>
          </thead>
      <tbody>
        <?php
          foreach ($this->data2 as $food) {
              echo "<tr><td scope='row' style='text-align: center;'>{$food['id']}</td><td scope='row'>{$food['name']}</td><td scope='row' style='text-align: center;'>{$food['kcal']}</td><td scope='row' style='text-align: center;'>{$food['carbo']}<td scope='row' style='text-align: center;'>{$food['proteins']}</td><td><a href='#' class='edit-btn' data-id='{$food['id']}'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='lucide lucide-pencil-line'><path d='M12 20h9'/><path d='M16.5 3.5a2.12 2.12 0 0 1 3 3L7 19l-4 1 1-4Z'/><path d='m15 5 3 3'/></svg></a></td><td><a href='#' class='delete-btn' data-id='{$food['id']}'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='lucide lucide-trash-2'><path d='M3 6h18'/><path d='M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6'/><path d='M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2'/><line x1='10' x2='10' y1='11' y2='17'/><line x1='14' x2='14' y1='11' y2='17'/></svg></a></td></tr>";
            }
        ?>
      </tbody>
    </table>
    <?php
        $con = Connection::getConnection();
        $url_completa = $_SERVER["REQUEST_URI"];
        parse_str(parse_url($url_completa, PHP_URL_QUERY), $query_params);
        if (isset($query_params['page'])) {
            $page = $query_params['page'];
        } else {
            $page = 1;
        }
        $items_per_page = 10;
        $offset = ($page - 1) * $items_per_page;
        echo $page;
        $cmd2 = $con->query('SELECT COUNT(id) as total FROM foods');
        $result = $cmd2->fetchAll(PDO::FETCH_ASSOC);
        $total_items = $result[0]['total'];
        $total_pages = $total_items / $items_per_page;
        $range = 1;
        echo "<nav aria-label='Navegação de página exemplo'>
        <ul class='pagination justify-content-center'>";
    if($page > 1){
        echo "<li class='page-item'><a class='page-link' href='foods?page=".($page - 1)."'>Anterior</a></li>";
    }
    
    for($i = max(1, $page - $range); $i <= min($page + $range, $total_pages); $i++){
        if($i == $page){
            echo "<li class='page-item active'><a class='page-link' href='foods?page=$i'>$i</a></li>";
        }else{
            echo "<li class='page-item'><a class='page-link' href='foods?page=$i'>$i</a></li>";
        }
    }
    
    if($page < $total_pages){
        echo "<li class='page-item'><a class='page-link' href='foods?page=".($page + 1)."'>Próximo</a></li>";
    }
    
    echo "</ul></nav>";?>
    <div style="text-align: center;">
        <button type="button" class="btn btn-success" onclick="window.location.href='foods/register'" style="text-align: center;">Cadastrar novo alimento</button>
    </div>
    <br>
  </div>

</div>

<script>
document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('.delete-btn').forEach((btn) => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            if (confirm('Tem certeza de que deseja excluir este item?')) {
                window.location.href = 'foods/delete/' + e.currentTarget.dataset.id;
            }
        });
    });
});
document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('.edit-btn').forEach((btn) => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            if (confirm('Tem certeza de que deseja editar este item?')) {
                window.location.href = 'foods/edit/' + e.currentTarget.dataset.id;
            }
        });
    });
});
</script>