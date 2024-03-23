# GCP-cloud-resume-api

A project where I built and deployed a serverless API using Google Cloud Functions and Firestore, integrated with CLoud Build as CI/CD. Construct an API that can serve resume data in JSON format.

## Architecture Diagram

![Reference image](/images/architecture-image.png)

**Pre-requisites**

* A [Google Cloud Platform](https://cloud.google.com/?hl=en) account and a project
* [The Terraform CLI](https://developer.hashicorp.com/terraform/install)
* A text editor like [Visual Studio Code](https://code.visualstudio.com/download)

### 1.🌀To get started, set up your GCP and GitHub 

1. A project dn service account in GCP
2. A GitHub repository
3. A Firestore database

### 2. Clone the project repository to your local machine and change directory to the project directory

**Create the infrastructure using Terraform**

* provider.tf
* variables.tf
* terraform.tfvars
* main.tf

### 3. Create the function using Python

    * main.py
    * requirements.txt (define the dependencies - these will be installed when the function is deployed)

In the `main.py` you have to import `Flask` - used for web development, including the jsnoify method used in the script and `google-cloud-firestore` - used to interact with Firestore
`functions-framework=3.*` -The functions-framework is a set of libraries for writing lightweight, portable Python functions that can run in various environments, including Google Cloud Functions, your local development machine, or other cloud environments. It provides a consistent execution environment and request context, and allows you to focus on writing your function logic rather than worrying about the infrastructure.

### 4. Create the Cloud Build configuration file