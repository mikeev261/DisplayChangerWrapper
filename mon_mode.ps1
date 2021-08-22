$mode = $args[0].ToUpper()

$dc = 'C:\Users\mikeev\Desktop\Tools\DisplayChanger\dc64cmd.exe'
$left_mon = $dc + ' -monitor="\\.\DISPLAY2"'
$right_mon = $dc + ' -monitor="\\.\DISPLAY1"'


switch ($mode)
{
    'L_L' #Landscape + Landscape (Extend)
    {
        $UWmon = $left_mon + ' -primary -more'
        $4Kmon = $right_mon + ' -secondary -rotate=up -lx=3840 -ty=-256 -apply'
        
    }
    'L_P' #Landscape + Portrait (Extend)
    {
        $UWmon = $dc + ' -monitor="\\.\DISPLAY2" -primary -more'
        $4Kmon = $dc + ' -monitor="\\.\DISPLAY1" -secondary -rotate=left -lx=3840 -ty=-1500 -apply'
        
    }
    'L_OFF' #Landscape + OFF
    {
        $UWmon = $dc + ' -monitor="\\.\DISPLAY2" -primary -more'
        $4Kmon = $dc + ' -monitor="\\.\DISPLAY1" -detach -apply'
        
    }
    'OFF_L' #OFF + Landscape
    {
        $UWmon = $dc + ' -monitor="\\.\DISPLAY2" -detach -more'
        $4Kmon = $dc + ' -monitor="\\.\DISPLAY1" -primary -rotate=up -apply'
        
    }
    'OFF_P' #OFF + Portrait
    {
        $UWmon = $dc + ' -monitor="\\.\DISPLAY2" -detach -more'
        $4Kmon = $dc + ' -monitor="\\.\DISPLAY1" -primary -rotate=left -apply'
        
    }
}


Write-Output $UWmon
Invoke-Expression $UWmon
Write-Output $4Kmon
Invoke-Expression $4Kmon
