<?php
// predefined.php
// Пример предопределённых констант и супер-глобальных переменных PHP

// Примеры предопределённых констант:
$file = __FILE__; // полный путь к текущему файлу
$line = __LINE__; // номер строки (здесь будет номер этой строки)
$phpVersion = PHP_VERSION; // версия PHP
$os = PHP_OS; // ОС, на которой запущен PHP

// Примеры предопределённых переменных (суперглобальных массивов):
$serverName = $_SERVER['SERVER_NAME'] ?? 'unknown';
$requestUri = $_SERVER['REQUEST_URI'] ?? 'unknown';
$userAgent  = $_SERVER['HTTP_USER_AGENT'] ?? 'unknown';
$method     = $_SERVER['REQUEST_METHOD'] ?? 'unknown';
?>
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>Предопределённые константы и переменные</title>
</head>
<body>
  <h2>Предопределённые константы</h2>
  <ul>
    <li><strong>__FILE__:</strong> <?= htmlspecialchars($file) ?></li>
    <li><strong>__LINE__:</strong> <?= (int)$line ?></li>
    <li><strong>PHP_VERSION:</strong> <?= htmlspecialchars($phpVersion) ?></li>
    <li><strong>PHP_OS:</strong> <?= htmlspecialchars($os) ?></li>
  </ul>

</body>
</html>
