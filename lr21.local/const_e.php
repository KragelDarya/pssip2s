<?php

define("NUM_E", 2.71828);

$message = "Число e равно " . NUM_E;

$num_e1 = NUM_E;

function showTypeAndValue($value) {
    echo "Тип: " . gettype($value) . "<br>";
    echo "Значение: ";
    var_export($value);
    echo "</p>";
}
?>
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>Константа e и типы</title>
</head>
<body>
  <h2>Константа NUM_E</h2>
  <p><?= htmlspecialchars($message) ?></p>

  <hr>

  <h2>Переменная num_e1 и преобразования типов</h2>

  <?php
  // исходное значение
  showTypeAndValue($num_e1);

  // преобразуем в строку
  $num_e1 = (string)$num_e1;
  showTypeAndValue($num_e1);

  // преобразуем в int
  $num_e1 = (int)$num_e1;
  showTypeAndValue($num_e1);

  // преобразуем в bool
  $num_e1 = (bool)$num_e1;
  showTypeAndValue($num_e1);
  ?>
</body>
</html>
