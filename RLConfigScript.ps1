# -----------------------------------------------
# CONFIG - Set these to your actual file paths
# -----------------------------------------------
$sourceFile1 = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\YOURFILENAME.save"
$sourceFile2 = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\YOURFILENAME_2.save"
$targetDir   = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveDataEpic\DBE_Production"
# -----------------------------------------------

# File 1 replaces all files ending in .save or _1.save
Get-ChildItem -Path $targetDir | Where-Object {
    $_.Name -match '(?<!_2)\.save$' -or $_.Name -match '_1\.save$'
} | ForEach-Object {
    $targetName = $_.FullName
    Write-Host "Replacing (File1): $($_.Name)"
    Copy-Item -Path $sourceFile1 -Destination $targetName -Force
}

# File 2 replaces all files ending in _2.save
Get-ChildItem -Path $targetDir | Where-Object {
    $_.Name -match '_2\.save$'
} | ForEach-Object {
    $targetName = $_.FullName
    Write-Host "Replacing (File2): $($_.Name)"
    Copy-Item -Path $sourceFile2 -Destination $targetName -Force
}

Write-Host "All done!"