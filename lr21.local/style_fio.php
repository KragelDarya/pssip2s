<?php
$fio = "Крагель Дарья Дитриевна"; 

$color = "#ff00aa"; 
$size  = "28px";
?>
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>ФИО</title>
</head>
<body>
  <h2>ФИО разработчика</h2>
  <p style="color: <?= htmlspecialchars($color) ?>; font-size: <?= htmlspecialchars($size) ?>;">
    <?= htmlspecialchars($fio) ?>
  </p>
</body>
</html>
