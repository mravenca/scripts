# Certificate management

#Define certs
[string[]]$CertList = @("D:\Psb\SA464CE.pfx","D:\Psb\ca_partner_4.cer") 


#Cycle through certs
foreach ($certificate in $CertList)
{
    $cerObject = null
    $log = ""
  	if ($certificate.Contains(".cer"))
  	{
      $cerObject = New-Object System.Security.Cryptography.X509Certificates.X509Certificate
      $cerObject.Import($certificate) | fl
      $cerObjectExpirationDate = $cerObject.GetExpirationDateString()

      write-output "Certificate", $certificate, "expires on ", $cerObjectExpirationDate
   	}
    else
    {
      $password = ConvertTo-SecureString -string "helloworld" -AsPlainText -Force
      $pfxObject = Get-PfxData -FilePath $certificate -Password $password | fl
    }
    
    #write-output $certificateObject
    
    #$expDate = $certificateObject.ExpirationDate
    #write-output expDate    
    # Check if expiration date is smaller than one month from now
    #if ($expDate -lt Today.adddays(30))
    #{
      # Make a note in logs
    #  write-output  "expiring cert" -red
    #}
    # Add to log
}	
    
    #Save log


# SIG # Begin signature block
# SIG # End signature block
