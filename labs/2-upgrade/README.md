# Assuming you have joined a new project or company, and they are currently using terraform version 2.0.0. Now, they want to migrate their code to the latest version (3.6.6).

## Let's say they have a Virtual Machine in the production Azure environment, and you have a lab environment (development environment) where you can modify and test your script.

## Refer: [old.tf](vm_2_0.tf) file

## Refer: [Authenticating to Azure using a Service Principal and a Client Secret](https://registry.terraform.io/providers/hashicorp/azurerm/2.0.0/docs/guides/service_principal_client_secret)

To add service principal permissions to an Azure subscription, you need to grant the necessary role to the service principal at the subscription level. The service principal can then access and manage resources within the subscription based on the assigned role.

Here are the steps to add service principal permissions to an Azure subscription:

1. Register the Application and Get the Client ID and Client Secret:

  * First, you need to register an application in Azure Active Directory (AD) and obtain the client ID and client secret (or certificate) for the service principal. This step is typically performed through the Azure portal or using Azure CLI/PowerShell.
1. Assign a Role to the Service Principal:

  * Once you have the client ID and client secret, sign in to the Azure portal (or use Azure CLI/PowerShell) with an account that has sufficient permissions to manage roles in the subscription.
  * Go to the Azure portal and navigate to your subscription.
  * Under the "Access control (IAM)" tab, click on "Add a role assignment."
  * In the "Add role assignment" window, select the desired role from the list (e.g., "Contributor" for full access or a custom role with specific permissions).
  * In the "Assign access to" field, search for the name of the service principal (it should appear as an application) and select it from the list.
  * Click "Save" to add the role assignment.
1. Verify Permissions:

  * After the role assignment is saved, the service principal will have the permissions associated with the assigned role within the subscription.
The service principal can now access and manage resources within the subscription based on the permissions granted by the assigned role. Keep in mind that granting excessive permissions to a service principal can be a security risk, so it's essential to assign roles with the least privilege required for the service principal's intended tasks.

Note: You can automate this process using Azure CLI or PowerShell scripts for bulk role assignments.
