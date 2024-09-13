param (
	#User : xxx@xxx.com
	[Parameter(Mandatory=$true)][string]$user,
	[Parameter(Mandatory=$true)][string]$roleName
)

$subscriptionId = "Your Subscription ID"
$scope = "/subscriptions/$subscriptionId"

Connect-AzAccount -Identity

New-AzRoleAssignment -SignInName $user -RoleDefinitionName $roleName -Scope $scope
