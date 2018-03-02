import-module solidfire

$sfCluster = Read-host("Enter a SolidFire cluster to connect to: ")
$creds = get-credential

$user = $creds.username
$password = ConvertTo-SecureString $creds.password -AsPlainText -Force
$cred = New-Object -TypeName system.Management.Automation.PSCredential -ArgumentList $user,$password

Set-SFLdapAuthentication `
    -AuthType SearchAndBind `
    -ServerURIs 'ldap://dc1.demo.netapp.com' `
    -UserSearchBaseDN "CN=Users,DC=demo,DC=netapp,dc=com" `
    -GroupSearchBaseDN "CN=Users,DC=demo,DC=netapp,dc=com" `
    -SearchBindDN "CN=Administrator,CN=Users,DC=demo,DC=netapp,DC=com" `
    -SearchBindPassword 'Netapp1!' `
    -UserSearchFilter "(&(objectClass=user)(sAMAccountName=%USERNAME%))"
