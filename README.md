# Week 4 Homework – Network Architectural Design

## 📌 Methodology for Subnet Choices

![ietf-logo](/Screenshots/ietf-logo.png)

For this assignment, I designed a custom AWS network architecture following **RFC 1918** private IP addressing guidelines. RFC 1918 defines three ranges of private IP addresses that are reserved for internal use within organizations and are not routable on the public internet:

- **10.0.0.0/8**  
- **172.16.0.0/12**  
- **192.168.0.0/16**

For consistency and scalability, I selected the **10.0.0.0/8** range, carving out a **/16 block (10.230.0.0/16)** dedicated to this VPC. This approach allows for a large pool of IP addresses (*256 to be exact*) while maintaining hierarchical subnet allocation across multiple Availability Zones (AZs).  

To ensure **high availability and fault tolerance**, the subnets are distributed across **three Availability Zones (us-east-1a, us-east-1b, us-east-1c)** in the **N. Virginia (us-east-1)** AWS region. Each AZ contains **1 public subnet** and **2 private subnets**, meeting the requirement of at least **3 public subnets and 6 private subnets**.  

Subnet sizing was determined using **/24 CIDR blocks**, which provide 256 IP addresses per subnet (251 usable after AWS reservations). This is a balanced choice: large enough for expected workloads but small enough to isolate services logically.  

---

## 📂 Project Structure

```plaintext
week-4-homework/
.
├── Screenshots/
│ ├── binary-game.jpg
│ ├── ietf-logo.png
│ ├── vpc-network.jpg
│ └── Week4-Network-Diagram.png
│
├── README.md
├── section-27-quiz.jpg
├── Week4-VPC-Network-Range.pdf
└── Week4-VPC-Network-Range.xlsx
```

---

## ✅ Network Architecture Diagram

  ![Network Diagram](/Screenshots/Week4-Network-Diagram.png)

---

## 🌐 Network Range Design

**VPC CIDR Block:** `10.230.0.0/16`

**Subnets by AZ:**

- **Availability Zone 1** `(us-east-1a)`  
  - **Public Subnet:** `10.230.1.0/24`  
  - **Private Subnet:** `10.230.11.0/24`  
  - **Private Subnet:** `10.230.12.0/24`  

- **Availability Zone 2** `(us-east-1b)`
  - **Public Subnet:** `10.230.2.0/24`  
  - **Private Subnet:** `10.230.13.0/24`  
  - **Private Subnet:** `10.230.14.0/24`  

- **Availability Zone 3** `(us-east-1c)`
  - **Public Subnet:** `10.230.3.0/24`  
  - **Private Subnet:** `10.230.15.0/24`  
  - **Private Subnet:** `10.230.16.0/24`  

This structure supports public-facing resources (e.g., load balancers, bastion hosts) while isolating private workloads (e.g., databases, application servers) in separate subnets.

- [Week4-VPC-Network-Range.pdf](/Week4-VPC-Network-Range.pdf)
- [Week4-VPC-Network-Range.xlsx](/Week4-VPC-Network-Range.xlsx)

---

## 📸 Screenshots

- ✅ **Subnet Range Documents:**
  ![vpc-network](/Screenshots/vpc-network.jpg)
  
- ✅ **Completed Udemy SAA Quiz:**
  ![udemy-saa-section-27.jpg](/section-27-quiz.jpg)

- ✅ **Binary Game High Score:**
  ![binary-game](/Screenshots/binary-game.jpg)

---

## 📖 References  

- Rekhter, Y., Moskowitz, B., Karrenberg, D., de Groot, G. J., & Lear, E. (1996). *RFC 1918: Address Allocation for Private Internets*. IETF. [https://www.rfc-editor.org/rfc/rfc1918](https://www.rfc-editor.org/rfc/rfc1918)  

- Amazon Web Services. (2024). *VPCs and subnets*. Retrieved from [https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)  

- Cisco Systems. (n.d.). *Binary game*. Retrieved from [https://learningcontent.cisco.com/games/binary/index.html](https://learningcontent.cisco.com/games/binary/index.html)  

- Udemy. (n.d.). *AWS Certified Solutions Architect – Associate (SAA-C03)*. Retrieved from [https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03)  

---

## ✍️ Authors & Acknowledgments

- **Author:** T.I.Q.S.
- **Group Leader:** John Sweeney
