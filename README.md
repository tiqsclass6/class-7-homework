# Class 7 Homework Repository

![AWS](https://img.shields.io/badge/Cloud-AWS-orange?logo=amazon-aws&logoColor=white)
![EC2](https://img.shields.io/badge/Service-EC2-blue?logo=amazon-aws&logoColor=white)
![Apache](https://img.shields.io/badge/WebServer-Apache-red?logo=apache&logoColor=white)
![HTML](https://img.shields.io/badge/Frontend-HTML5-green?logo=html5&logoColor=white)
![GitHub](https://img.shields.io/badge/Workflow-GitHub%20PRs-lightgrey?logo=github)
![Status](https://img.shields.io/badge/Weeks-1--6-success?logo=github)

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

## 🛠 Troubleshooting

If you run into problems during these assignments, use the following guide to identify and resolve common issues across all branches (1–6).

### 🌐 EC2 and Network Connectivity

- **EC2 Not Reachable**
  - Verify your **security group inbound rules** allow the required ports (HTTP/80, SSH/22, and ICMP).  
  - Confirm the instance is in a **running** state in the AWS Console.  
  - Ensure the **VPC and subnet configurations** are correctly assigned.  
  - Check **public IP association** and that you’re using the correct address.

- **Cannot Ping or Connect to Instance**
  - Confirm **ICMP** is enabled in your security group.  
  - Verify your **network ACLs** and **VPC routes** allow outbound and inbound traffic.  
  - Use:

    ```bash
    ping 8.8.8.8
    traceroute <public-ip>
    ```

### 🖥 Apache and Web Server Issues

- **Apache Not Serving Content**
  - Verify Apache is installed and running:

    ```bash
    sudo systemctl status apache2
    ```

  - Restart if needed:

    ```bash
    sudo systemctl restart apache2
    ```

  - Ensure your `index.html` file exists in `/var/www/html/`.  
  - Check file ownership and permissions:

    ```bash
    sudo chown www-data:www-data /var/www/html/index.html
    sudo chmod 644 /var/www/html/index.html
    ```

- **Page Displays Default Apache Test Page**
  - Confirm you edited the correct `index.html` file.
  - Clear your browser cache or force refresh (**Ctrl + F5**).

### 🔐 SSH and Login Issues

- **SSH Connection Denied**
  - Make sure you’re using the right **key pair** for the EC2 instance.
  - Adjust key permissions:

    ```bash
    chmod 400 <your-key-name>.pem
    ```

  - Connect using:

    ```bash
    ssh -i <your-key-name>.pem ec2-user@<public-ip>
    ```

  - If “Connection timed out,” check firewall or inbound rules for SSH (port 22).

- **Permission Denied or Access Refused**
  - Check that your user has administrative privileges.
  - Reboot instance if SSH service is unresponsive:

    ```bash
    sudo systemctl restart sshd
    ```

---

### 🐧 Linux Command-Line Issues (Week 3)

- **Command Not Found**
  - Ensure you are in the correct shell (e.g., Bash).
  - Verify the binary exists in your `$PATH`.
- **File Permission Errors**
  - Use:

    ```bash
    chmod +x <filename>
    ```

  - To check permissions:

    ```bash
    ls -l
    ```

- **Killercoda Environment Fails to Load**
  - Refresh the browser and re-launch the scenario.
  - Disable browser extensions that may block scripts.

---

### 🧩 Network Architecture and VPC (Week 4)

- **Incorrect CIDR or Subnet Size**
  - Validate your subnet math using an online CIDR calculator.
  - Ensure subnet ranges don’t overlap.
- **Private Subnet Access Issues**
  - Confirm **NAT Gateway** or **Internet Gateway** configuration.
  - For private instances, use a bastion host or session manager.
- **VPC Diagram Missing or Not Displaying**
  - Export your diagram in `.png` or `.pdf` and verify upload path in GitHub.

---

### ⚙️ Terraform Setup and Execution (Week 6)

- **Terraform Init Fails**
  - Check your internet connection and provider credentials.
  - Re-run initialization:

    ```bash
    terraform init -reconfigure
    ```

- **Provider Plugin Error**
  - Delete the `.terraform` folder and run:

    ```bash
    terraform init
    ```

- **Terraform Apply or Plan Errors**
  - Validate the syntax:

    ```bash
    terraform validate
    ```

  - Format files:

    ```bash
    terraform fmt -recursive
    ```

  - Ensure your AWS credentials are configured properly:

    ```bash
    aws configure
    aws sts get-caller-identity
    ```

- **Terraform Destroy Hangs**
  - Verify resources are still active in AWS Console.
  - Retry:

    ```bash
    terraform destroy -auto-approve
    ```

---

### 🧠 Git and Version Control Issues

- **Unstaged or Uncommitted Changes**
  - Check current repo state:

    ```bash
    git status
    ```

- **Merge Conflicts**
  - Identify conflicting files:

    ```bash
    git status
    ```

  - Edit and resolve manually, then:

    ```bash
    git add .
    git commit -m "Resolved merge conflicts"
    git push -u origin <branch-name>
    ```

- **Branch Errors**
  - Confirm branch creation and checkout:

    ```bash
    git branch
    git checkout -b week-6-homework
    ```

- **Forgot to Add .gitignore**
  - Create or update `.gitignore` file to exclude unnecessary Terraform state and log files:

    ```gitignore
    .terraform/
    terraform.tfstate
    terraform.tfstate.backup
    crash.log
    *.tfvars
    ```

---

### 💡 General Tips

- Always **run terminals as Administrator** (Windows) or with `sudo` (Linux/macOS).  
- Keep your **AWS credentials private** and never commit `.aws/` directories or `.tfstate` files.  
- Regularly run:

  ```bash
  git pull
  terraform validate
  terraform fmt -recursive

- Review console and error outputs carefully—Terraform and AWS CLI messages are usually descriptive.

---

## 📝 Overall Summary

Through these weekly assignments, you’ll build a strong foundation in **Cloud Infrastructure, DevOps automation, and Infrastructure as Code (IaC)** practices. Each branch progressively enhances your technical and operational skills:

- **AWS Fundamentals (Weeks 1–2)**  
  - Learn to launch and secure **EC2 instances**, configure **security groups**, and deploy a custom **Apache webserver**.  
  - Understand basic networking, SSH connectivity, and real-time configuration via HTML updates.  

- **Linux Operations (Week 3)**  
  - Gain command-line proficiency using **Killercoda Linux Fundamentals**.  
  - Master file permissions, directory structures, process control, and system commands that form the backbone of DevOps workflows.  

- **Network Architecture & Design (Week 4)**  
  - Design scalable **VPC networks** using CIDR subnetting, private/public subnets, and multi-AZ topologies.  
  - Apply **RFC 1918** addressing schemes and visualize network flow with diagrams and IP allocation plans.  

- **Infrastructure as Code (Week 6)**  
  - Set up and initialize **Terraform** for automated infrastructure provisioning.  
  - Execute workflows using key commands (`terraform init`, `plan`, `apply`, `destroy`) and validate results with **AWS CLI**.  
  - Follow Git best practices (`.gitignore`, branching, commits) and share deployment-ready instructions with teammates for reproducibility.  

- **Collaboration and Source Control (All Weeks)**  
  - Strengthen **GitHub version control** techniques with branches, pull requests, merges, and troubleshooting workflows.  
  - Practice clear documentation, peer review, and consistent repository hygiene for multi-user DevOps environments.  

---

### 🚀 Outcome

By completing Weeks 1–6, you will have demonstrated the ability to:

- Deploy and secure live infrastructure in AWS.  
- Configure, troubleshoot, and monitor Linux-based servers.  
- Design resilient network architectures aligned with cloud best practices.  
- Implement repeatable deployments using Terraform and AWS CLI.  
- Collaborate effectively using GitHub and team-based version control.  

👉 Collectively, these assignments prepare you for advanced **Cloud Engineering**, **DevOps**, and **Infrastructure Automation** roles across AWS and multi-cloud environments.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.  
- **Group Leader:** John Sweeney
