# Guide to modify the application

## Contents

1. [Deployment Process](#deployment)
2. [Changes to Application and deployment details](#changes)

<a id="deployment"></a>

### Deployment Process

1. Create an ECR to store docker images.
    1. A repository named as `coworking` is created to store the build images.
    2. Build images are tagged incrementally.
    3. Each push to the codebase triggers the automatic codebuild process.
2. Ensure K8s EKS cluster is up and running.
    1. Required cluster
       configuration:  `name: my-cluster`, `region: us-east-1`, `nodegroup-name: my-nodes`, `node-type: t3.small` or
       higher, `nodes 1`, `nodes-min: 1`, `nodes-max: 2`
    2. There are 2 deployment manifests for postgres and coworking application.
    3. `replicas: 1` can be increased based on the requirements and cluster capacity.
3. Ensure CodeBuild pipeline is set up correctly for the CI process.
4. Start a Postgres Service on the K8s by updating `postgres-deployment.yaml`
    1. Update database name, username and password
    2. ```
       env:
        - name: POSTGRES_DB
          value: <your db_name>
        - name: POSTGRES_USER
          value: <your username>
        - name: POSTGRES_PASSWORD
          value: <your password>
       ```
5. Run the seed files for tables and data into the DB.
6. Ensure DB connectivity into the app.
7. Create ConfigMap and Secrets on the K8s.
    1. Remember to update the cluster IP address in the ConfigMap
    2. Update `DB_HOST: '<postgres service cluster IP address>'`
8. Create app deployment yaml manifest file.
9. Setup logging process using CloudWatch.
    1. Update the cluster nodegroup role name in `cloud_watch.sh` and run the commands.
10. Verify application by running curl commands in `verify_app_curl.sh`.
    1. Update the `BASE_URL`

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

## References

1. https://docs.aws.amazon.com/codebuild/latest/userguide/sample-github-pull-request.html
2. 