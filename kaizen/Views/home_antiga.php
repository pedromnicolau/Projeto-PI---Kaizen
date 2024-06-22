<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css"> <!-- Ajuste o caminho conforme sua estrutura de diretórios -->
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Minha Aplicação</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.php">Início</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="treino.php">Treino</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="exercicio.php">Exercício</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="refeicao.php">Refeição</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="alimentacao.php">Alimentação</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cronometro.php">Cronômetro</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="usuario.php">Usuário</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h1>Bem-vindo(a) à Página Inicial</h1>
        <p>Olá, <?php echo $_SESSION['username']; ?>! Esta é a página inicial da sua aplicação.</p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.
