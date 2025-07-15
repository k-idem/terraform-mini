# Terraform S3 Bucket Demo (with Remote Backend)

This mini-project uses **Terraform** to provision an **S3 bucket** in AWS, tag it, and configure remote state storage using that same bucket. All actions are automated using CLI and IaC principles.

---

## Tech Used

- Terraform
- AWS CLI
- IAM User with programmatic access
- Remote backend (S3 state file)
- WSL Ubuntu (Terraform run environment)

---

## What It Does

- Creates a tagged S3 bucket in AWS
- Stores the Terraform state remotely in that bucket
- Demonstrates full lifecycle: `plan`, `apply`, and `destroy`
- Automatically names buckets using timestamps to avoid conflicts

---

## Project Structure

.
├── main.tf
├── variables.tf
├── backend.tf
├── .gitignore
├── images/
│ ├── terraform_plan_output.png
│ ├── terraform_apply_output.png
│ ├── s3_bucket_in_console.png
│ └── terraform_destroy_output.png
└── README.md

php
Copy
Edit

---

## How to Run

> You must have AWS CLI and Terraform installed, and your AWS credentials configured.

```bash
# Set environment variables
export AWS_REGION="us-east-1"
export MY_BUCKET="kidem-terraform-demo-$(date +%s)"

# Disable backend first to create the bucket
mv backend.tf backend.tf.disabled

terraform init
terraform plan -var="bucket_name=$MY_BUCKET" -var="region=$AWS_REGION"
terraform apply --auto-approve -var="bucket_name=$MY_BUCKET" -var="region=$AWS_REGION"

# Re-enable backend
mv backend.tf.disabled backend.tf
terraform init -backend-config="bucket=$MY_BUCKET" -backend-config="region=$AWS_REGION"

# Destroy resources (bucket must be empty!)
terraform destroy --auto-approve -var="bucket_name=$MY_BUCKET" -var="region=$AWS_REGION"

📸 Screenshots
* [Terraform Plan Output](images/terraform_plan_output.png)
* [Terraform Apply Output](images/terraform_apply_output.png)
* [S3 Bucket in AWS Console](images/s3_bucket_in_console.png)
* [Terraform Destroy Output](images/terraform_destroy_output.png)

Author
Kenneth Idem
github.com/k-idem
