source config/.env_azure
source config/.env_vm0

echo "deleting..."
echo $MY_RESOURCE_GROUP_NAME
echo $MY_VM_NAME

az vm delete -g $MY_RESOURCE_GROUP_NAME -n $MY_VM_NAME  --force-deletion no --yes