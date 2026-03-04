<?php
// Вывести сколько дней осталось до даты

$targetDate = "2026-03-08";

$today = new DateTime();
$future = new DateTime($targetDate);

$diff = $today->diff($future)->days;

if ($today < $future)
    $text = "До $targetDate осталось $diff дней";
else
    $text = "С даты $targetDate прошло $diff дней";

$dateBlock = "<h2>Работа с датой</h2><p>$text</p>";
?>
