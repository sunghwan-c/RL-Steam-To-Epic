# -----------------------------------------------
# CONFIG
# -----------------------------------------------
$sourceDir = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production"   # Directory to pick the 2 source files from
$targetDir = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveDataEpic\DBE_Production"   # Directory to replace files in
# -----------------------------------------------

# --- Determine File1 and File2 from source dir (same logic as before) ---

# Step 1: Find the latest modified .save file (any .save variant)
$latestSave = Get-ChildItem -Path $sourceDir | Where-Object {
    $_.Name -match '\.save$'
} | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $latestSave) { Write-Host "ERROR: No .save file found in source dir!"; Read-Host; exit }

# Strip _1 or _2 from the end of the base name if present
$FName = $latestSave.BaseName -replace '_[12]$', ''

Write-Host "FName detected: $FName (from: $($latestSave.Name), Modified: $($latestSave.LastWriteTime))"
Write-Host ""

$file1FallbackUsed = $false

if (Test-Path "$sourceDir\$FName.save") {
    $File1 = Get-Item "$sourceDir\$FName.save"
} elseif (Test-Path "$sourceDir\${FName}_1.save") {
    $File1 = Get-Item "$sourceDir\${FName}_1.save"
    $file1FallbackUsed = $true
} else {
    Write-Host "ERROR: Neither $FName.save nor ${FName}_1.save found!"; Read-Host; exit
}

if (-not $file1FallbackUsed) {
    if (Test-Path "$sourceDir\${FName}_1.save") {
        $File2 = Get-Item "$sourceDir\${FName}_1.save"
    } elseif (Test-Path "$sourceDir\${FName}_2.save") {
        $File2 = Get-Item "$sourceDir\${FName}_2.save"
    } else {
        Write-Host "ERROR: No _1.save or _2.save found for File2!"; Read-Host; exit
    }
} else {
    if (Test-Path "$sourceDir\${FName}_2.save") {
        $File2 = Get-Item "$sourceDir\${FName}_2.save"
    } else {
        Write-Host "ERROR: ${FName}_2.save not found for File2!"; Read-Host; exit
    }
}

Write-Host "File1: $($File1.Name)"
Write-Host "File2: $($File2.Name)"
Write-Host ""

# --- Loop through target dir by unique base name ---

$processedNames = @()

Get-ChildItem -Path $targetDir | Where-Object {
    $_.Name -match '\.save$'
} | ForEach-Object {

    # Strip _1 or _2 suffix to get the base name shared by the pair
    $baseName = $_.BaseName -replace '_[12]$', ''

    # Skip if we already handled this base name
    if ($processedNames -contains $baseName) { return }
    $processedNames += $baseName

    Write-Host "--- Processing pair: $baseName ---"

    # Find File1 target: prefer .save, fallback to _1.save
    $f1Used1Fallback = $false
    $f1Target = Get-ChildItem -Path $targetDir | Where-Object { $_.Name -eq "$baseName.save" } | Select-Object -First 1

    if (-not $f1Target) {
        $f1Target = Get-ChildItem -Path $targetDir | Where-Object { $_.Name -eq "${baseName}_1.save" } | Select-Object -First 1
        if ($f1Target) { $f1Used1Fallback = $true }
    }

    if ($f1Target) {
        Write-Host "  Replacing (File1): $($f1Target.Name)"
        Copy-Item -Path $File1.FullName -Destination $f1Target.FullName -Force
    } else {
        Write-Host "  WARNING: No File1 target found for $baseName"
    }

    # Find File2 target:
    # If File1 was .save → look for _1.save (fallback _2.save)
    # If File1 was _1.save → look for _2.save
    if (-not $f1Used1Fallback) {
        $f2Target = Get-ChildItem -Path $targetDir | Where-Object { $_.Name -eq "${baseName}_1.save" } | Select-Object -First 1
        if (-not $f2Target) {
            $f2Target = Get-ChildItem -Path $targetDir | Where-Object { $_.Name -eq "${baseName}_2.save" } | Select-Object -First 1
        }
    } else {
        $f2Target = Get-ChildItem -Path $targetDir | Where-Object { $_.Name -eq "${baseName}_2.save" } | Select-Object -First 1
    }

    if ($f2Target) {
        Write-Host "  Replacing (File2): $($f2Target.Name)"
        Copy-Item -Path $File2.FullName -Destination $f2Target.FullName -Force
    } else {
        Write-Host "  WARNING: No File2 target found for $baseName"
    }
}

Write-Host ""
Write-Host "All done!"
Read-Host "Press Enter to close"
