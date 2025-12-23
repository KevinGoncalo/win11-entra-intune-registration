# 1. Check if Microsoft.Graph module is installed - if not install

if (-not (Get-Module -ListAvailable Microsoft.Graph)) {
    Install-Module Microsoft.Graph -Scope CurrentUser -AllowClobber -Force
}

# 2. Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# 3. Define User Details
$UserData = @{
    DisplayName         = "Portfolio User"
    UserPrincipalName   = "puser@kevshomelab.onmicrosoft.com"
    MailNickname        = "puser"
    UsageLocation       = "US"                     
    AccountEnabled      = $true
    PasswordProfile     = @{
        Password = "TemporaryPass123!"
        ForceChangePasswordNextSignIn = $true
    }
}

# 4. Create the User
try {
    $NewUser = New-MgUser @UserData
}
catch {
    Write-Error "Failed to create user. Error: $_"
}

