Get-ADComputer -Filter * -Properties * |select Name, Enabled, whenCreated, whenChanged, DistinguishedName | Export-CSV ADComputersList.csv -NoTypeInformation -Encoding UTF8
