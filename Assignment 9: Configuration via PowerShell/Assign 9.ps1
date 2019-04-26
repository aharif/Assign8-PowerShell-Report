$Environment = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"



if ((Get-ItemProperty -Path $Environment) -match "LM_LICENSE_FILE") {

    

	$some = Get-ItemProperty -Path $Environment
  
  
	write-host " "
    
	write-host "The Registry Key exists in the system"
 
   
    
	$valueexists = ($some.LM_LICENSE_FILE) -match "27000@test.university.edu"
  
  
	if (-Not $valueexists) {


		write-host " "

		write-host "The key value doesn't exist in the system"
        
		write-host "Adding key value in the system"

     
   
		$some.LM_LICENSE_FILE += ", 27000@test.university.edu"
        
		Set-ItemProperty -Path $Environment -Name LM_LICENSE_FILE -Value $some.LM_LICENSE_FILE

 
   
	}else { 
    
		write-host " "
        
		write-host "The key value" $some.LM_LICENSE_FILE "exist in the system "
     
	}
    


} else {
    
	write-host " "
    
	write-host "The key doesn't exist in the system"
    
	write-host "Creating Registry key now"
    
 
   
	New-ItemProperty -Path $Environment -Name "LM_LICENSE_FILE" -Value "27000@test.university.edu" -PropertyType "String"
  
}






