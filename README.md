# 🚀 Week 2 Homework — Custom Webserver on EC2 & Ping Google DNS

[![Repo](https://img.shields.io/badge/Repo-class--7--homework-181717?logo=github)](https://github.com/tiqsclass6/class-7-homework)
![Cloud-AWS](https://img.shields.io/badge/Cloud-AWS-orange?logo=amazon-aws&logoColor=white)
![Service-EC2](https://img.shields.io/badge/Service-EC2-blue?logo=amazonec2&logoColor=white)
![WebServer-Apache](https://img.shields.io/badge/WebServer-Apache-red?logo=apache&logoColor=white)
![Frontend-HTML5](https://img.shields.io/badge/Frontend-HTML5-green?logo=html5&logoColor=white)

This guide walks you through creating a **custom webserver** hosted on an AWS EC2 instance.  
Follow each step carefully and you’ll have your own running webserver serving your custom HTML.

---

## 📘 Task

### HW - Class 7 Homwork  

- Must be in a **GitHub repo link**  
- Modify currently running web server from 1.1 to add the following lines:  

  ```plaintext
  Nickname: T.I.Q.S.
  Desired Income: 500,000 USD
  Group Leader: John Sweeney
  ```

---

## 1️⃣ Create a Security Group

1. Log into the **AWS Console**
2. Go to the **EC2 Dashboard**
3. In the search bar, type **“Security group”**

   ![search-security-group](/Screenshots/search-security-groups.jpg)

4. Open **Security Groups** in a new tab

5. On the right-hand side, click the orange button **Create security group**

   ![create-security-group](/Screenshots/create-security-group.jpg)

### Security Group Details

- **Name:** `class-7-week2-homework`  
- **Description:** `class-7-week2-homework`  
- **VPC:** Default (leave as default VPC)  

### Inbound Rules

| Type | Protocol | Port Range | Source | Description |
|------|----------|------------|--------|-------------|
| `HTTP` | TCP      | 80         | Anywhere (0.0.0.0/0) | `webserver` or `HTTP` |
| `SSH`  | TCP      | 22         | Anywhere (0.0.0.0/0) | `SSH` |
| `All ICMP` | TCP      | 80         | Anywhere (0.0.0.0/0) | `ICMP` |

![security-group-details-pt1](/Screenshots/security-group-details-pt1.jpg)

> ⚠️ Outbound rules: **Skip this section entirely**

### Tags (Optional)

- **Key:** `Name`  
- **Value:** `class-7-week2-homework`

Click **Create security group**.

![security-group-details-pt2](/Screenshots/security-group-details-pt2.jpg)  
![security-group-completed](/Screenshots/security-group-completed.jpg)  
![security-group-results](/Screenshots/security-group-results.jpg)

---

## 2️⃣ Launch an EC2 Instance

1. Return to the **EC2 Dashboard**  
2. Click **Launch instance** (open in a new tab)

   ![launch-instance](/Screenshots/launch-instance.jpg)

### Instance Details

- **Name:** `class-7-week2-homework`  
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
- **Firewall (Security Groups):** Select **Existing Security Group** → choose **`class-7-week2-homework`**

### Storage

- Default: `1 x 8 GiB gp3`

![launch-instance-details-pt3](/Screenshots/launch-instance-details-pt3.jpg)

---

## 3️⃣ Add User Data (Custom Script)

1. Expand the **Advanced Details** section  
2. Scroll to **User data (optional)**  
3. Paste in your **custom script** (Apache + HTML)

`week2.sh`:

```bash
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
  <title>Class 7 - Week 2 Homework</title>
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
    h1 {
      color: #ffffff;
      margin-top: 20px;
    }
    img {
      max-width: 75%;
      height: auto;
      border-radius: 8px;
      animation: tealPulse 3s infinite;
      transition: transform 0.3s ease;
    }
    img:hover {
      transform: scale(1.05);
    }
    .cards {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
      margin: 30px auto;
      max-width: 90%;
    }
    .card {
      background: rgba(0,0,0,0.7);
      border-radius: 12px;
      padding: 20px 30px;
      flex: 1 1 300px;
      max-width: 500px;
      text-align: left;
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: scale(1.05);
    }
    .card h3 {
      margin-top: 0;
      color: #ffcc00;
      text-align: center;
    }
    .highlight { color: #00ffcc; }
    .red { color: #ff4444; }
    .yellow { color: #ffeb3b; }

    @keyframes tealPulse {
      0%, 100% { box-shadow: 0 0 12px rgba(0,255,204,0.6), 0 0 24px rgba(0,255,204,0.4); }
      50% { box-shadow: 0 0 20px rgba(0,255,204,0.9), 0 0 40px rgba(0,255,204,0.7); }
    }
    @keyframes goldPulse {
      0%, 100% { box-shadow: 0 0 12px rgba(255,215,0,0.6), 0 0 24px rgba(255,215,0,0.4); }
      50% { box-shadow: 0 0 20px rgba(255,215,0,0.9), 0 0 40px rgba(255,215,0,0.7); }
    }
    @keyframes redPulse {
      0%, 100% { box-shadow: 0 0 12px rgba(255,50,50,0.6), 0 0 24px rgba(255,50,50,0.4); }
      50% { box-shadow: 0 0 20px rgba(255,50,50,0.9), 0 0 40px rgba(255,50,50,0.7); }
    }

    .aws-card { animation: goldPulse 3s infinite; }
    .deliverables-card { animation: redPulse 3s infinite; }
  </style>
</head>
<body>
  <h1>Class 7 - Week 2 Homework</h1>

  <img src="https://i.pinimg.com/736x/e5/56/67/e5566725cc651f4a14ed54088bfd0e55.jpg" alt="Rio de Janeiro, Brazil">

  <div class="cards">
    <div class="card aws-card">
      <h3>AWS Instance Details</h3>
      <p><b>Instance Name: <span class="highlight">$hostname_fqdn</span></b></p>
      <p><b>Instance Private IP Address: <span class="highlight">$local_ipv4</span></b></p>
      <p><b>Availability Zone: <span class="highlight">$az</span></b></p>
      <p><b>Virtual Private Cloud (VPC): <span class="highlight">$vpc</span></b></p>
    </div>

    <div class="card deliverables-card">
      <h3>Task Deliverables</h3>
      <p><b>Nickname: <span class="red">T.I.Q.S.</span></b></p>
      <p><b>Desired Income: <span class="red">500,000 USD</span></b></p>
      <p><b>Group Leader: <span class="yellow">John Sweeney</span></b></p>
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

1. Open a new browser tab  
2. Visit:  

   ```plaintext
   http://<your-public-dns>
   ```

3. 🎉 **Class 7 - Week 2 Homework - WebServer**

   ![aws-be-a-man-1.1.jpg](/Screenshots/be-a-man-1.1.jpg)

---

## 6️⃣ Connect into your EC2 Instance

Sometimes you need to **ping the Internet** to verify Port 80 is open in your new instance.

1. Go to your **Instance details** in the AWS Console.
   - Click **Connect**
   - Leave settings as default and click **Connect** again

    ![ec2-instance-console1](/Screenshots/ec2-instance-console1.jpg)
    ![ec2-instance-console2](/Screenshots/ec2-instance-console2.jpg)

2. The Linux console will open. Type:  

   ```bash
   ping 8.8.8.8
   ```

   ![sudo-vim-ec2-instance](/Screenshots/sudo-vim-ec2-instance.jpg)

3. Press `CTRL + Z` to stop the ping  

   ![be-a-man-1.2.jpg](/Screenshots/be-a-man-1.2.jpg)

---

## 🛠️ Troubleshooting

If your webserver doesn’t load:

1. **Security Group Rules**  
   - Inbound rules must allow HTTP (port 80) from `0.0.0.0/0`.  
   - Ensure you attached the correct SG (`class-7-week2-homework`).  

2. **Instance State**  
   - Check that the instance is running and has a Public IPv4.  

3. **Apache Service**  

   ```bash
   sudo systemctl status httpd
   sudo systemctl start httpd
   ```

4. **User Data Script**  

   ```bash
   cat /var/log/cloud-init-output.log
   ```

5. **Firewall/Browser**  
   - Ensure nothing blocks port 80 locally.  
   - Try both Public IPv4 and DNS.  

💡 If all else fails, terminate the instance and **relaunch** with these steps.

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.  
- **Group Leader:** John Sweeney
