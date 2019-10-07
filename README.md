# Cloudformation Templates

## Precautions
Cloudformation deployments are a very destructive process if wrongly done.  We recommend setting the target environment as a fixed profile in the shell environment to avoid typing the profile with every deployment command.  This can also done for the target region as our current region is only Singapore with very few deployments to North Virginia concerning ACM.
```
export AWS_PROFILE=sampleprofile
export AWS_DEFAULT_REGION=ap-southeast
```

## Some Deployment Commands using AWS CLI

### IAM
```shell
aws cloudformation deploy --stack-name=IAM --template-file templates/iam.yml --capabilities CAPABILITY_NAMED_IAM --profile=sampleprofile --region=ap-southeast-1
```

### Cognito
```shell
aws cloudformation deploy --stack-name Cognito --template-file templates/cognito.yml --parameter-overrides IAMStackName=IAM --capabilities CAPABILITY_NAMED_IAM --profile=sampleprofile --region=ap-southeast-1
```

### API Gateway
```shell
aws cloudformation deploy --stack-name APIGateway --template-file templates/apigateway.yml --parameter-overrides ApiName=sampleapp ApiDescription="Application APIs" WebSocketName=sampleapp-websocket WebSocketDescription="Application WebSocket" CognitoStackName=Cognito --profile=sampleprofile --region=ap-southeast-1
```