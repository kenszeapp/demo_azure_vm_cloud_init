VM_RG=aus-dev-rg
VM_NAME=dev-vm-20240702
VM_ADMIN_NAME=ubadmin
VM_SIZE=Standard_B1ms

# Gen cloud.config 
echo "Build init.yml"
cat init_template.yml | sed "s/{{ VM_NAME }}/$VM_NAME/g" > init.yml

echo "Creating VM..."
az vm create \
    --resource-group $VM_RG \
    --name $VM_NAME \
    --image Ubuntu2204 \
    --admin-username $VM_ADMIN_NAME \
    --custom-data init.yml \
    --generate-ssh-keys \
    --size Standard_B1ms \
	&& az vm open-port --port 443,943,1194,26080 --resource-group $VM_RG --name $VM_NAME