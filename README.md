
# RL Steam to Epic

A Windows powershell script to copy your Steam config (Video settings, settings, etc.) to your Epic Games Account(s)

**NOTE: YOU ONLY HAVE TO DO ALL THE STEPS BELOW ONCE. AFTER THAT, YOU CAN JUST RIGHT CLICK AND RUN THE POWERSHELL SCRIPT WHENEVER AND IT SHOULD SYNC EACH TIME. NO ADDITIONAL EDITING REQUIRED**



## Known Issues

• You might have to replay the tutorial on all your Epic Games accounts, but the settings will still transfer over!
## Prerequisites
• Make sure you've run the game at least once on the Epic Games Account(s) that you want to apply your config to

• Run Powershell as Administrator (from the Windows search bar) and run this command

`Set-ExecutionPolicy RemoteSigned` (This allows the script to actually run on your machine)

• Go to your documents and find your Rocket League SaveData folder then go to DBE_Production inside of it (`C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\`)

• You will find (most likely) 2 files inside. One of them will end with **ONLY** `.save` or `_1.save`. I will be referencing this as **File1**. There will be a second file ending with `_2.save`. This will be referenced as **File2**. Save their **WHOLE** names on seperate notepad somewhere (The name, suffix, and file extension included)

**(IT IS IMPORTANT THAT YOU DO NOT MIX UP THESE FILES OR FILE EXTENSIONS)**

**NOTE: IF YOU HAVE MORE THAN 2 FILES INSIDE (LIKE 4 FILES FOR EXAMPLE), USE THE 2 FILES THAT WERE MOST RECENTLY MODIFIED**

• This spare notepad should look something like
```
File1 - 76561198223348464_1.save (Your File1 might not have _1.save, so it might look like 76561198223348464.save. THIS IS COMPLETELY FINE)
File2 - 76561198223348464_2.save
```

## How To Use

Download `RLConfigScript.ps1` and put it somewhere easy to access

Edit `RLConfigScript.ps1` with a text editor (You can use Notepad)

Where it says **YOURUSERNAME** you want to replace it with the username of your Windows account
```
# -----------------------------------------------
# CONFIG - Set these to your actual file paths
# -----------------------------------------------
$sourceFile1 = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\YOURFILENAME.save"
$sourceFile2 = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\YOURFILENAME_2.save"
$targetDir   = "C:\Users\YOURUSERNAME\Documents\My Games\Rocket League\TAGame\SaveDataEpic\DBE_Production"
# -----------------------------------------------
```

Where it says **YOURFILENAME** and **YOURFILENAME_2**, you want to replace the names with File1 and File2 in that order

So the script should look something like this

```
# -----------------------------------------------
# CONFIG - Set these to your actual file paths
# -----------------------------------------------
$sourceFile1 = "C:\Users\sunghwan-c\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\76561198223348464_1.save"
$sourceFile2 = "C:\Users\sunghwan-c\Documents\My Games\Rocket League\TAGame\SaveData\DBE_Production\76561198223348464_2.save"
$targetDir   = "C:\Users\sunghwan-c\Documents\My Games\Rocket League\TAGame\SaveDataEpic\DBE_Production"
# -----------------------------------------------
```
Finally, just save the file, then right click it and click run with powershell.

If successful, your Epic Games account(s) should now have the exact same settings as your Steam settings!
