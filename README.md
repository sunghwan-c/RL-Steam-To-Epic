
# RL Steam to Epic

A Windows powershell script to copy your Steam config (Video settings, settings, etc.) to your Epic Games Account(s)


**NOTE: YOU ONLY HAVE TO DO ALL THE STEPS BELOW ONCE. AFTER THAT, YOU CAN JUST RIGHT CLICK AND RUN THE POWERSHELL SCRIPT WHENEVER AND IT SHOULD SYNC EACH TIME. NO ADDITIONAL EDITING REQUIRED**
## Known Issues

• You might have to replay the tutorial on all your Epic Games accounts, but the settings will still transfer over!
## Prerequisites

• Make sure you've run the game at least once on the Epic Games Account(s) that you want to apply your config to

• Run Powershell as Administrator (from the Windows search bar) and run this command

`Set-ExecutionPolicy RemoteSigned` (This allows the script to actually run on your machine)
## How To Use

Download `RLConfigScript.ps1` and put it somewhere easy to access

Edit `RLConfigScript.ps1` with a text editor (You can use Notepad)

Where it says **YOURUSERNAME** you want to replace it with the username of your Windows account
```
# -----------------------------------------------
# CONFIG
# -----------------------------------------------
$sourceDir = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production"   # Directory to pick the 2 source files from
$targetDir = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveDataEpic\DBE_Production"   # Directory to replace files in
# -----------------------------------------------
```

Finally, just save the file, then right click it and click run with powershell.

If successful, your Epic Games account(s) should now have the exact same settings as your Steam settings!

***If for some forsaken reason you are using v1.0.0 instead v2.0.0, then follow the instruction in READMEv1.md instead of these instructions***