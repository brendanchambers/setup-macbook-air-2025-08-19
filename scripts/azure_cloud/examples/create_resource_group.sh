export RANDOM_SUFFIX=$(openssl rand -hex 3)
export REGION="eastus2"
export MY_RESOURCE_GROUP_NAME="myResourceGroupVM$RANDOM_SUFFIX"
echo $MY_RESOURCE_GROUP_NAME

az group create --name $MY_RESOURCE_GROUP_NAME --location $REGION  # just need to run this once though
# todo save the returned json, which will look like e.g.

# {
#   "id": "/subscriptions/391890ff-8ece-4428-b181-6b323132f793/resourceGroups/myResourceGroupVMeb6bf8",
#   "location": "eastus2",
#   "managedBy": null,
#   "name": "myResourceGroupVMeb6bf8",
#   "properties": {
#     "provisioningState": "Succeeded"
#   },
#   "tags": null,
#   "type": "Microsoft.Resources/resourceGroups"
# }



# I manually delete these once in a while for now, while learning
