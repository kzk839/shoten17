param (
	[Parameter(Mandatory=$true)][string]$user,
	[Parameter(Mandatory=$true)][string]$roleName
)

$subscriptionId = "Your Subscription ID"
$scope = "/subscriptions/$subscriptionId"

Connect-AzAccount -identity

Remove-AzRoleAssignment -signInName $user -RoleDefinitionName $roleName -Scope $scope