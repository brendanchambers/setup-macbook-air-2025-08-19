# assume this script is run from top level
#   bash scripts/azure_cloud/<script>.sh
source config/.env_azure
source config/.env_vm0


# verify that the ssh connection works


######
# just use ssh key for auth, for now

export IP_ADDRESS=$(az vm show \
    --show-details \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --name $MY_VM_NAME \
    --query publicIps \
    --output tsv)
# connect w ssh key
ssh -i ~/.ssh/id_rsa $MY_USERNAME@$IP_ADDRESS
        # verify fingerprint for extra security from man-in-the-middle pwns
        #  check fingerprint via the host and compare to what reaches us:
        # ssh-keygen -lf ~/.ssh/id_rsa.pub | awk '{print $2}'



# success