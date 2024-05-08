<?php
session_start();

if(isset($_POST['signup'])) {
    // Validação dos dados do formulário (neste exemplo, apenas username e password)

    $nome = $_POST['name'];
    $data_nascimento = $_POST['birth_date'];
    $peso = $_POST['weight'];
    $altura = $_POST['height'];
    $sexo = $_POST['gender'];
    $email = $_POST['email'];
    $telefone = $_POST['phone_number'];
    $senha = $_POST['password'];

    // print_r($_POST['name']);
    // print_r('<br>');
    // print_r($_POST['email']);
    // print_r('<br>');
    // print_r($_POST['phone_number']);
    // print_r('<br>');
    // print_r($_POST['gender']);
    // print_r('<br>');
    // print_r($_POST['height']);
    // print_r('<br>');
    // print_r($_POST['weight']);
    // print_r('<br>');
    // print_r($_POST['password']);
    // print_r('<br>');
    // print_r($_POST['confirm_password']);

    // Você pode adicionar mais validações, como checar se o username já existe no banco de dados

    // Salvar usuário no banco de dados (este é um exemplo básico, utilize o método adequado para seu banco de dados)
    // Para este exemplo, você precisa ter uma conexão com o banco de dados
    include('includes/db.php');

    mysqli_query($conexao, "INSERT INTO users (name, birth_date, weight, height, gender, email, phone_number, password) VALUES ('$nome', '$data_nascimento', '$peso', '$altura', '$sexo', '$email', '$telefone', '$senha')");

    $_SESSION['name'] = $name;
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="col-sm-6 container mt-5">
        <h1>Cadastro de usuário</h1><br>
        <form action="signup.php" method="post">
            <div class="row" >
              <div class="col-sm-6 form-group">
                  <label for="name">Nome completo</label>
                  <input type="text" class="form-control" id="name" name="name" required>
              </div>
              <div class="col-sm-6 form-group">
                  <label for="email">Email</label>
                  <input type="text" class="form-control" id="email" name="email" required>
              </div>
            </div>
            <div class="row" >
              <div class="col-sm-3 form-group">
                <label for="phone_number">Telefone</label>
                <input type="text" class="form-control" id="phone_number" name="phone_number" required>
              </div>
              <div class="col-sm-3 form-group">
                <label for="gender">Sexo</label>
                <select type="text" class="form-control" id="gender" name="gender" required>
                  <option selected>Masculino</option>
                  <option>Feminino</option>
                </select>
              </div>  
              <div class="col-sm-3 form-group">
                <label for="birth_date">Data nascimento</label>
                <input type="date" class="form-control" id="birth_date" name="birth_date" required>
              </div>
              <div class="form-group" style="width: 10%;">
                <label for="weight">Peso</label>
                <input type="text" class="form-control" id="weight" name="weight" required>
              </div>
              <div class="form-group" style="width: 10%; margin-left: 25px">
                <label for="height">Altura</label>
                <input type="text" class="form-control" id="height" name="height" required>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-6 form-group">
                <label for="password">Senha</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>
              <div class="col-sm-6 form-group">
                <label for="confirm_password">Confirmar Senha</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
              </div>
            </div>
            <button type="submit" class="btn btn-primary" name="signup">Cadastrar</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>

</html>
