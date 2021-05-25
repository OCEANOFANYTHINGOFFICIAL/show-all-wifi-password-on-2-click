# Show All Wifi Passwords On 2 Click
This is a Windows PowerShell Script That Shows All Wifi Passwords With Just 2 Clicks.  
To Run It You Have To Right Click on The File With .ps1 Extention And Click On 'Run With Powershell' Option.Then It Will Ask For Execution Policy.Type 'a' And Hit Enter Thats It.
After That It Will Show All Wifi Passwords In A PowerShell Window.
<br>
<br>
This Is One Of The Rarest Shell Script In The World. It Can Recover All Wifi Passwords
 Connected To Your System

# If You Dont Want To Download, Then Just Copy And Paste The Following Code In Notepad And Save It with .ps1 Extention.

```shell
$Profiles=@()
$Profiles +=(netsh wlan show profiles) | Select-String "\:(.+)$" | Foreach{$_.Matches.Groups[1].Value.Trim()}
$Profiles | Foreach{$SSID = $_ ; (netsh wlan show profile name="$_" key=clear)} |
            Select-String "Key Content\W+\:(.+)$" |
                Foreach{$pass=$_.Matches.Groups[1].Value.Trim(); $_} |
                    Foreach{[PSCustomObject]@{__________Wireless_Network_Names__________=$SSID;__________Passwords__________=$pass}}
                Format-Table -AutoSize
Start-Sleep -s 60
```
# Disclaimer
This Is Not A Toy. So Dont Play With It. I will not responsible for any misuse of It.
