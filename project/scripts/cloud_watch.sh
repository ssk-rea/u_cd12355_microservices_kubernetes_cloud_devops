aws iam attach-role-policy --role-name eksctl-my-cluster-nodegroup-my-nod-NodeInstanceRole-XbsEon87byjs --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy 

aws eks create-addon --addon-name amazon-cloudwatch-observability --cluster-name my-cluster