# 1) uninstall CDK
npm uninstall -g aws-cdk

# 2) install CDK
npm install -g aws-cdk

cdk --version

# 3) config CDK
aws configure

# 4) delete all stack with suffix name (`newopensearchdomaind`)
 for stack in $(aws cloudformation list-stacks --query
  "StackSummaries[?contains(StackName, 'newopensearchdomaind')].StackName" --output text);
   do aws cloudformation delete-stack --stack-name "$stack"; done
