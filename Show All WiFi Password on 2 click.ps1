$Profiles=@()
$Profiles +=(netsh wlan show profiles) | Select-String "\:(.+)$" | Foreach{$_.Matches.Groups[1].Value.Trim()}
$Profiles | Foreach{$SSID = $_ ; (netsh wlan show profile name="$_" key=clear)} |
            Select-String "Key Content\W+\:(.+)$" |
                Foreach{$pass=$_.Matches.Groups[1].Value.Trim(); $_} |
                    Foreach{[PSCustomObject]@{__________Wireless_Network_Names__________=$SSID;__________Passwords__________=$pass}}
                Format-Table -AutoSize
Start-Sleep -s 60