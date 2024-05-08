<!-- <?php
session_start();

if(isset($_POST['login'])) {
    // Validação dos dados do formulário (neste exemplo, apenas username e password)
    $name = $_POST['name'];
    $password = $_POST['password'];

    // Verificação dos dados no banco de dados (este é um exemplo básico, utilize o método adequado para seu banco de dados)
    // Para este exemplo, você precisa ter uma conexão com o banco de dados
    include('includes/db.php');
    $query = "SELECT * FROM users WHERE name='$name' AND password='$password'";
    $result = mysqli_query($conexao, $query);

    if(mysqli_num_rows($result) == 1) {
        $_SESSION['name'] = $name;
        header("Location: index.php");
        exit();
    } else {
        $error = "Usuário ou senha incorretos";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container mt-5">
        <h1>Login</h1>
        <?php if(isset($error)) : ?>
        <div class="alert alert-danger" role="alert">
            <?php echo $error; ?>
        </div>
        <?php endif; ?>
        <form action="login.php" method="post">
            <div class="form-group">
                <label for="name">Nome</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="password">Senha</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary" name="login">Login</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>

</html> -->
