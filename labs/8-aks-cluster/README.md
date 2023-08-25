## To create a directory structure in the user's home directory for storing SSH keys associated with Azure Kubernetes Service (AKS) and Terraform.
```
mkdir -p $HOME/.ssh/aks-prod-sshkeys-terraform
```

## To generate SSH key pairs(Windows) for secure authentication in various systems.
```
ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f C:\Users\<username>\.ssh\aks-prod-sshkeys-terraform\aksprodsshkey -N mypassphrase
```

## To list the contents of a specific directory on a Unix-like operating system
```
$HOME/.ssh/aks-prod-sshkeys-terraform
```
