# soc-elk-stack-m4
Security Operations Center using ELK Stack on Apple Silicon M4 - Real-time threat detection and analysis
 SOC ELK Stack on Apple Silicon M4

A Security Operations Center implementation using Elasticsearch, Logstash, and Kibana optimized for ARM64 architecture on Apple Silicon M4.

What This Project Demonstrates

- Complete SIEM Implementation: Full ELK stack deployment from scratch
- ARM64 Optimization: Native performance on Apple Silicon
- Real Security Analysis: Processing 8 different types of security events
- Threat Detection: Authentication failures, brute force, malware, port scans
- Data Visualization: Kibana dashboards for security monitoring

 Architecture

Hardware: MacBook M4 Air (16GB RAM, 256GB storage optimized)
Virtualization: UTM (ARM64 native)
OS : Ubuntu Server 22.04 ARM64
Stack: Elasticsearch 8.19.4, Logstash, Kibana (all ARM64)

Security Events Processed

1. Authentication Failures - Failed login attempts with source tracking
2. Brute Force Attacks  - Multiple failed attempts from same IP
3. Malware Detection - File signature analysis and alerts
4. Port Scanning  - Network reconnaissance detection
5. Privilege Escalationv - Admin access attempts monitoring

## Current Status

- ✅  8 security events  successfully processed and analyzed
- ✅  5 event types  with different severity levels
- ✅  Real-time visualization in Kibana dashboard
- ✅  Cross-platform access  (macOS → Ubuntu VM)
- ✅ Production-ready configuration  with optimized performance
Screenshots

Kibana Security Dashboard
![Security Events](screenshots/kibana-security-events.png)

 System Architecture
![Architecture](screenshots/system-architecture.png)

 Installation

 1. Create Ubuntu VM with UTM (6GB RAM, 60GB storage)
 2. Install ELK Stack
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-11-jdk -y

 Add Elasticsearch repository and install
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt update
sudo apt install elasticsearch logstash kibana -y

 3. Configure and start services
sudo systemctl enable elasticsearch logstash kibana
sudo systemctl start elasticsearch logstash kibana

 4. Add security events
./scripts/add-security-events.sh
<img width="468" height="641" alt="image" src="https://github.com/user-attachments/assets/8b7a7232-aab6-4d29-a9c2-17814ca14061" />
