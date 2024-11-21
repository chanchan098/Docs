[Console]::InputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
#2024-11-21
#count: 19
#========================================================================
$filePath = "D:\liaoyj\Developer\counting.ps1"
$msgs = @("STOP: 0x00000024 (0x00190203,0x8A5FC900,0xC0000102,0x00000000)","The program can't start because MSVCP110.dll is missing from your computer. Try reinstalling the program to fix this problem.")
$MdateLine = 2
$MCountLine = 3

# to read date written down
$content = Get-Content $filePath
$dateLine = (Get-Content $filePath)[$MdateLine]
$prevDate = $dateLine.Substring(1)

$MDate = $prevDate
$curDate = (Get-Date).ToString("yyyy-MM-dd")

$DPrevDate = [DateTime]::Parse($prevDate)
$DCurDate = [DateTime]::Parse($curDate)

# to replace a new date
if ($DPrevDate -lt $DCurDate) {
    $MDate = $curDate
    $content[$MdateLine] = $content[$MdateLine] -replace $prevDate, $curDate
    $content | Set-Content $filePath

    # to reset count
    $countLine = (Get-Content $filePath)[$MCountLine]
    $curCount = $countLine.Substring(8)

    $curCountInt = [int]$curCount
    $newTime = $curCountInt + 1
    $content[$MCountLine] = $content[$MCountLine] -replace $curCount, 0
    $content | Set-Content $filePath
}


# to replace a new count
$content = Get-Content $filePath

$countLine = (Get-Content $filePath)[$MCountLine]
$curCount = $countLine.Substring(8)
$curCountInt = [int]$curCount
$newCount = $curCountInt + 1

$content[$MCountLine] = $content[$MCountLine] -replace $curCount, $newCount
$content | Set-Content $filePath
Write-Host $MDate " count:" $newCount


function Start-Countdown {
    param (
        [int]$Seconds = 500
    )
    for ($i = $Seconds; $i -ge 0; $i--) {
        Write-Host "Rest of time: $i seconds" -NoNewline
        Start-Sleep -Seconds 1
        Write-Host "`r" -NoNewline
    }

    Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class Win32 {
        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern int MessageBox(IntPtr hWnd, String text, String caption, uint type);
    }
"@
    $msg = $msgs | Get-Random
    [Win32]::MessageBox([IntPtr]::Zero, $msg, "System message", 0x00000000 + 0x00000010)

}

Start-Countdown -Seconds 500
