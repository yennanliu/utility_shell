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
   do 
      aws cloudformation delete-stack --stack-name "$stack"; 
   done

# 5) clear CDK cache
 rm -rf cdk.out/
 rm -rf node_modules/.cache/
 rm -rf ~/.cdk.staging/

 # Clear npm cache (if using npm)
 npm cache clean --force

 # Or clear yarn cache (if using yarn)
 yarn cache clean

 # Rebuild and redeploy
 cdk destroy --force
 cdk deploy --require-approval never

 If you want to be more targeted, you can also try:

 # Just clear the specific stack cache
 rm -rf cdk.out/
 cdk deploy --require-approval never --force
