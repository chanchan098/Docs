[Console]::InputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

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

    [Win32]::MessageBox([IntPtr]::Zero, "TAKE A BREAK!", "TIMES UP", 0x00000000 + 0x00000040 + 0x00001000)
}

Start-Countdown -Seconds 500
