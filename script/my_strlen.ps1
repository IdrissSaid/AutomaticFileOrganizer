function my_strlen { param ([string] $str)
    if ($str -eq $null) {return 0;}
    $i = 0;
    for (; $str[$i]; $i++) {}
    return $i;
}
