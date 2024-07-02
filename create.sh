# replace your parameter.
VM_RG=aus-dev-rg
VM_NAME=dev-vm-20240702-test
VM_ADMIN_NAME=ubadmin
VM_SIZE=Standard_B1ms

# Gen cloud.config 
echo "Build init.yml"
cat init_template.yml | sed "s/{{ VM_NAME }}/$VM_NAME/g" > init.yml

echo "Creating VM $VM_NAME in $VM_RG..."
az vm create \
    --resource-group $VM_RG \
    --name $VM_NAME \
    --image Ubuntu2204 \
    --admin-username $VM_ADMIN_NAME \
    --custom-data init.yml \
    --generate-ssh-keys \
    --size Standard_B1ms \
	&& echo "Add open-port" \
	&& az vm open-port --port 443,943,1194,26080 --resource-group $VM_RG --name $VM_NAME \
	&& echo "setup done. Get ssh key ~/.ssh/id_rsa and id_rsa.pub"    
	
 
