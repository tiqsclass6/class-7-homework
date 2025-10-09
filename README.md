# Class 7 Homework Repository

![AWS](https://img.shields.io/badge/Cloud-AWS-orange?logo=amazon-aws&logoColor=white)
![EC2](https://img.shields.io/badge/Service-EC2-blue?logo=amazon-aws&logoColor=white)
![Apache](https://img.shields.io/badge/WebServer-Apache-red?logo=apache&logoColor=white)
![HTML](https://img.shields.io/badge/Frontend-HTML5-green?logo=html5&logoColor=white)
![GitHub](https://img.shields.io/badge/Workflow-GitHub%20PRs-lightgrey?logo=github)
![Status](https://img.shields.io/badge/Weeks-1--4-success?logo=github)

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

## 🛠 Troubleshooting

If you run into problems during these assignments:

- **EC2 not reachable**  
  - Check the **security group inbound rules** (HTTP/80 and SSH/22).  
  - Ensure the instance is in **running** state in AWS console.  

- **Apache not serving content**  
  - Verify Apache is installed and running:  

    ```bash
    sudo systemctl status apache2
    ```  

  - Ensure `index.html` is located in `/var/www/html/`.  

- **SSH connection issues**  
  - Confirm you’re using the right key pair and `.pem` file permissions (`chmod 400`).  
  - Double-check the EC2 **public IP**.  

- **Git merge conflicts**  
  - Use `git status` to identify conflicts.  
  - Edit conflicting files, then:  

    ```bash
    git add .
    git commit
    git push
    ```  

---

## 📝 Overall Summary

Through these weekly assignments, you’ll gain hands-on practice with:

- **AWS basics** (EC2, security groups, Apache setup)  
- **Live server customization** via SSH and HTML edits  
- **Linux fundamentals** (navigation, processes, networking basics)  
- **Network design** (CIDR planning, subnetting, HA layouts)  
- **GitHub collaboration** (branches, pull requests, merges)  

👉 Completing these tasks will prepare you for more advanced cloud and DevOps workflows.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney
