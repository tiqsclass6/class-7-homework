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
