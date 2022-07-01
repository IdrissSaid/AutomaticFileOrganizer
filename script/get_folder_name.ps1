function get_folder_name { param ([string[]] $src, [string]$beggin_pattern)
    $nameFolder = @();

    for ($i = 0; $src[$i]; $i++) {
        $len = my_strlen $src[$i];
        $goodStr = my_strstr $src[$i] $beggin_pattern;
        if ($goodStr -eq 1 -and $len -gt 3) {
            $nameFolder += ($src[$i].Substring(2, 3));
        } else {
            $nameFolder += "Other";
        }
    }
    return $nameFolder;
}