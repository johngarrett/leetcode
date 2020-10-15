<?

// without converting to a string
function isPalindrome(int $s): bool {
    if ($s < 0) {
        return false;
    }

    $digits = isset($s) ? floor(log10($s) + 1) : 1;
    
    $source = $s;
    $reversed = 0;
    while($digits > 0) {
        $reversed += ($source % 10) * pow(10, $digits - 1);
        $digits--;
        $source /= 10;
    }

    return $reversed == $s;
}

$is = isPalindrome(10);
if ($is) {
    echo "\ntrue\n";
} else {
    echo "\nfalse\n";
}
