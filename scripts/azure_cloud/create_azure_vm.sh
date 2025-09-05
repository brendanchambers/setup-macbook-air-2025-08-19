source config/.env_azure

export RANDOM_SUFFIX=$(openssl rand -hex 3)
export REGION=$REGION
echo $MY_RESOURCE_GROUP_NAME


export MY_VM_NAME="myVM$RANDOM_SUFFIX"
# create the vm
#   (we want to delete all attached resources when deleting vm)
az vm create \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --name $MY_VM_NAME \
    --image Ubuntu2404 \
    --size Standard_B1s \
    --public-ip-sku Standard \
    --os-disk-delete-option Delete \
    --data-disk-delete-option Delete \
    --nic-delete-option Delete \
    --admin-username $MY_USERNAME \
    --generate-ssh-keys



# example return json:

# {
#   "fqdns": "",
#   "id": "/subscriptions/391890ff-8ece-4428-b181-6b323132f793/resourceGroups/myResourceGroupVM9b9095/providers/Microsoft.Compute/virtualMachines/myVM7b20e7",
#   "location": "eastus2",
#   "macAddress": "7C-1E-52-ED-45-EA",
#   "powerState": "VM running",
#   "privateIpAddress": "10.0.0.4",
#   "publicIpAddress": "135.119.165.245",
#   "resourceGroup": "myResourceGroupVM9b9095"
# }



# TODO write metadata to config/.env_vm_tmp




# you can check on resources here: https://portal.azure.com/#view/Microsoft_Azure_ComputeHub/ComputeHubMenuBlade/~/virtualMachinesBrowse
#.  I am currently stopping and deleting VMs manually from this portal

# SSH key files '/Users/bc/.ssh/id_rsa' and '/Users/bc/.ssh/id_rsa.pub' have been generated under ~/.ssh to allow SSH access to the VM.
# If using machines without permanent storage, back up your keys to a safe location.







# ---> example failure message
# azure.core.exceptions.HttpResponseError: (InvalidTemplateDeployment) The template deployment 'vm_deploy_zITDsgrSdIkxeC46hCSKkjzeKg29ooFs' is not valid according to the validation procedure. The tracking id is 'dcc0eb8f-d907-4e0e-a2a3-e799a138714e'. See inner errors for details.
# Code: InvalidTemplateDeployment
# Message: The template deployment 'vm_deploy_zITDsgrSdIkxeC46hCSKkjzeKg29ooFs' is not valid according to the validation procedure. The tracking id is 'dcc0eb8f-d907-4e0e-a2a3-e799a138714e'. See inner errors for details.
# Exception Details:      (SkuNotAvailable) The requested VM size for resource 'Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available in location 'eastus2'. Please try another size or deploy to a different location or different zone. See https://aka.ms/azureskunotavailable for details.
#         Code: SkuNotAvailable
#         Message: The requested VM size for resource 'Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available in location 'eastus2'. Please try another size or deploy to a different location or different zone. See https://aka.ms/azureskunotavailable for details.







# example from portal
# Subscription: Azure subscription 1
# Resource group: Existing resource group 'myResourceGroupVM457386' will be reused for this VM.
# Virtual machine name: testtest-clone
# Region: eastus2
# Security type: Standard
# Image: ubuntu-24_04-lts server
# Size: Standard_B1s
# Username: azureuser (this can be updated in VM create experience later)
# Disks
# OS disk: OS disk cannot be reused but the OS Disk configuration will be copied over.
# OS disk size: 30 GiB
# OS disk type: Premium_LRS
# Delete with VM: Enabled
# Use managed disks: Enabled
# Networking
# Virtual network: Existing vnet 'vnet-eastus2' will be reused by this VM.
# Subnet: Existing subnet 'vnet-eastus2/snet-eastus2-1' will be reused by this VM.
# NSG: "testtest-nsg" will be reused. Same port rules will apply.
# Public IP: A new public IP will be created for this VM copy.