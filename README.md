# Terraform Remote Backend Setup

This project creates a **Remote Backend infrastructure** for Terraform using AWS S3 and DynamoDB. It allows you to store your Terraform state files remotely and lock them to prevent concurrent modifications.

---

## 📋 What This Project Does

Creates:
- **S3 Bucket** - Stores Terraform state files
- **DynamoDB Table** - Manages state locks (prevents conflicts)
- **Security Settings** - Versioning, encryption, and public access blocking

---

## 🚀 Quick Start

### Prerequisites
- AWS Account with credentials configured
- Terraform installed (v1.0+)
- AWS CLI configured

### Step 1: Clone the Repository
```bash
cd Terraform-Remote-Backend
```

### Step 2: Review Variables
Edit `variable.tf` if you want to change:
- AWS region
- S3 bucket name
- DynamoDB table name

### Step 3: Initialize Terraform
```bash
terraform init
```

### Step 4: Validate Configuration
```bash
terraform validate
```

### Step 5: Plan the Deployment
```bash
terraform plan
```

### Step 6: Apply the Configuration
```bash
terraform apply
```

### Step 7: Get the Outputs
```bash
terraform output
```

You'll see:
- S3 bucket name
- DynamoDB table name

---

## 📁 Project Structure

```
├── main.tf          # Main resource definitions (S3, DynamoDB)
├── variable.tf      # Input variables (region, bucket name, etc.)
├── output.tf        # Output values (bucket name, table name)
├── backend.tf       # Backend configuration (for remote state)
└── README.md        # This file
```

---

## ⚠️ Common Issues & Solutions

### Issue 1: "Reference to undeclared resource"
**Problem:** Error says `aws_s3_bucket.terraform_state` is not declared

**Solution:** Check if the S3 bucket resource is commented out in `main.tf`
```terraform
# ❌ WRONG (Commented out)
# resource "aws_s3_bucket" "terraform_state" {

# ✅ CORRECT (Uncommented)
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
```

### Issue 2: "AWS credentials not configured"
**Solution:**
```bash
aws configure
# Enter your Access Key ID
# Enter your Secret Access Key
# Enter your region (e.g., ap-southeast-1)
```

### Issue 3: "S3 bucket name already exists"
**Solution:** Change `s3_bucket_name` in `variable.tf` to a unique name:
```terraform
variable "s3_bucket_name" {
  default = "my-unique-terraform-backend-12345"
}
```

---

## 🔐 Security Features

✅ **Versioning** - Keeps old state file versions  
✅ **Encryption** - Uses AES256 encryption by default  
✅ **Public Access Blocked** - Prevents accidental public access  
✅ **DynamoDB Locking** - Prevents concurrent state modifications  

---

## 🗑️ Cleanup

To remove all resources:
```bash
terraform destroy
```

---

## 📝 Using This Backend

Once created, use this backend in other Terraform projects:

```terraform
terraform {
  backend "s3" {
    bucket         = "terraform-backend-demo-bucket-ashutosh"
    key            = "prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock-table-demo"
  }
}
```

---

## 📚 References

- [Terraform S3 Backend Documentation](https://www.terraform.io/language/settings/backends/s3)
- [AWS S3 Bucket Versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html)
- [DynamoDB State Locking](https://www.terraform.io/language/state/locking)
