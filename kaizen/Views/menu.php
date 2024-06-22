<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><img src="medias/logo.png" alt="" width="80px" height="40px"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <?php if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
} else {
    echo "
      <li class='nav-item'>
        <a class='nav-link' href='index'>Início</a>
      </li>
      <li class='nav-item'>
        <a class='nav-link' href='workouts'>Treino</a>
      </li>
      <li class='nav-item'>
        <a class='nav-link' href='exercises'>Exercício</a>
      </li>
      <li class='nav-item'>
        <a class='nav-link' href='refeicao.php'>Refeição</a>
      </li>
      <li class='nav-item'>
        <a class='nav-link' href='foods'>Cadastro de alimentos</a>
      </li>
    </ul>
    </div>";
}

if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    echo "<div class='dropdown'><button class='mainmenubtn' onclick='window.location.href=\"users\"'>
      <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='lucide lucide-circle-user-round'><path d='M18 20a6 6 0 0 0-12 0'/><circle cx='12' cy='10' r='4'/><circle cx='12' cy='12' r='10'/></svg>
      Login
      </button></div>";
} else {
    echo "<div class='dropdown'>
      <button class='mainmenubtn'>
        <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='lucide lucide-circle-user-round'><path d='M18 20a6 6 0 0 0-12 0'/><circle cx='12' cy='10' r='4'/><circle cx='12' cy='12' r='10'/></svg>
        {$_SESSION['loggedin']}
      </button>
      <div class='dropdown-child'>
        <a href='../kaizen/users/logout'>
        <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='lucide lucide-log-out'><path d='M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4'/><polyline points='16 17 21 12 16 7'/><line x1='21' x2='9' y1='12' y2='12'/></svg>
        Logout</a>
      </div>";
}
?>
</div>

</nav>