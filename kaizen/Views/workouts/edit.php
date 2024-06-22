<h1>Treino - <?php echo $this->data2['id']; ?></h1>

<?php
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: ../kaizen");
    exit;
}

echo "<h3>{$this->data2['name']}</h3>";
?>


