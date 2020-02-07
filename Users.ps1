#Steven Fosmark
#Script to automate user policy

$localusers = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount= 'True'"
$allowedusers = @()
$allowedadmins = @()
Write-Host "These users are currently active on the system:"
foreach($user in $localusers){
    Write-Host $user.Name
}
$currentUser = Read-Host "Type in your username (I need this so I don't accidentally lock you out)"
$allowedusers += $currentUser
$allowedadmins += $currentUser
#ask for allowed users
Write-Host "Type in allowed admins (Enter blank to end):"
while($uname = Read-Host) {
    if ($uname -eq "" -or $uname -eq $null) {break}
    $allowedusers += $uname
    $allowedadmins += $uname
}
Write-Host "Type in allowed standard users (Enter blank to end):"
while($uname = Read-Host) {
    if ($uname -eq "" -or $uname -eq $null) {break}
    $allowedusers += $uname
}
$badusers = @()
$notadmin = @()
$localadmins = NET LOCALGROUP Administrators
foreach($user in $localusers){
    #compare against list of allowed users
    if(-not ($allowedusers -contains $user.Name) -and -not($user.Name -eq "Guest" -or $user.Name -eq "xGuest" -or $user.Name -eq "Administrator" -or $user.Name -eq "xAdministrator")){
        $badusers += $user
    }
    if(-not ($allowedadmins -contains $user.Name) -and -not ($badusers -contains $user) -and ($localadmins -contains $user.Name) -and -not($user.Name -eq "Guest" -or $user.Name -eq "xGuest" -or $user.Name -eq "Administrator" -or $user.Name -eq "xAdministrator")){
        $notadmin += $user
    }
}
#ask
Write-Host "The following users are not allowed on the system:"
foreach($user in $badusers){
    Write-Host $user.Name
}
$confirm = Read-Host "Confirm Delete [y/n]"
if($confirm -eq "n" -or $confirm -eq "N"){
    Write-Host "Type more carefully next time"
    exit
}
#delete users
foreach($user in $badusers){
    NET USER $user.name /DELETE
}

#ask
Write-Host "The following users are not allowed admins:"
foreach($user in $notadmin){
    Write-Host $user.Name
}
$confirm = Read-Host "Confirm Demotion [y/n]"
if($confirm -eq "n" -or $confirm -eq "N"){
    Write-Host "Type more carefully next time"
    exit
}
#demote
foreach($user in $notadmin){
    NET LOCALGROUP Administrators $user.name /DELETE
}

#set password and enable all good accounts
$localusernames = @() #because I'm bad at organization
foreach($user in $localusers){
    $localusernames += $user.name
}
foreach($user in $allowedusers){
    if(-not ($localusernames -contains $user)){
        NET USER $user /ADD
    }
    if(($allowedadmins -contains $user) -and -not($localadmins -contains $user)){
            NET LOCALGROUP Administrators $user /ADD
        }
    if($user -ne $currentUser){
        NET USER $user P@ssw0rdsAreC00l!
    }
}

#Getting all local accounts again because I'm really bad at organization
$localusers = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount= 'True'"

foreach($user in $localusers){
    if($user.name -ne $currentUser){
        $user.Disabled = 0
        $user.Lockout = 0
        $user.PasswordExpires = 1
        $user.PasswordRequired = 1
        $user.Put()
    }
    if($user.Name -eq "Guest" -or $user.Name -eq "xGuest" -or $user.Name -eq "Administrator" -or $user.Name -eq "xAdministrator"){
        $user.Disabled = 1
        $user.Put()
    }
}