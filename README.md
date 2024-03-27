# GCP-cloud-resume-api

A project where I built and deployed a serverless API using Google Cloud Functions and Firestore, integrated with Cloud Build as CI/CD to deploy functions on every push to GitHub automatically. An API that can serve resume data in JSON format. I used Terraform to manage and provision cloud infrastructure.

## Architecture Diagram

![Reference image](/images/architecture-image.png)

Reference website: <https://www.cloudresumeapi.dev>

**Pre-requisites**

* A [Google Cloud Platform](https://cloud.google.com/?hl=en) account and a project
* [The Terraform CLI](https://developer.hashicorp.com/terraform/install)
* The text editor I used is [Visual Studio Code](https://code.visualstudio.com/download)

### 1.🌀To get started, I set up your GCP and GitHub 

1. A project and service account in GCP
2. A GitHub repository
3. A Firestore database - set up a table named `Resumes` containing sample resume data

### 2. Create a JSON Resume

Use [this schema](https://jsonresume.org/schema/) to create your own JSON resume.

### 3. Clone the project repository to your local machine and change directory to the project directory

**Create the infrastructure using Terraform**

* `provider.tf`
* `variables.tf`
* `terraform.tfvars`
* `main.tf`

### 4. Create the function using Python

**Google Cloud Functions:** Fetch and return resume data based on an id. Utilize HTTP Trigger with anonymous access.

* `main.py`
* `requirements.txt` (define the dependencies - these will be installed when the function is deployed)

In the `main.py` you have to import `Flask` - used for web development, including the jsnoify method used in the script and `google-cloud-firestore` - used to interact with Firestore
`functions-framework=3.*` -The functions-framework is a set of libraries for writing lightweight, portable Python functions that can run in various environments, including Google Cloud Functions, your local development machine, or other cloud environments. It provides a consistent execution environment and request context, and allows you to focus on writing your function logic rather than worrying about the infrastructure.

### 5. Initialize the Terraform project

Once you have configured the project, you can upload the Terraform configuration to Google Cloud Platform by running the following command:

```
terraform plan
```

To check the changes that will be made to your infrastructure.

```
terraform apply
```

When prompted, review the changes and type `yes` to confirm that you want to apply the changes.

### 5. Create the Cloud Build for CI/CD :building_construction:

1. I authorized Cloud Build to access the GitHub repository
2. I created a trigger to build the function when a new commit is pushed to the repository
3. I created the cloudbuild.yaml file to define the build steps



### 6. Test the API

API URL: <https://europe-west2-cloud-resume-api-418008.cloudfunctions.net/cloudresumeapi-1>
Or open the terminal and run the following command:

```
curl https://europe-west2-cloud-resume-api-418008.cloudfunctions.net/cloudresumeapi-1
```