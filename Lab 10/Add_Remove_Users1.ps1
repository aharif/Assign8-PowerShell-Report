Import-Module ActiveDirectory

$CSV = $args[0]

$csvlist = Import-Csv "$CSV"

foreach ($user in $csvlist) {

    if ($user.action -match "Add") {
	    New-ADUser -name $user.username -GivenName $user.firstname -Surname $user.lastname -Description $user.description -Path $user.oupath -AccountPassword (ConvertTo-SecureString -AsPlainText $user.password -Force)

    } elseif ($user.action -match "Remove") {
	    Remove-ADUser -Identity $user.username
    }
}