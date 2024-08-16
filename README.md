# Static Website Hosting on AWS

## Project Overview

This project demonstrates how to host a static HTML web application on AWS using a robust and scalable architecture. The project leverages a variety of AWS services to ensure high availability, security, and fault tolerance. The website is hosted on EC2 instances behind an Application Load Balancer, with automatic scaling and fault tolerance across multiple Availability Zones.

## Architecture

![Alt text](Static website Architecture.pdf)

### Key Components:

1. **Virtual Private Cloud (VPC)**
   - Configured a VPC with both public and private subnets across two different availability zones.

2. **Internet Gateway**
   - Deployed to enable connectivity between VPC instances and the Internet.

3. **Security Groups**
   - Established as a network firewall to control inbound and outbound traffic to your instances.

4. **Multi-AZ Deployment**
   - Leveraged two Availability Zones to enhance system reliability and fault tolerance.

5. **Public Subnets**
   - Used for infrastructure components like the NAT Gateway and Application Load Balancer.

6. **EC2 Instance Connect Endpoint**
   - Implemented for secure connections to assets within both public and private subnets.

7. **Private Subnets**
   - Positioned web servers (EC2 instances) within private subnets for enhanced security.

8. **NAT Gateway**
   - Enabled instances in private subnets to access the Internet while remaining unreachable from the outside.

9. **Web Servers (EC2 Instances)**
   - Hosted the static website on EC2 instances.

10. **Application Load Balancer**
    - Employed to evenly distribute web traffic to an Auto Scaling Group of EC2 instances across multiple Availability Zones.

11. **Auto Scaling Group**
    - Automatically managed EC2 instances, ensuring website availability, scalability, fault tolerance, and elasticity.

12. **GitHub**
    - Stored web files on GitHub for version control and collaboration.

13. **Certificate Manager**
    - Secured application communications using SSL/TLS certificates.

14. **Simple Notification Service (SNS)**
    - Configured to alert about activities within the Auto Scaling Group.

15. **Route 53**
    - Registered the domain name and set up DNS records.

## Deployment Instructions

### Prerequisites

- AWS CLI configured with appropriate IAM permissions.
- A registered domain name.
- Terraform (optional, if using Infrastructure as Code for deployment).

### Steps to Deploy

1. **Clone the Repository**
   ```bash
   git clone https://github.com/chagak/skating-website.git
   ```

2. **Connect to the EC2 Instance**
   - SSH into your EC2 instance within the private subnet using EC2 Instance Connect or an SSH key.

3. **Run the Setup Script**
   - Execute the following script to deploy the static website on your EC2 instance:
   ```bash
   #!/bin/bash
   
   # Switch to the root user
   sudo su

   # Update all installed packages
   yum update -y

   # Install Apache HTTP Server
   yum install -y httpd

   # Change to the Apache web root
   cd /var/www/html

   # Install Git
   yum install git -y

   # Clone the GitHub repository
   git clone https://github.com/chagak/skating-website.git

   # Copy files to the Apache web root
   cp -r skating-website/* /var/www/html/

   # Remove the cloned repository directory
   rm -rf skating-website/

   # Enable Apache to start on boot and start the service
   systemctl enable httpd
   systemctl start httpd
   ```

4. **Access the Website**
   - Open your web browser and navigate to your website's domain name to see the hosted static HTML web application.

## Monitoring and Alerts

- **Simple Notification Service (SNS)**: Configured to send notifications for critical events within the Auto Scaling Group.

## Security

- **SSL/TLS**: Implemented using AWS Certificate Manager to secure communications.
- **Private Subnets**: EC2 instances are hosted in private subnets to enhance security.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
