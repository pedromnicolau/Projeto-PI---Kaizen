<!-- URL: Classe/Função/Parâmetros -->
<?php
class Core{
  public function __construct(){
    $this->run();
  }

  public function run(){
    $url = isset($_GET['pag']) ? $_GET['pag'] : '';

    if(!empty($url)){
      $url = explode('/', $url);

      $controller = $url[0].'Controller';
      array_shift($url);

      if(isset($url[0]) && !empty($url[0])){
        $method = $url[0];
        array_shift($url);
      }else{
        $method = 'index';
      }

      if(count($url) > 0){
        $params = $url;
      } else {
        $params = [];
      }

    }else{
      $controller = 'homeController';
      $method = 'index';
      $params = [];
    }

    $caminho = 'Controllers/'.$controller.'.php';

    if(file_exists($caminho) && method_exists($controller, $method)){
      $c = new $controller;

      // Corrigindo o nome da variável de parâmetros
      call_user_func_array(array($c, $method), $params); // Alterei $parametros para $params
    }else{
      $controller = 'homeController'; // Corrigindo o nome do controlador padrão
      $method = 'index'; // Corrigindo o nome do método padrão
      $c = new $controller;
      call_user_func_array(array($c, $method), $params); // Alterei $parametros para $params
    }
  }
}
?>
