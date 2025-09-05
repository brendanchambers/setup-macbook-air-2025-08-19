

az vm start --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_VM_NAME


az vm stop --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_VM_NAME


# delete a resource group
az group delete --name myResourceGroupVM9b9095

# delete a vm (allow graceful delete; do not prompt for confirmation)
az vm delete -g $MY_RESOURCE_GROUP_NAME -n $MY_VM_NAME  --force-deletion no --yes


# connect w ssh key
ssh -i ~/.ssh/id_rsa azureuser@10.111.12.123
# verify fingerprint
ssh-keygen -lf /etc/ssh/ssh_host_ecdsa_key.pub | awk '{print $2}'
