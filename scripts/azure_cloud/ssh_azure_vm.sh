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
echo $IP_ADDRESS
# > config/.env_vm_main  # (unsafe but convenient option here) overwrite with empty input and touch
touch .env_vm_main
echo "export IP_ADDRESS=$IP_ADDRESS" > config/.env_vm_tmp  # includes implicit newline
# connect w ssh key
ssh -i ~/.ssh/id_rsa $MY_USERNAME@$IP_ADDRESS
        # verify fingerprint for extra security from man-in-the-middle pwns
        #  check fingerprint via the host and compare to what reaches us:
        # ssh-keygen -lf ~/.ssh/id_rsa.pub | awk '{print $2}'



# success

# try launching remote ssh
# code --remote ssh-remote+$ip_address /home/$MY_USERNAME


