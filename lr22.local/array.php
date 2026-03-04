<?php
// Массив из 8 элементов
$arr = [3, -5, 7, 2, -8, 9, 4, 6];

$original = implode(", ", $arr);

// произведение нечётных
$product = 1;
foreach ($arr as $v) {
    if ($v % 2 != 0)
        $product *= $v;
}

// найти max
$max = max($arr);

// заменить отрицательные
foreach ($arr as &$v) {
    if ($v < 0)
        $v = $max;
}

$changed = implode(", ", $arr);

$arrayBlock = "
<h2>Массивы</h2>
Исходный: $original <br>
Произведение нечётных: $product <br>
Изменённый: $changed
";
?>
