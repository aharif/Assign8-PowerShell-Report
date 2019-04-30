Import-Module ActiveDirectory
$CSV = $args[0]
if (! $CSV) {
	Write-Host "Please format this command as 'AddUsersToGroup <csv file>'"
	Write-Host "CSV files must have the headers 'Username' and 'Groupname' with AD usernames and groupnames follwoing"
	exit
}
$csvlist = Import-Csv "$CSV"
foreach ($user in $csvlist) {
    $username = $user.username
    $firstname = $user.firstname
    $lastname = $user.lastname
    $description = $user.description
    $OUPATH = $user.oupath
    $password = $user.password
    $Action = $user.action

if ($Action -match "Add") {
	New-ADUser -name $username -GivenName $firstname -Surname $lastname -Description $description -Path $OUPATH -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force)
}

elseif ($Action -match "Remove") {
	Remove-ADUser -Identity $username}
}