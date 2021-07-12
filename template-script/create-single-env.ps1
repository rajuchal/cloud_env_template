$projectName = Read-Host -Prompt "Enter the some project/Resource Group name"
$templateFile = Read-Host -Prompt "Enter the full path of template file location"
$parameterFile = Read-Host -Prompt "Enter the full path of parameter file location"
$current_datetime=Get-Date -Format "MMddyyyy_HHmmss"
$resourceGroupName = "${projectName}_rg_${current_datetime}"

New-AzResourceGroup -Name $resourceGroupName -Location "East US"

New-AzResourceGroupDeployment `
	-ResourceGroupName $resourceGroupName `
	-TemplateFile $templateFile `
	-TemplateParameterFile $parameterFile `
	-Verbose

