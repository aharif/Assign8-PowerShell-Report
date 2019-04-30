Import-Module ActiveDirectory
$CSV = $args[0]
$CSV = Import-Csv "$CSV"
ForEach ($item In $CSV){
	New-ADGroup -Name $item.name -Description $item.description -GroupCategory $item.category -GroupScope $item.scope -Path $item.oupath
}