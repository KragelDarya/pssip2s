<?php
// ФИО вывести n+5 раз
$n = 7; 
$count = $n + 5;

$fio = "Крагель Дарья Дмитриевна";

$out = "<h2>Цикл for</h2>";

for ($i = 0; $i < $count; $i++) {
    $out .= $fio . "<br>";
}

$loopBlock = $out;
?>
