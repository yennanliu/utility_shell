# 1) remove resource group
#az group delete --name  database-resources --yes --no-wait
az group delete --name  <resource_name> --yes --no-wait


# 2) get az password
az ad sp create-for-rbac --name "github-actions-acr" \
                        --role contributor \
                        --scopes /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP> \
                        --sdk-auth
# 3) get  AZURE_ACR_USERNAME, AZURE_ACR_PASSWORD
az acr credential show --name <your_acr_name>
