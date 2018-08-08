#!/bin/sh

docker build --rm -t lambda_count . --no-cache

docker run --rm  -e AWS_ACCESS_KEY_ID=xyz -e AWS_SECRET_ACCESS_KEY=aaa -e AWS_DEFAULT_REGION=us-east-1 lambda_count sh -c 'aws s3 cp bundle.zip s3://yogi-lambda-deployment/bundle.zip && aws lambda
update-function-code --function-name test-yogi  --s3-bucket yogi-lambda-deployment --s3-key bundle.zip'