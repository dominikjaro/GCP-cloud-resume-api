# Create a zip file of the function 

data "archive_file" "cloudfunction_zip" {
  type      = "zip"
  source_dir = "${path.module}/../function"
  output_file_mode = "0666"
  output_path = "${path.module}/../infra/function.zip"
}

# Create the Cloud Storage bucket to store the code
resource "google_storage_bucket" "resume_function_bucket" {
  name = "resume-function-bucket"
  location = var.gcp_region
  storage_class = "REGIONAL"
}

# Upload the zip file to the bucket
resource "google_storage_bucket_object" "cloudfunction_zip" {
  name = "function.zip" 
  source = var.zip_file
  bucket = google_storage_bucket.resume_function_bucket.name
}

# Create the Cloud Function
    # Deploy the function
resource "google_cloudfunctions_function" "cloudresumeapi_function" {
  name = "cloudresumeapi"
  runtime = "python39"
  entry_point = "get_resume"
  source_archive_bucket = google_storage_bucket.resume_function_bucket.name
  source_archive_object = var.zip_file
  max_instances = 10
    available_memory_mb = 128
    timeout = 3
    trigger_http = true
}

# Make the function publicly accessible
resource "google_cloudfunctions_function_iam_member" "public_access_function" {
  project = var.gcp_project
  region = var.gcp_region
  cloud_function = google_cloudfunctions_function.cloudresgit umeapi_function.name
  role  = "roles/cloudfunctions.invoker"
  member = "allUsers"
}


# Just testing if the Cloud Build works fine
resource "google_storage_bucket_object" "image"{
  name = "architecture-image.png"
  source = "../images/architecture-image.png"
  bucket = google_storage_bucket.resume_function_bucket.name
} 