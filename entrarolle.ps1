# Install the module.
# Install-Module Microsoft.Graph -Scope CurrentUser

# The tenant ID
$TenantId = "Your Tenant ID"
$automationId = "Your Automation Account MID Object ID"

# # The name of the app role that the managed identity should be assigned to.
$appRoleName = "User.Read.All"

Connect-MgGraph -TenantId $TenantId -Scopes 'Application.Read.All','AppRoleAssignment.ReadWrite.All'

# Get Microsoft Graph app's service principal and app role.
$serverApplicationName = "Microsoft Graph"
$serverServicePrincipal = (Get-MgServicePrincipal -Filter "DisplayName eq '$serverApplicationName'")
$serverServicePrincipalObjectId = $serverServicePrincipal.Id

$appRoleId = ($serverServicePrincipal.AppRoles | Where-Object {$_.Value -eq $appRoleName }).Id

# Assign the managed identity access to the app role.
New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $serverServicePrincipalObjectId -PrincipalId $automationId -ResourceId $serverServicePrincipalObjectId -AppRoleId $appRoleId