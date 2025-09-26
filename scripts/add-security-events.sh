# scripts/add-security-events.sh
#!/bin/bash
# Script to add realistic security events to your SOC platform

ELASTICSEARCH_HOST="localhost:9200"
INDEX_NAME="security-logs-$(date +%Y.%m.%d)"

echo "Adding security events to $INDEX_NAME..."

# Authentication Failure
curl -X POST "$ELASTICSEARCH_HOST/$INDEX_NAME/_doc" -H 'Content-Type: application/json' -d'{
  "timestamp": "2025-09-25T07:15:01Z",
  "event_type": "authentication_failure",
  "source_ip": "192.168.1.100",
  "username": "admin",
  "message": "Failed password for invalid user admin from 192.168.1.100",
  "severity": "high"
}'

# Brute Force Attempt
curl -X POST "$ELASTICSEARCH_HOST/$INDEX_NAME/_doc" -H 'Content-Type: application/json' -d'{
  "timestamp": "2025-09-25T07:15:05Z",
  "event_type": "brute_force_attempt",
  "source_ip": "192.168.1.100",
  "username": "root",
  "message": "Multiple failed login attempts detected",
  "severity": "critical"
}'

# Malware Detection
curl -X POST "$ELASTICSEARCH_HOST/$INDEX_NAME/_doc" -H 'Content-Type: application/json' -d'{
  "timestamp": "2025-09-25T12:30:00Z",
  "event_type": "malware_detected",
  "source_ip": "10.0.0.5",
  "filename": "suspicious.exe",
  "message": "Malware signature detected in downloaded file",
  "severity": "critical",
  "host": "workstation-01"
}'

# Port Scan
curl -X POST "$ELASTICSEARCH_HOST/$INDEX_NAME/_doc" -H 'Content-Type: application/json' -d'{
  "timestamp": "2025-09-25T12:35:00Z",
  "event_type": "port_scan",
  "source_ip": "203.0.113.10",
  "target_ports": "22,80,443,3389",
  "message": "Port scanning activity detected from external IP",
  "severity": "medium",
  "host": "firewall-01"
}'

# Privilege Escalation
curl -X POST "$ELASTICSEARCH_HOST/$INDEX_NAME/_doc" -H 'Content-Type: application/json' -d'{
  "timestamp": "2025-09-25T12:40:00Z",
  "event_type": "privilege_escalation",
  "username": "jdoe",
  "command": "sudo su -",
  "message": "User elevated privileges to root",
  "severity": "high",
  "host": "server-01"
}'

echo "Security events added successfully!"
echo "Check with: curl localhost:9200/$INDEX_NAME/_count"
