#USAGE: .\mon_mode.ps1 <MONITOR CONFIG MODE STRING>
#EXAMPLE: .\mon_mode.ps1 'L_P' #sets up 2 monitors to be landscape to the left, portrait to the right

#Don't change:
$mode = $args[0].ToUpper()

#USER SETTINGS/INSTRUCTIONS: 
#1. Download and install DisplayChanger (download from here: https://12noon.com/?page_id=80)
#2. Enable all monitors
#3. Run .\dc64cmd.exe -listmonitors and make note of the names of your monitors
#4. Based on the names of your monitors as defined in the output of step #3, set them below
$left_mon = '\\.\DISPLAY1'
$right_mon = '\\.\DISPLAY2'

#$left_mon = 'Generic PnP Monitor'
#$right_mon = '27GN950(DP)'

#5. Set Location of your install of DisplayChanger below
$dc = 'C:\Users\mikeev\Desktop\Tools\DisplayChanger\dc64cmd.exe'


#6. Modify to add more monitors (or rename/reorder)
$mon1 = $dc + ' -monitor="' + $left_mon + '"'
$mon2 = $dc + ' -monitor="' + $right_mon + '"'

#7. Define your modes below. The switch string (like 'L_L') is what you'll pass-in through the command-line
#Make careful note of the -rotate and -lx,-ty rotation and positioning values. 
#You'll need to play with this via trial and error to get them just right for your setup. 

switch ($mode)
{
    'L_L' #Landscape + Landscape (Extend)
    {
        $UWmon = $mon1 + ' -primary -more'
        $4Kmon = $mon2 + ' -secondary -rotate=up -lx=3840 -ty=-256 -apply'
        
    }
    'L_P' #Landscape + Portrait (Extend)
    {
        $UWmon = $mon1 + ' -primary -more'
        $4Kmon = $mon2 + ' -secondary -rotate=left -lx=3840 -ty=-1500 -apply'
        
    }
    'L_OFF' #Landscape + OFF
    {
        $UWmon = $mon1 + ' -primary -more'
        $4Kmon = $mon2 + ' -detach -apply'
        
    }
    'OFF_L' #OFF + Landscape
    {
        $UWmon = $mon1 + ' -detach -more'
        $4Kmon = $mon2 + ' -primary -rotate=up -apply'
        
    }
    'OFF_P' #OFF + Portrait
    {
        $UWmon = $mon1 + ' -detach -more'
        $4Kmon = $mon2 + ' -primary -rotate=left -apply'
        
    }
}

#8. Modify to add more monitors. 
#IMPORTANT: all initial monitors should have -more, and the final monitor should always have -apply
Write-Output $UWmon
Invoke-Expression $UWmon
Write-Output $4Kmon
Invoke-Expression $4Kmon
