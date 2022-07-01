. .\script\my_strlen.ps1
. .\script\my_strstr.ps1
. .\script\get_folder_name.ps1
. .\script\get_folder_dest_path.ps1

$file = ".\DropYourFileHere";
$dest_folder = ".\delivry";
$testFile = Test-Path -Path $file;
$beggin_pattern = "B-"

if ($testFile -eq 0) {
    Write-Host "Creating $file directory.\.\."
    New-Item -Path $file -ItemType "directory";
    $testFile = Test-Path -Path $file
    if ($testFile -eq 0) {
        Write-Error "ERROR | Can't create the drop file";
        exit 1;
    }
}

[string[]]$output = Get-ChildItem -Path $file -Name;


if ($null -eq $output) {return 0;}

[string[]] $nameFolder = @();
[string[]] $nameFolder = get_folder_name $output $beggin_pattern

$testFile = Test-Path -Path $dest_folder;

if ($testFile -eq 0) {
    Write-Host "Creating $dest_folder directory..."
    New-Item -Path $dest_folder -ItemType "directory";
    $testFile = Test-Path -Path $dest_folder
    if ($testFile -eq 0) {
        Write-Error "ERROR | Can't create the delivry file";
        exit 1;
    }
}

for ($i = 0; $output[$i]; $i++) {
    [string] $folder = $output[$i];
    [string] $dest = get_folder_dest_path $nameFolder[$i].ToLower() $dest_folder;
}

for ($i = 0; $output[$i]; $i++) {
    [string] $folder = $output[$i];
    [string] $dest = get_folder_dest_path $nameFolder[$i].ToLower() $dest_folder;
    if ($null -ne $dest) {
        Write-Host "Storage of the $folder folder in $dest folder";
        Move-Item -Path "$file\$folder" -Destination $dest -Force
    }
}