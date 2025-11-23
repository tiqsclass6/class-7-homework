# Class 7 Homework Repository

![Cloud](https://img.shields.io/badge/Cloud-AWS-orange?style=for-the-badge&logo=amazon-aws&logoColor=white)
![EC2](https://img.shields.io/badge/Service-EC2-blue?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Apache](https://img.shields.io/badge/WebServer-Apache-red?style=for-the-badge&logo=apache&logoColor=white)
![HTML5](https://img.shields.io/badge/Frontend-HTML5-green?style=for-the-badge&logo=html5&logoColor=white)
![GitHub PRs](https://img.shields.io/badge/Workflow-GitHub%20PRs-lightgrey?style=for-the-badge&logo=github&logoColor=black)
![Weeks 1–2](https://img.shields.io/badge/Weeks%201–2-AWS%20Fundamentals-blueviolet?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Week 3](https://img.shields.io/badge/Week%203-Linux%20Fundamentals-yellow?style=for-the-badge&logo=linux&logoColor=white)
![Week 4](https://img.shields.io/badge/Week%204-VPC%20Architecture%20%7C%20Subnetting-green?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Week 6](https://img.shields.io/badge/Week%206-Terraform%20%7C%20IaC-orange?style=for-the-badge&logo=terraform&logoColor=white)
![Week 9](https://img.shields.io/badge/Week%209-High%20Availability%20%7C%20Route53-blue?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Week 10](https://img.shields.io/badge/Week%2010-RDS%20%7C%20CloudFront%20%7C%20SQS-orange?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Week 11](https://img.shields.io/badge/Week%2011-S3%20Intro%20%7C%20Advanced%20S3%20%7C%20Security-green?style=for-the-badge&logo=amazon-aws&logoColor=white)

This repository contains all homework deliverables for **Class 7**. Each week’s assignment lives in its own branch with specific tasks and expected outputs.

---

## [🌐 Week 1 Homework — Custom Webserver on AWS EC2](https://github.com/tiqsclass6/class-7-homework/tree/week-1-homework)

### Task 1

- Create a **security group** (HTTP/80) and launch an **EC2** instance.
- Use **user data** to install Apache, render instance metadata into `index.html`, and start the webserver.
- Turn in: **screenshot** of the running site, the **startup `.sh` script**, and **README** with setup + teardown steps.

### Branch 1 Summary

You’ll practice baseline AWS ops: SG creation, EC2 launch, IMDSv2 metadata fetch, Apache enable/start, and validating with a browser screenshot.

---

## [🌐 Week 2 Homework — Custom Webserver on EC2 & Ping Google DNS](https://github.com/tiqsclass6/class-7-homework/tree/week-2-homework)

### Task 2

- Build on Week 1: connect via **SSH/EC2 Instance Connect** and **edit** the live `index.html` (Vim).
- Enable SG rules for **HTTP/80, SSH/22, ICMP**; verify networking with `ping -c 15 8.8.8.8`.
- Turn in: updated HTML reflecting the required personal lines, connectivity proof, and the provided `class-7-week2-homework.sh`.

### Branch 2 Summary

Focus on live-server editing, connectivity testing (ICMP), and documenting the deltas from Week 1 with screenshots and the user-data script.

---

## [🌐 Week 3 Homework – Killercoda Linux Fundamentals](https://github.com/tiqsclass6/class-7-homework/tree/week-3-homework)

### Task 3

- Complete **Killercoda Linux Fundamentals** Lessons **1–10**.
- Capture and upload **screenshots** for each lesson plus the **scoreboard** to the repo.

### Branch 3 Summary

Hands-on Linux CLI practice (navigation, processes, networking fundamentals) with clear evidence via lesson screenshots and a scoreboard image.

---

## [🌐 Week 4 Homework – Network Architectural Design](https://github.com/tiqsclass6/class-7-homework/tree/week-4-homework)

### Task 4

- Design an **AWS VPC CIDR plan** using **RFC 1918** (selected `10.230.0.0/16`) and carve **/24 subnets** across **3 AZs** (public + private).
- Provide artifacts: **network diagram**, **PDF/XLSX** with ranges, and screenshots (VPC, quiz, binary game).

### Branch 4 Summary

You’ll produce a documented subnetting design for HA workloads (segregated public/private subnets across AZs) with rationale, visuals, and support files.

---

## [🌐 Week 6 Homework – Chocolately and Terraform Initialization](https://github.com/tiqsclass6/class-7-homework/tree/week-6-homework)

### Task 6

Create a **step-by-step setup guide** explaining how to install and initialize **Terraform** on your local computer.  
Your documentation must include:

1. **Programs to Use**  
   - **VS Code**, **Git Bash**, or **PowerShell** for running Terraform commands.  
   - Use **AWS CLI** for verifying identity and credentials.  
   - Use **Terraform** (downloaded from HashiCorp) — not 3rd-party clones or installers.  

2. **Programs *Not* to Use**  
   - Avoid using unverified installers or modified Terraform binaries.  
   - Do **not** run Terraform from online IDEs like Replit or CodeSandbox.  
   - Do **not** modify `.terraform.lock.hcl` or provider binaries.  

3. **Files to Modify / Not Modify**  
   - ✅ **Modify:** `main.tf`, `variables.tf`, `outputs.tf`, and any custom `.tf` configuration files.  
   - ❌ **Do Not Modify:** hidden folders like `.terraform/`, or system-generated `.terraform.lock.hcl`.  

4. **GitHub References**  
   - Reference this repo’s [Week 6 branch](https://github.com/tiqsclass6/class-7-homework/tree/week-6-homework) for template files.  
   - Follow best practices from the group’s **main repo** as guided by your group leader.  

5. **Relevant Commands**  

   ```bash
   aws sts get-caller-identity
   terraform init
   terraform fmt
   terraform validate
   terraform plan
   terraform apply
   ```

### Branch 6 Summary

This week focuses on mastering **Terraform setup and execution** on your local system.  
You’ll demonstrate proficiency by successfully applying and destroying Terraform infrastructure while validating AWS credentials and repository hygiene.

- Capture a **screenshot of successful `terraform apply` and `terraform destroy`** executions in VS Code, Terminal, Git Bash, or PowerShell.  
- Include a **screenshot of `aws sts get-caller-identity`** to verify your AWS credentials and IAM identity.  
- Show your **`.gitignore`** file located in the same directory as your Terraform configuration files to confirm proper Git hygiene.  
- Finally, submit a **text document** listing at least one person who successfully deployed Terraform using your shared setup instructions.

---

## 🌐 [Week 9 Homework — High Availability, Scalability & Route 53](https://github.com/tiqsclass6/class-7-homework/tree/week-9-homework)  

### Task 9

- Design a highly available architecture using **Auto Scaling Groups (ASG)** and **Elastic Load Balancers (ELB)**.  
- Compare **Multi-AZ** vs **Multi-Region** deployment strategies.  
- Explain **Route 53** fundamentals and implement routing policies (Failover, Latency, Geolocation, Weighted).  
- Provide diagrams, explanations, and screenshots of your Route 53 configurations

### Branch 9 Summary

- High Availability & Scalability (ASG, Load Balancers)  
- Multi-AZ vs Multi-Region  
- Route 53 fundamentals  
- Routing policies (Failover, Latency, Geolocation, Weighted)  

---

## 🌐 [Week 10 Homework — Databases, Global Acceleration & Decoupling](https://github.com/tiqsclass6/class-7-homework/tree/week-10-homework)  

### Task 10

Deep dive into AWS services that support global applications and decoupling:

- Explore **RDS** and **Aurora** for managed relational databases.  
- Understand **ElastiCache** for in-memory caching.  
- Learn about **CloudFront** and **AWS Global Accelerator** for content delivery and global performance.  
- Dive into **SQS**, **SNS**, **Kinesis**, and **Amazon MQ** for decoupling and messaging.  
- Discuss global application design and performance optimization strategies.

### Branch 10 Summary

- RDS, Aurora, ElastiCache  
- CloudFront & AWS Global Accelerator  
- SQS, SNS, Kinesis, Amazon MQ  
- Global application design & performance  

---

## 🌐 [Week 11 Homework — Solutions Architecture & S3 Deep Dive](https://github.com/tiqsclass6/class-7-homework/tree/week-11-homework)  

### Task 11

- Explore **S3 (Simple Storage Service)** in depth: features, use cases, and best practices.  
- Understand **S3 storage classes** (Standard, Intelligent-Tiering, Glacier, etc.) and their use cases.  
- Learn about **S3 replication**, **multi-part uploads**, and **transfer acceleration**.  
- Dive into **S3 security**: Server-Side Encryption (SSE), IAM policies, bucket policies, and Block Public Access (BPA).  
- Discuss solutions architecture patterns that leverage S3 for scalable, durable storage.

### Branch 11 Summary  

- Classic AWS architecture discussions  
- Amazon S3 Introduction  
- Advanced S3 (replication, multi-part uploads, TA)  
- S3 Security (SSE, IAM, bucket policies, BPA)  

---

### 💡 General Tips

- Always **run your terminal as Administrator** (Windows) or use `sudo` as needed (Linux/macOS).  
- Keep your **AWS credentials private** — never commit `.aws/` directories, `.tfstate` files, or any sensitive configuration.  
- Regularly run the following commands to maintain repo hygiene and catch issues early:

  ```bash
  git pull
  terraform validate
  terraform fmt -recursive
  ```

- Review Terraform and AWS CLI output carefully — error messages are often descriptive and point directly to the root cause.
- When in doubt, re-run commands with verbose/debug flags (e.g., --debug) to gain additional insights.

---

## 📝 Overall Summary

Throughout these weekly assignments, you’ve built a strong foundation in **Cloud Infrastructure**, **DevOps Automation**, and **Infrastructure as Code (IaC)**. Each branch progressively develops your technical depth and operational confidence.

### 🌩️ AWS Fundamentals (Weeks 1–2)

- Launch and secure **EC2 instances**, configure **security groups**, and deploy a custom **Apache webserver**.  
- Build an understanding of basic networking, SSH connectivity, and live HTML configuration updates.

### 🐧 Linux Operations (Week 3)

- Strengthen command-line skills through **Killercoda Linux Fundamentals**.  
- Master permissions, directory structures, process control, and essential Linux utilities that underpin DevOps workflows.

### 🌐 Network Architecture & Design (Week 4)

- Design scalable **VPC architectures** using CIDR subnetting across multiple AZs.  
- Apply **RFC 1918** addressing and create subnet diagrams to visualize traffic flow and IP allocation.

### ⚙️ Infrastructure as Code (Week 6)

- Install, configure, and run **Terraform** for automated infrastructure provisioning.  
- Practice core IaC workflows using `terraform init`, `plan`, `apply`, and `destroy`.  
- Follow Git best practices, manage `.gitignore`, and produce shareable documentation for reproducible deployments.

### 🚀 Advanced AWS Services (Weeks 9–11)

- Implement **high availability** using Auto Scaling, Load Balancers, and AWS global routing with Route 53.  
- Explore managed data services such as **RDS**, **Aurora**, and **ElastiCache**.  
- Understand global delivery patterns using **CloudFront** and **AWS Global Accelerator**.  
- Achieve S3 mastery, covering storage classes, lifecycle policies, replication, and end-to-end security.

### 🤝 Collaboration & Source Control (All Weeks)

- Improve GitHub workflows using branches, PRs, merging strategies, and version control hygiene.  
- Maintain strong documentation habits, support peer reviews, and contribute to multi-user DevOps environments.

---

## 🛠 Troubleshooting

Use this guide to diagnose and resolve common issues encountered throughout the assignments. These tips apply across all branches and reflect real-world AWS and Linux troubleshooting workflows.

---

### 🌐 EC2 and Network Connectivity

- **EC2 Not Reachable**
  - Verify **security group inbound rules** allow required ports (HTTP/80, SSH/22, ICMP).
  - Ensure the instance is in a **running** state in AWS.
  - Confirm the correct **VPC**, **subnet**, and **route table** associations.
  - Check that the instance has a **public IP** (for public access) and that you are using the correct address.

- **Cannot Ping or Connect to Instance**
  - Ensure **ICMP** is allowed in the security group.
  - Verify **NACLs** allow both inbound and outbound traffic.
  - Confirm the subnet route table points to an **Internet Gateway** (public) or **NAT Gateway** (private).
  - Use:

    ```bash
    ping 8.8.8.8
    traceroute <public-ip>
    ```

---

### 🖥 Apache and Web Server Issues

- **Apache Not Serving Content**
  - Check that Apache is running:

    ```bash
    sudo systemctl status apache2
    ```

  - Restart the service if needed:

    ```bash
    sudo systemctl restart apache2
    ```

  - Ensure `index.html` is located in:

    ```plaintext
    /var/www/html/
    ```

  - Validate permissions:

    ```bash
    sudo chown www-data:www-data /var/www/html/index.html
    sudo chmod 644 /var/www/html/index.html
    ```

- **Apache Test Page Still Appears**
  - Confirm you're editing the correct `index.html`.
  - Clear your browser cache or perform a hard refresh (**Ctrl + F5**).

---

### 🔐 SSH and Login Issues

- **SSH Connection Denied**
  - Ensure you're using the correct **key pair** for the EC2 instance.
  - Set key permissions properly:

    ```bash
    chmod 400 <your-key-name>.pem
    ```

  - Connect to the instance:

    ```bash
    ssh -i <your-key-name>.pem ec2-user@<public-ip>
    ```

  - If you receive a timeout, verify inbound rules for **SSH (22)** and confirm the instance’s public IP.

- **Permission Denied / Access Refused**
  - Verify your IAM user or OS user has necessary privileges.
  - Restart the SSH daemon if needed:

    ```bash
    sudo systemctl restart sshd
    ```

---

### 🐧 Linux Command-Line Issues (Week 3)

- **Command Not Found**
  - Check if you're using the correct shell (e.g., Bash).
  - Verify the binary is in your `$PATH`.

- **File Permission Errors**
  - Add execute permissions:

    ```bash
    chmod +x <filename>
    ```

  - Check current permissions:

    ```bash
    ls -l
    ```

- **Killercoda Environment Issues**
  - Refresh the browser.
  - Disable ad blockers or extensions that may break the environment.
  - Restart the scenario.

---

### 🧩 Network Architecture & VPC (Week 4)

- **Incorrect CIDR or Overlapping Subnets**
  - Validate using an online CIDR calculator.
  - Ensure subnets are non-overlapping and appropriately sized.

- **Private Subnet Access Issues**
  - Confirm **NAT Gateway** exists and is attached to the correct route table.
  - Use a **bastion host** or **Session Manager** for private EC2 access.

- **VPC Diagram Not Displaying**
  - Export diagrams as `.png` or `.pdf`.
  - Verify that file paths and filenames match your GitHub uploads.

---

### ⚙️ Terraform Setup and Execution (Week 6)

- **Terraform Init Fails**
  - Check your internet connection.
  - Verify your AWS credentials.
  - Reinitialize Terraform:

    ```bash
    terraform init -reconfigure
    ```

- **Provider Plugin Errors**
  - Remove the provider cache:

    ```bash
    rm -rf .terraform
    terraform init
    ```

- **Terraform Plan / Apply Errors**
  - Validate configuration syntax:

    ```bash
    terraform validate
    ```

  - Format files:

    ```bash
    terraform fmt -recursive
    ```

  - Confirm AWS credentials:

    ```bash
    aws configure
    aws sts get-caller-identity
    ```

- **Terraform Destroy Hangs**
  - Ensure resources still exist in AWS.
  - Retry destroy:

    ```bash
    terraform destroy -auto-approve
    ```

---

### 🧠 Git and Version Control Issues

- **Unstaged or Uncommitted Changes**
  - Check the current repo state:

    ```bash
    git status
    ```

- **Merge Conflicts**
  - Identify conflicting files:

    ```bash
    git status
    ```

  - Open each conflicting file, resolve conflicts manually, then stage and commit:

    ```bash
    git add .
    git commit -m "Resolved merge conflicts"
    git push -u origin <branch-name>
    ```

- **Branch Issues or Wrong Branch Checked Out**
  - Verify existing branches and switch or create one as needed:

    ```bash
    git branch
    git checkout -b week-6-homework
    ```

- **Missing or Incorrect `.gitignore`**
  - Create or update `.gitignore` to properly exclude Terraform state files and sensitive artifacts:

    ```gitignore
    .terraform/
    terraform.tfstate
    terraform.tfstate.backup
    crash.log
    *.tfvars
    ```

  - After updating, confirm Git is no longer tracking ignored files:

    ```bash
    git status
    ```

---

## 🎯 Comprehensive Learning Outcomes (Weeks 1–11)

### Week 1–6: Foundational Cloud & DevOps Skills

Through Weeks **1–6**, you established a strong technical foundation across core cloud and DevOps skill sets:

- Deploy and secure live infrastructure in **AWS**.
- Configure, troubleshoot, and monitor **Linux-based servers**.
- Design resilient **VPC and network architectures** aligned with cloud best practices.
- Implement repeatable deployments using **Terraform** and the **AWS CLI**.
- Collaborate effectively using **GitHub**, including branching, PR workflows, and version control hygiene.

👉 These early weeks build the essential groundwork for advanced roles in **Cloud Engineering**, **DevOps**, and **Infrastructure Automation** across AWS and multi-cloud environments.

### Week 9–11: Advanced AWS Architecture & Solutions

Building on that foundation, Weeks **9–11** elevate your capabilities into **AWS Associate-level architecture**, focusing on the highest-value, most heavily tested topics in the **SAA-C03** exam:

- Implement **fault-tolerant** and **high-availability** designs using Auto Scaling, Load Balancers, and multi-region patterns.
- Strengthen global performance and reliability through **Route 53**, **CloudFront**, and **AWS Global Accelerator**.
- Master key data and messaging services including **RDS**, **Aurora**, **ElastiCache**, **SQS**, **SNS**, **Kinesis**, and **Amazon MQ**.
- Achieve deep proficiency in **Amazon S3**: storage classes, lifecycle policies, replication, encryption, and access control.
- Apply architectural patterns for decoupling, event-driven systems, caching tiers, and scalable application delivery.

The repository now includes:

- 📸 **Detailed quiz reference images**  
- 📘 **Enhanced documentation across all branches**  
- 🔗 **Cross-referenced study workflows** for long-term retention and exam readiness  

> [!NOTE]
> Together, Weeks **1–11** provide a complete journey from AWS fundamentals → hands-on infrastructure → associate-level architectural design — preparing you for real-world cloud engineering and the AWS Solutions Architect Associate exam.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.  
- **Group Leader:** John Sweeney

---
