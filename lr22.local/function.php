<?php

/**
 * Вычисляет y по формуле: (|x| - 2) / (x - 1)
 * @param float $x
 * @return float
 * @throws Exception если x = 1 (деление на ноль)
 */
function calculate($x)
{
    // Исключительная ситуация: деление на ноль
    if ($x == 1) {
        throw new Exception("Ошибка: деление на ноль (x = 1)");
    }

    // Вычисление по формуле
    $y = (abs($x) - 2) / ($x - 1);

    // Возвращаем результат через return (как требуется в задании)
    return $y;
}

// Блок вывода результата в index.php
try {
    $x = 10; 
    $y = calculate($x);

    $functionBlock = "
        <h2>Функция (Задание 6)</h2>
        <p>Формула: y = (|x| - 2) / (x - 1)</p>
        <p>При x = $x → y = $y</p>
    ";
} catch (Exception $e) {
    $functionBlock = "
        <h2>Функция (Задание 6)</h2>
        <p>Формула: y = (|x| - 2) / (x - 1)</p>
        <p><strong>{$e->getMessage()}</strong></p>
    ";
}
?>
