# 🚀 Week 1 Homework — Custom Webserver on AWS EC2

[![Repo](https://img.shields.io/badge/Repo-tiqsclass6%2Fclass--7--homework-181717?logo=github)](https://github.com/tiqsclass6/class-7-homework)
![Cloud-AWS](https://img.shields.io/badge/Cloud-AWS-orange?logo=amazon-aws&logoColor=white)
![Service-EC2](https://img.shields.io/badge/Service-EC2-blue?logo=amazonec2&logoColor=white)
![WebServer-Apache](https://img.shields.io/badge/WebServer-Apache-red?logo=apache&logoColor=white)
![Frontend-HTML5](https://img.shields.io/badge/Frontend-HTML5-green?logo=html5&logoColor=white)
![Status-Class%207%20|%20Week%201%20%E2%80%94%20Homework](https://img.shields.io/badge/Status-Class%207%20%7C%20Week%201%20%E2%80%94%20Homework-brightgreen)

This guide walks you through creating a **custom webserver** hosted on an AWS EC2 instance.  
Follow each step carefully and you’ll have your own running webserver serving your custom HTML.

---

## 📘 Task

### HW - Class 7 Homework

- Screenshot of running **WebServer**
- Copy of the start up script saved as a `.sh` file
- `README.md` instructions on how to configure the EC2 with teardown instructions.  

---

## 1️⃣ Create a Security Group

- Log into the **AWS Console**

- Go to the **EC2 Dashboard**

- In the search bar, type **“security group”**

  ![search-security-group](/Screenshots/search-security-groups.jpg)

- Open **Security Groups** in a new tab

- On the right-hand side, click the orange button **Create security group**

  ![create-security-group](/Screenshots/create-security-group.jpg)

### Security Group Details

- **Name:** `class-7-week1-homework`
- **Description:** `class-7-week1-homework`
- **VPC:** Default (leave as default VPC)

### Inbound Rules

| Type  | Protocol | Port Range | Source       | Description |
|-------|----------|------------|--------------|-------------|
| HTTP  | TCP      | 80         | Anywhere (0.0.0.0/0) | `webserver` (or `internet` / `HTTP`) |

  ![security-group-details-pt1](/Screenshots/security-group-details-pt1.jpg)

> ⚠️ Outbound rules: **Skip this section entirely**  

### Tags (Optional)

- **Key:** `name`  
- **Value:** `class-7-week1-homework`  

Click **Create security group**.

  ![security-group-details-pt2](/Screenshots/security-group-details-pt2.jpg)
  ![security-group-results](/Screenshots/security-group-results.jpg)

---

## 2️⃣ Launch an EC2 Instance

- Return to the **EC2 Dashboard**
- Click **Launch instance** (open in a new tab)

  ![launch-instance](/Screenshots/launch-instance.jpg)

### Instance Details

- **Name:** `class-7-week1-homework`
- **Application and OS Image (AMI):** Leave as default (Amazon Linux 2 recommended)

  ![launch-instance-details-pt1](/Screenshots/launch-instance-details-pt1.jpg)

- **Instance Type:** Leave as default (`t3.micro` for free tier)

  ![launch-instance-details-pt2](/Screenshots/launch-instance-details-pt2.jpg)

- **Key Pair (login):** Click **Create new key pair** (save the `.pem` file safely)

   ![create-key-pair](/Screenshots/create-key-pair.jpg)
   ![key-pair-complete](/Screenshots/key-pair-complete.jpg)

### Network Settings

- **Network:** Default VPC  
- **Subnet:** Default (No preference – Default subnet availability zone)  
- **Auto-assign Public IP:** Enabled  
- **Firewall (Security Groups):** Select **Existing Security Group** → choose **`class-7-week1-homework`**

### Storage

- Default: 1x `8` GiB `gp3`

![launch-instance-details-pt3](/Screenshots/launch-instance-details-pt3.jpg)

---

## 3️⃣ Add User Data (Custom Script)

1. Expand the **Advanced Details** section  
2. Scroll to **User data (optional)**  
3. Paste in your **custom script** (the shell script you’ve written for **Apache + HTML**)  

### **Example:**

```shell
#!/bin/bash
# User data script for EC2 with Apache + metadata HTML

# Update and install Apache
yum update -y
yum install -y httpd -y
systemctl start httpd
systemctl enable httpd

# Get IMDSv2 token
TOKEN=$(curl -s -f -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch metadata
local_ipv4=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)
az=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)
macid=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/network/interfaces/macs/ | head -n 1)
vpc=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)
hostname_fqdn=$(hostname -f)

# Write HTML file
cat <<EOF > /var/www/html/index.html
<!doctype html>
<html lang="en" class="h-100">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>9-16-2025 - EC2 Instance</title>
  <style>
    body { 
      background: url("https://static.vecteezy.com/system/resources/previews/030/638/155/large_2x/flag-wallpaper-of-brazil-free-photo.jpg") no-repeat center center fixed;
      background-size: cover; 
      color: #ffffff; 
      font-family: Arial, sans-serif;
      text-align: center; 
      margin: 0; 
      padding: 0; 
    }
    h1 { margin-top: 20px; }
    .cards { 
      display: flex; 
      justify-content: center; 
      gap: 20px; 
      flex-wrap: wrap; 
      margin: 30px auto; 
      max-width: 95%; 
    }
    .card { 
      position: relative;
      background: rgba(0,0,0,0.6); 
      border-radius: 12px; 
      padding: 20px; 
      width: 220px;
      text-align: center;
      overflow: hidden;
      transition: transform 0.3s ease; 
    }
    .card:hover { transform: scale(1.05); }
    .card img { 
      width: 100%; 
      border-radius: 8px; 
    }
    .card h3 { 
      margin-top: 10px; 
      color: #fff; 
    }
    .flag-bg {
      position: absolute;
      top: 0; left: 0; 
      width: 100%; height: 100%; 
      background-size: cover; 
      background-position: center; 
      opacity: 0.15; 
      z-index: 0;
    }
    .card-content {
      position: relative; 
      z-index: 1;
    }

    /* Glow Animations */
    @keyframes redGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,0,0,0.6), 0 0 24px rgba(255,0,0,0.4);}
      50% { box-shadow: 0 0 20px rgba(255,0,0,0.9), 0 0 40px rgba(255,0,0,0.7);}
    }
    @keyframes greenGlow {
      0%,100% { box-shadow: 0 0 12px rgba(0,255,0,0.6), 0 0 24px rgba(0,255,0,0.4);}
      50% { box-shadow: 0 0 20px rgba(0,255,0,0.9), 0 0 40px rgba(0,255,0,0.7);}
    }
    @keyframes yellowGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,255,0,0.6), 0 0 24px rgba(255,255,0,0.4);}
      50% { box-shadow: 0 0 20px rgba(255,255,0,0.9), 0 0 40px rgba(255,255,0,0.7);}
    }
    @keyframes pinkGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,105,180,0.6), 0 0 24px rgba(255,105,180,0.4);}
      50% { box-shadow: 0 0 20px rgba(255,105,180,0.9), 0 0 40px rgba(255,105,180,0.7);}
    }
    @keyframes orangeGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,140,0,0.6), 0 0 24px rgba(255,140,0,0.4);}
      50% { box-shadow: 0 0 20px rgba(255,140,0,0.9), 0 0 40px rgba(255,140,0,0.7);}
    }
    @keyframes whiteGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,255,255,0.6), 0 0 24px rgba(255,255,255,0.4);}
      50% { box-shadow: 0 0 20px rgba(255,255,255,0.9), 0 0 40px rgba(255,255,255,0.7);}
    }
    @keyframes silverGlow {
      0%,100% { box-shadow: 0 0 12px rgba(192,192,192,0.6), 0 0 24px rgba(192,192,192,0.4);}
      50% { box-shadow: 0 0 20px rgba(192,192,192,0.9), 0 0 40px rgba(192,192,192,0.7);}
    }

    .spain { animation: redGlow 3s infinite; }
    .brazil { animation: greenGlow 3s infinite; }
    .colombia { animation: yellowGlow 3s infinite; }
    .thailand { animation: pinkGlow 3s infinite; }
    .ethiopia { animation: orangeGlow 3s infinite; }
    .panama { animation: whiteGlow 3s infinite; }
    .aws-card { 
      animation: silverGlow 3s infinite; 
      width: 440px; /* wider so it balances in the last row */
    }
  </style>
</head>
<body>
  <h1>🌍 World Beauties Showcase 🌍</h1>

  <!-- Row 1 -->
  <div class="cards">
    <div class="card spain">
      <div class="flag-bg" style="background-image:url('https://flagcdn.com/w320/es.png');"></div>
      <div class="card-content">
        <img src="https://images.squarespace-cdn.com/content/v1/55f45174e4b0fb5d95b07f39/c41c0241-747f-46ca-a3d8-e773265bd395/Vogue%2BSpain%2BJuly%2B2017%2B-%2B4.jpg" alt="Spain Lady">
        <h3>Spain</h3>
      </div>
    </div>
    <div class="card brazil">
      <div class="flag-bg" style="background-image:url('https://flagcdn.com/w320/br.png');"></div>
      <div class="card-content">
        <img src="https://beauty-around.com/images/sampledata/Brazilian_model/raica-oliveira-113761.jpg" alt="Brazil Lady">
        <h3>Brazil</h3>
      </div>
    </div>
    <div class="card colombia">
      <div class="flag-bg" style="background-image:url('https://flagcdn.com/w320/co.png');"></div>
      <div class="card-content">
        <img src="https://i.pinimg.com/originals/52/f9/94/52f994df7257d76a55f4fb086d76955e.jpg" alt="Colombia Lady">
        <h3>Colombia</h3>
      </div>
    </div>
  </div>

  <!-- Row 2 -->
  <div class="cards">
    <div class="card thailand">
      <div class="flag-bg" style="background-image:url('https://flagcdn.com/w320/th.png');"></div>
      <div class="card-content">
        <img src="https://imgix.ranker.com/user_node_img/50149/1002971038/original/1002971038-photo-u1711790096?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=355" alt="Thailand Lady">
        <h3>Thailand</h3>
      </div>
    </div>
    <div class="card ethiopia">
      <div class="flag-bg" style="background-image:url('https://flagcdn.com/w320/et.png');"></div>
      <div class="card-content">
        <img src="https://i.pinimg.com/736x/99/88/84/9988844e2a12c8b8457d9cacbc94566c.jpg" alt="Ethiopia Lady">
        <h3>Ethiopia</h3>
      </div>
    </div>
    <div class="card panama">
      <div class="flag-bg" style="background-image:url('https://flagcdn.com/w320/pa.png');"></div>
      <div class="card-content">
        <img src="https://bestlatinawomen.com/wp-content/uploads/2020/04/columb1-1.jpg" alt="Panama Lady">
        <h3>Panama</h3>
      </div>
    </div>
  </div>

  <!-- Row 3 -->
  <div class="cards">
    <div class="card aws-card">
      <h3>AWS Instance Details</h3>
      <p><b>Instance Name: <span>$hostname_fqdn</span></b></p>
      <p><b>Private IP: <span>$local_ipv4</span></b></p>
      <p><b>AZ: <span>$az</span></b></p>
      <p><b>VPC: <span>$vpc</span></b></p>
    </div>
  </div>

</body>
</html>
EOF
```

Click **Launch instance** on the right-hand side.

  ![launch-instance-details-pt4](/Screenshots/launch-instance-details-pt4.jpg)

---

## 4️⃣ Verify Your Instance

- You should see a green banner:  
   **“Successfully initiated launch to instance ID (i-xxxxxxxxxxxxx)”**

  ![launch-instance-complete](/Screenshots/launch-instance-complete.jpg)

- Click the **Instance ID** link

- In the **Instance Summary**, locate **Public DNS** and copy the value

  ![instance-summary-details](/Screenshots/instance-summary-details.jpg)

---

## 5️⃣ Access Your Webserver

- Open a new browser tab  
- Visit:  

   ```plaintext
   http://<your-public-dns>
   ```

### 🎉 **Class 7 - Week 1 Homework - WebServer**

  ![class-7-week1-homework.jpg](/Screenshots/class-7-week1-homework.jpg)

---

## ✅ Notes

- Use the **.pem key pair** for SSH access if you need to log into the instance.  
- You can replace `/var/www/html/index.html` with your own **HTML/CSS/JS** files to customize your webserver.  
- Always stop or terminate instances you no longer need to avoid unnecessary AWS costs.  

---

## 🛠️ Troubleshooting

If your webserver doesn’t load:

1. **Security Group Rules**
   - Make sure inbound rules allow **HTTP (port 80)** from `0.0.0.0/0`.  
   - Double-check you attached the **correct security group** (`class-7-week1-homework`) to your instance.

2. **Instance State**
   - Verify the instance is in a **running** state in the EC2 Dashboard.  
   - Confirm it has a **Public IPv4 address** assigned.

3. **Apache Service**
   - SSH into the instance and check if Apache is running:  

     ```bash
     sudo systemctl status httpd
     ```

   - If not running, start it manually:  

     ```bash
     sudo systemctl start httpd
     ```

4. **User Data Script**
   - Review the `cloud-init` logs to see if the script executed properly:  

     ```bash
     cat /var/log/cloud-init-output.log
     ```

5. **Firewall or Browser Issues**
   - Ensure no local firewall or corporate proxy is blocking port 80.  
   - Test with both the **Public IPv4** and the **Public DNS name** in your browser.

6. **Check File Content**
   - Confirm the **HTML** file exists and isn’t empty:  

     ```bash
     cat /var/www/html/index.html
     ```

> 💡 If all else fails, terminate the instance and **re-launch** with the same steps to ensure your configuration is applied cleanly.

---

## 📝 Summary

This guide walked through creating a **custom webserver** on AWS EC2 from scratch.  
You:  

- Created a **security group** (`class-7-week1-homework`) with inbound HTTP (port 80).  
- Launched an **EC2 instance** (`class-7-week1-homework`) using default Amazon Linux 2 settings.  
- Added a **user data script** to install Apache, enable the service, and serve a custom HTML page.  
- Verified the instance and retrieved its **Public DNS** to access the webserver.  
- Learned how to **customize HTML content**, including adding your own gratitude message and destination image.  
- Included a **troubleshooting checklist** to solve common issues (security group rules, Apache service, cloud-init logs, etc.).  

👉 Completing this challenge means you’ve built and customized a **live webserver in the cloud**,  a key step in the **Class 7 - Week 1 Homework** journey.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney
