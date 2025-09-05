
source config/.env_azure
source config/.env_vm0

# this is failing for me, haven't looked into it
az vm extension set \
    --publisher Microsoft.Azure.ActiveDirectory \
    --name AADSSHLoginForLinux \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --vm-name $MY_VM_NAME

export IP_ADDRESS=$(az vm show --show-details --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_VM_NAME --query publicIps --output tsv)

ssh -o StrictHostKeyChecking=no $MY_USERNAME@$IP_ADDRESS