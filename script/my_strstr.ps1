function my_strstr {param([string] $str, [string] $target)
    if ($null -eq $str) {return 0;}
    if ($null -eq $target) {return 0;}

    $len = my_strlen($target);
    $o = 0;
    for ($i = 0; $null -ne $str[$i]  || $null -ne $target[$i]; $i++) {
        if ($str[$i] -eq $target[$i]) {$o += 1;}
        elseif ($o -eq $len) {return 1;}
        else {$o = 0;}
    }
    return 0;
}