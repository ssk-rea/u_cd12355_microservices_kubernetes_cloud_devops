# Guide to modify the application

## Contents
1. [Deployment Process](#deployment)
2. [Changes to Application and deployment details](#changes)


<a id="deployment"></a>
### Deployment Process

1. Create an ECR to store docker images.
2. Ensure K8s EKS cluster is up and running.
3. Ensure CodeBuild pipeline is set up correctly for the CI process.
4. Start a Postgres Service on the K8s.
5. Run the seed files for tables and data into the DB.
6. Ensure DB connectivity into the app.
7. Create ConfigMap and Secrets on the K8s.
8. Create app deployment yaml file.
9. Setup logging process using CloudWatch.
10. Verify application by running curl commands.

<a id="changes"></a>
### Changes to Application and deployment details

#### 1. Documentation relevant commands?

1. ``` create_eks.sh ``` helps to create and delete a K8s cluster.
2. ``` create_db.sh ``` helps to run K8s manifest for DB setup.
3. ``` insert_data.sh ``` helps to insert tables and data into the DB.
4. ``` set_env_variables.sh ``` exports relevant environment variables to test the app.
5. ``` build_app.sh ``` helps to build and run the app locally.
6. ``` deploy_app.sh ``` helps to deploy the app on a K8s cluster.
7. ``` verify_app_curl.sh ``` helps to verify whether the app is running as expected on the K8s cluster.
8. ``` cloud_watch.sh ``` helps to create CloudWatch logging capabilities.


#### 2. How can the application deployment process be improved?

1. Implement Terraform code to create the cloud resources:
   1. ECR
   2. EKS
   3. IAM roles
2. Create a Helm chart for the K8s manifest files
   1. Postgres deployment and service
   2. ConfigMap and secrets
   3. App deployment YAML file
3. Leverage more CodeBuild features for automation.
4. Adopt ArgoCD for continuous deployment.

#### 3. List of parameters to optimize

1. Identify the compute requirements and limit the resources for APIs.
2. Improve the logs for the application.
3. Robust K8s secrets.
4. Automate DB initialization process when the pods restart.
5. Parameterize the app deployment file.