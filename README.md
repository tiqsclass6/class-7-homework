# Week 6 Homework - Chocolately/Terraform, VS Code Installation

![Terraform](https://img.shields.io/badge/Terraform-v1.9%2B-blueviolet?logo=terraform&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell&logoColor=white)
![Chocolatey](https://img.shields.io/badge/Chocolatey-Automated%20Install-orange?logo=windows&logoColor=white)
![Status](https://img.shields.io/badge/Setup-Complete-brightgreen?style=flat-square)

> 🚀 Copy-paste-ready instructions for installing and initializing **Terraform** on a Windows computer using **PowerShell + Chocolatey** — complete with “✅ do” vs. “🚫 don’t” guidance, editable files, commands, and verified references.

---

## ⚙️ What You’ll Use (✅) vs. What to Avoid (🚫)

### ✅ Use

* 💠 **PowerShell** or **Git Bash** (Run as Administrator)
* 🍫 **Chocolatey** — installs Terraform, Git, and VS Code
* 🧠 **VS Code / Notepad++** — for editing `.tf` files (**VS Code Preferred**)
* 🌀 **Git** — to clone repos and version control

### 🚫 Avoid

* 🧱 Manual *ZIP/MSI* installs of **Terraform**
* ✏️ Editing generated **Terraform** files (`.terraform/`, `.tfstate`, `.terraform.lock.hcl`)

---

## 🧩 Prerequisites

* 🪟 Windows 11 (64-bit)
* 🔑 PowerShell and Git Bash (Running as Administrator)
* 🌐 Internet access

> [!TIP]
> 🔸 Right-click PowerShell → **“Run as Administrator”** before starting.

---

## 🍫 Step 1 – Install Chocolatey (Updated Instructions)

Depending on your operating system, click on the blue word describing your operating system, which will contain a GitHub link.  
Click on the GitHub link that pops up, which should align with your operating system:

**Windows:** [https://github.com/rofoed01/scripts_chocolatey](https://github.com/rofoed01/scripts_chocolatey)  

### 🧩 Download and Extract

1. Click on the green **“Code”** button.  
2. Click on **“Download ZIP.”**  
3. Go to your **Downloads** folder, then extract the ZIP folder contents to the same folder.

Choose one of the following extraction methods:

* **Option 1 (Windows Utility – Recommended):**  
  Right-click the ZIP file → **Extract All** → follow prompts → open the new folder named `scripts_chocolatey-main`.  
  * If you don’t see *Extract All*, right-click → **Show more options** → choose from the new menu.

* **Option 2 (Using 7-Zip):**  
  Right-click the ZIP file → **7-Zip** → **Extract Here** → open the new folder named `scripts_chocolatey-main`.

---

### ⚙️ Run the Installer Scripts

1. Inside the extracted folder, open and **read the instructions text file.**  
2. Follow the provided instructions (and troubleshooting steps if necessary).  
3. You will eventually **run install scripts** that download the required programs (packages).  
4. You may need to:
   * Run scripts as **Administrator** or provide your **password**.
   * Bypass **Windows SmartScreen** by clicking **More Info → Run Anyway**.  
5. Installation typically takes **30–45 minutes**.  
   > 💡 NOTE: Keep your computer powered on, plugged in, and connected to the internet.  
6. If any application windows (e.g., *warp*) open during installation, simply close them.

### ✅ Verify Chocolatey Installation

After the installs finish, run your system’s list command:

```bash
ls
```

#### Windows

1. Search for **PowerShell** on the bottom toolbar.  

2. Right-click and select **Run as Administrator.**  

3. When prompted by Windows UAC, click **Yes.**  

4. Type the command below and press **Enter**:

    ```powershell
    choco list
    ```

---

## 🛠️ Step 2 – Terraform Installation

### Install Terraform (in Chocolatey)

```bash
choco install terraform -y          # Install Terraform
choco install git -y                # Install Git
choco install vscode -y             # Install VS Code
```

### Upgrade Terraform (if necessary)

```bash
choco upgrade terraform -y          # Upgrade Terraform
choco upgrade git -y                # Upgrade Git
choco upgrade vscode -y             # Upgrade VS Code
```

### Verify if Terraform is installed

```bash
terraform -version
```

> [!CAUTION]
> 🧩 If missing, reboot or confirm `C:\ProgramData\chocolatey\bin` in PATH.

---

## 📂 Step 3 – Create Your Project in Local Repository (Your Computer)

```bash
cd C:\Users\computername\Documents\TheoWAF\class7\AWS\Homework\
mkdir week-6-homework
cd week-6-homework
touch 0-authentication.tf 1-vpc.tf A-backend.tf
code .
```

* Sample `0-auth.tf`:

    ```hcl
    terraform {
    required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "6.17.0"
        }
    }
    }

    provider "aws" {
        region = "us-east-1"
    }
    ```

* `1-vpc.tf`:

    ```hcl
    resource "aws_vpc" "tiqs" {
    cidr_block = "10.245.0.0/16"

    tags = {
        Name = "tiqs"
    }
    }
    ```

* `A-backend.tf`:

    ```hcl
    terraform {
    backend "s3" {
        bucket  = "your-bucket-name-here"
        key     = "week-6-homework.tfstate"
        region  = "us-east-1"
        encrypt = true
        }
    }

* `.gitignore`

    ```gitignore
    # Local .terraform directories
    **/.terraform/*

    # .tfstate files
    *.tfstate
    *.tfstate.*

    # Crash log files
    crash.log
    crash.*.log

    # Exclude all .tfvars files, which are likely to contain sensitive data, such as
    # passwords, private keys, and other secrets. These should not be part of version
    # control as they are data points which are potentially sensitive and subject
    # to change depending on the environment.
    *.tfvars
    *.tfvars.json

    # Ignore override files as they are usually used to override resources locally and so
    # are not checked in
    override.tf
    override.tf.json
    *_override.tf
    *_override.tf.json

    # Ignore transient lock info files created by terraform apply
    .terraform.tfstate.lock.info

    # Include override files you do wish to add to version control using negated pattern
    # !example_override.tf

    # Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
    # example: *tfplan*

    # Ignore CLI configuration files
    .terraformrc
    terraform.rc

    # Ignore keys
    *.json 

    .terraform.lock.hcl
    example.kubeconfig
    ```

> 🛑 **DO NOT EDIT**: `.terraform/`, `terraform.tfstate`, or `.terraform.lock.hcl`

---

## 🚦 Step 4 – Initialize and Validate

```bash
terraform init          # Initialize Terraform Configuration
terraform fmt           # Format Your Terraform Code
terraform validate      # Validate Your Terraform Syntax Code
terraform plan          # Plan Your Terraform Configuration
terraform destroy       # Destroy Your Terraform Resources
```

> [!TIP]
> 💬 **Expert Users Only**: Add **S3 backend** then rerun `terraform init -upgrade`

---

## 🔁 Step 5 – Follow-Ups & Git Tips

* 🧾 Version Control:

    ```bash
    git init
    git add .
    git commit -m "initial commit"
    git branch -M main
    git push -u origin main
    ```

---

## ❓ FAQ / Troubleshooting

| Problem                  | Fix                                                           |
| ------------------------ | ------------------------------------------------------------- |
| ❌ `terraform init` fails | Check provider versions or run `terraform init -upgrade`      |
| ⚠️ PATH issue            | Reboot PowerShell or confirm Chocolatey bin in PATH           |
| 🤔 WSL?                  | Not recommended for this guide                                |
| ✍️ Editable files?       | Only `.tf` files — avoid `.terraform/`, lock, and state files |

---

## 📸 Screenshots

1. **Successful `terraform apply` Output:**

   ![terraform-apply.jpg](/Screenshots/terraform-apply.jpg)

2. **`aws sts get-caller-identity` Output:**

   ![aws-sts-get-caller-identity.jpg](/Screenshots/aws-sts-get-caller-identity.jpg)

3. **.gitignore Screenshot:**

   ![gitignore.jpg](/Screenshots/gitignore.jpg)

4. **Successful `terraform destroy` Output:**

   ![terraform-destroy.jpg](/Screenshots/terraform-destroy.jpg)

---

## 📚 References

* 🔗 [Terraform CLI (GitHub)](https://github.com/hashicorp/terraform)
* 📘 [HashiCorp Learn Portal](https://learn.hashicorp.com/terraform)
* 💻 [Chocolatey Automation Scripts](https://github.com/rofoed01/scripts_chocolatey)

> [!TIP]
> Access to supporting docs may require permission.

---

## ✍️ Authors & Acknowledgments

* **Author:** T.I.Q.S.
* **Group Leader:** John Sweeney

---
