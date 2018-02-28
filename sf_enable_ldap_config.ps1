import-module solidfire

connect-SFCluster -Target sfdemo1 -username admin -password Netapp1!

Set-SFLdapAuthentication `
    -AuthType SearchAndBind `
    -ServerURIs 'ldap://dc1.demo.netapp.com' `
    -UserSearchBaseDN "DC=demo,DC=netapp,dc=com" `
    -SearchBindDN "CN=Administrator,CN=Users,DC=demo,DC=netapp,DC=com" `
    -SearchBindPassword 'Netapp1!' `
    -UserSearchFilter "(&(objectClass=user)(sAMAccountName=%USERNAME%))"
