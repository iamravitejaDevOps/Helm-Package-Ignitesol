# README.md

I have deployed a Nike-app Front end based Application 

- It has 8 replicas running
- i have implemented Pod Disruption Budget available at least 5 pods
- Implemented a Priority class for pods
- Added a ECR read policy and attach to EKS cluster  easily pull docker image to cluster
- I have write Multistage Docker file Deployed through Nginx
- Bash script init.sh
    - to get a s3 bucket and dynamodb statelock
    
    ```python
    
    cd infra/
    
    bash init.sh
    ```
    
- The Terraform Infra
    - provider
    - backend for statemanagement
    - Network like VPC,Subnets,Nat,Eip,Route Table,RouteTable Association,
    - ECR
    - EKS cluster with Node group Attached Necessary Policies
    - 

```python
terraform init
terraform fmt
terraform validate
terraform paln
terraform apply 

```

Login to ECR:

```python
aws ecr get-login-password \
--region us-east-1 | docker login \
--username AWS \
--password-stdin 061039803094.dkr.ecr.us-east-1.amazonaws.com

```

Build The Docker image

```python
docker build -t sample-test .

docker tag sample-test  \
<accountid>.dkr.ecr.us-east-1.amazonaws.com/ignite-sol:latest

docker push \
<accountid>.dkr.ecr.us-east-1.amazonaws.com/ignite-sol:latest

# i am using mac i have issue architecture mine ARM so i use this comamand
docker buildx build --platform linux/amd64 -t <accountid>.dkr.ecr.us-east-1.amazonaws.com/ignite-sol:latest --push .
```

Connect with kubernetes Cluster

```python

aws eks update-kubeconfig \
--region us-east-1 \
--name ignite_sol_cluster

```

helm command to install 

```python
cd helm/

helm install ignite-sol . --namespace default

```
