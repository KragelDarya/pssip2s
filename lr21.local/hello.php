<?php

$developer = "Крагель Дарья Дмитриевна"; // <-- замените на своё ФИО
$group = "ПЗТ-40";                    // <-- при желании замените
$date = date("d.m.Y");               // текущая дата
?>
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>Привет всем</title>
</head>
<body>
  <h1>Привет всем!!!</h1>

  <hr>

  <h2>Информация о разработчике</h2>
  <p><strong>Разработчик:</strong> <?= htmlspecialchars($developer) ?></p>
  <p><strong>Группа:</strong> <?= htmlspecialchars($group) ?></p>
  <p><strong>Дата:</strong> <?= $date ?></p>
</body>
</html>
