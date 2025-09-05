source config/.env_azure
source config/.env_vm0

echo "deleting..."
echo $MY_RESOURCE_GROUP_NAME
echo $MY_VM_NAME

az vm delete -g $MY_RESOURCE_GROUP_NAME -n $MY_VM_NAME  --force-deletion no --yes


# Hmmm, this didn't delete the network security group or public ip address


echo "deleting network security group..."
echo "${MY_VM_NAME}NSG"

az network nsg delete \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --name "${MY_VM_NAME}" \
    --subscription $MY_SUBSCRIPTION


# todo probably don't want a public ip anyway
echo "deleting public ip address..."
echo "${MY_VM_NAME}PublicIP"

az network public-ip delete \
    --resource-group $MY_RESOURCE_GROUP_NAME \
     --name "${MY_VM_NAME}" \
     --subscription $MY_SUBSCRIPTION



