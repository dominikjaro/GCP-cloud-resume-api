# GCP-cloud-resume-api
A project where built and deployed a serverless API using Google Cloud Functions and Firestore, integrated with GitHub Actions. Construct an API that can serve resume data in JSON format.


### Architecture Diagram


Pre-requisites:

* A [Google Cloud Platform](https://cloud.google.com/?hl=en) account and a project
* [The Terraform CLI](https://developer.hashicorp.com/terraform/install)
* A text editor like [Visual Studio Code](https://code.visualstudio.com/download)


Create the infra using Terraform
    provider.tf
    variables.tf
    terraform.tfvars
    main.tf

Create the function using Python
    main.py
    requirements.txt (define the dependencies - these will be installed when the function is deployed)

    Flask - used for web development, including the jsnoify method used in the script
    google-cloud-firestore - used to interact with Firestore

    functions-framework=3.* -The functions-framework is a set of libraries for writing lightweight, portable Python functions that can run in various environments, including Google Cloud Functions, your local development machine, or other cloud environments. It provides a consistent execution environment and request context, and allows you to focus on writing your function logic rather than worrying about the infrastructure.


Main.tf explanation:
   1. I create the zip file that will be uploaded to the Cloud Storage. This zip file contains the Python script and the dependencies defined in the requirements.txt file. 
    The ouput_file_mode = "0666"defines the permissions for the zip file. Everyone can write and read, but execute.

    2. I create the bucket and upload the zip file as an object

    3. I create the Cloud Function and deploy it.
    runtime = "python39" - The runtime attribute in a google_cloudfunctions_function resource specifies the runtime environment in which the Cloud Function will be executed.

In your case, runtime = "python39" means that your Cloud Function will be executed in a Python 3.9 environment. This means that your function's code should be written in Python 3.9, and it will have access to the standard library and other features provided by Python 3.9.

entry_point = "get_resume" - The entry_point attribute in a google_cloudfunctions_function resource specifies the name of the function to execute when the Cloud Function is triggered.

In your case, entry_point = "get_resume" means that the function named get_resume in your source code will be executed whenever the Cloud Function is triggered.

For HTTP triggers, like in your case (since trigger_http = true), the function should accept two arguments: a Flask request object and a context object. The request object contains data about the incoming HTTP request, and the context object contains data about the Cloud Function itself.


available_memory_mb = 128: This sets the amount of memory available to the function during execution. The value is specified in megabytes. In this case, the function will have 128 MB of memory available. More memory means more CPU available for the function.

timeout = 3: This sets the maximum amount of time that the function is allowed to respond before it is terminated. The value is specified in seconds. In this case, if the function does not complete execution and respond within 3 seconds, it will be terminated.

 