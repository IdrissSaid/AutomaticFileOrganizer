function get_folder_dest_path { param ([string] $folder, [string] $start_folder)
    $tmp = $folder;
    if ($null -ne $start_folder) {
        $folder = "$start_folder\" + $folder;
    }
    $testFile = Test-Path -Path $folder;
    if ($testFile -eq 0){
        Write-Host "Creating $tmp directory..."
        New-Item -Path $folder -ItemType "directory";
        $testFile = Test-Path -Path $folder
        if ($testFile -eq 0) {
            Write-Error "ERROR | Can't create the delivry file";
            return $null;
        }
    }
    return [string] $folder
}