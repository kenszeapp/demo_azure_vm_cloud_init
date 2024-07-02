# Deploy Azure VM with Openvpn and noVNC by Cloud-Init scirpt 

# How to use 

* Open you Azure Cloud shell and download this repo 

```
git clone https://github.com/kenszeapp/demo_azure_vm_cloud_init.git

cd demo_azure_vm_cloud_init

chmod +wx ./create.sh
```

## Modify the varibles like VM_RG, VM_NAME etc.

`nano ./create.sh`

## Deploy
```
./create.sh
```


## Use 
TODO


## Clean up resourse 
`az group delete --name YourResourceGroupName --yes`


## Notes

* The cloud init cannot use relative path. For example, curl download file cannot save to ~/docker-compose.yaml

* 
```
# Replace YourResourceGroupName with the actual name
rg_name="YourResourceGroupName"

# Get all resource IDs in the resource group
resource_ids=$(az resource list --resource-group "$rg_name" --query "[].id" --output tsv)

# Loop through each resource and delete it
while IFS= read -r resource_id; do
    az resource delete --ids "$resource_id" --yes
done <<< "$resource_ids"

# List items under resourse group
az resource list --resource-group "$rg_name" --query "[].{Name: name, Type: type}" --output table


 

```