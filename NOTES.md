# 📘 DevOps Project Notes – CI/CD Pipeline with Docker & AWS

---

# 🎯 Project Overview

This project demonstrates a complete **CI/CD pipeline** that automates:

- Building a Docker image  
- Pushing it to DockerHub  
- Deploying it to AWS EC2  

---

# 🧠 Core Concepts Covered

---

# 🔹 1. What is DevOps?

DevOps is a practice that combines **development and operations** to:

- Automate workflows  
- Improve deployment speed  
- Ensure reliability  

---

# 🔹 2. What is CI/CD?

## ✅ CI (Continuous Integration)
- Automatically builds and tests code on every push  

## ✅ CD (Continuous Deployment)
- Automatically deploys code to production  

---

## 🔄 Flow in this project
Code → Build → Push → Deploy

---

# 🔹 3. GitHub Actions (CI/CD Tool)

## 📌 What it is
A CI/CD tool built into GitHub to automate workflows.

---

## 📌 Key Components

### Workflow
- YAML file defining automation (`cicd.yml`)

### Job
- A group of steps running on a runner

### Step
- Individual task inside a job

---

## 📌 Types of Steps

### 1. run
Executes shell commands
run: docker build .
---

### 2. uses
Uses prebuilt GitHub Actions
uses: docker/login-action@v2
---

## 📌 Common Actions Used

- `actions/checkout` → Fetch code  
- `docker/login-action` → Login to DockerHub  
- `docker/build-push-action` → Build & push image  
- `appleboy/ssh-action` → SSH into EC2  

---

# 🔹 4. Docker (Containerization)

## 📌 What is Docker?
A tool to package applications into containers.

---

## 📌 Why Docker?
- Works same in all environments  
- Avoids “works on my machine” issues  

---

## 📌 Key Terms

### Image
- Blueprint of application  

### Container
- Running instance of image  

---

## 📌 Commands Used
```
docker build -t devops-app .
docker run -d -p 80:80 devops-app
docker pull image-name
docker stop container
docker rm container
```

# 🔹 5. Dockerfile

## 📌 Purpose
Defines how to build Docker image

---

## 📌 Example
FROM nginx:latest

COPY app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
---

## 📌 Key Instructions

- `FROM` → Base image  
- `COPY` → Copy files  
- `RUN` → Execute commands  
- `CMD` → Default command  

---

# 🔹 6. Nginx

## 📌 Role in Project
- Acts as web server  
- Serves static files (HTML, CSS, JS)  

---

---

# 🔹 7. Multi-Architecture Issue (Important)

## ❌ Problem
- Local machine → ARM  
- EC2 → AMD64  

Docker image failed to run on EC2.

---

## ✅ Solution

Used Docker Buildx:
docker buildx build –platform linux/amd64,linux/arm64
---

## 📌 Benefit
- Image works on multiple architectures  

---

# 🔹 8. Docker Buildx

## 📌 What it is
Extended Docker builder for multi-platform builds.

---

## 📌 Why used?
To fix architecture compatibility issues.

---

---

# 🔹 9. DockerHub (Container Registry)

## 📌 Purpose
Store Docker images

---

## 📌 Flow
Build Image → Push to DockerHub → Pull on EC2
---

# 🔹 10. AWS EC2 (Deployment Server)

## 📌 What it is
Virtual machine in AWS cloud

---

## 📌 Role
- Runs Docker container  
- Hosts application  

---

---

# 🔹 11. SSH Deployment

## 📌 What is SSH?
Secure way to connect to remote server.

---

## 📌 Used for
- Running commands on EC2 from pipeline  

---

## 📌 Commands executed
```
docker pull image
docker stop container
docker rm container
docker run container
```

# 🔹 12. GitHub Secrets

## 📌 Purpose
Secure storage for sensitive data

---

## 📌 Used for

- DockerHub username/password  
- EC2 SSH key  

---

## ❌ Why not hardcode?
Security risk

---

# 🔹 13. CI/CD Pipeline Flow (Detailed)
	1.	Code pushed to GitHub
	2.	GitHub Actions triggered
	3.	Code checked out
	4.	Docker login
	5.	Image build (Buildx)
	6.	Image push to DockerHub
	7.	SSH to EC2
	8.	Pull latest image
	9.	Stop old container
	10.	Start new container
  ---

# 🔹 14. Deployment Strategy

## Current
- Stop old container → Start new container  

---

## Improvement
- Blue-Green deployment  
- Zero downtime  

---

# 🔹 15. Frontend (HTML, CSS, JS)

## 📌 Purpose
- Simple UI to verify deployment  

---

## 📌 Why added?
- Visual confirmation of CI/CD  
- Makes project realistic  

---

---

# 🔹 16. Key Learnings

- CI/CD pipeline design  
- Docker fundamentals  
- Multi-architecture builds  
- Secure deployment  
- Cloud deployment on EC2  
- Debugging real-world issues  

---

# 🎤 Advanced Interview Questions & Answers

---

# 🔥 CI/CD Advanced

## ❓ What is the difference between Continuous Deployment and Continuous Delivery?

- **Continuous Delivery** → Code is ready to deploy, but manual approval needed  
- **Continuous Deployment** → Code is automatically deployed to production  

---

## ❓ How do you design a robust CI/CD pipeline?

- Add build stage  
- Add test stage  
- Add security scanning  
- Add approval step (for production)  
- Add rollback strategy  

---

## ❓ How would you add testing to your pipeline?

- Unit tests → during build  
- Integration tests → before deploy  
- Fail pipeline if tests fail  

---

## ❓ How do you handle pipeline failures?

- Check logs  
- Identify failing step  
- Fix issue and re-run  
- Use retries for transient errors  

---

# 🐳 Docker Advanced

---

## ❓ What are Docker layers?

- Each instruction in Dockerfile creates a layer  
- Layers are cached → faster builds  

---

## ❓ How do you optimize Docker images?

- Use lightweight base image (alpine)  
- Reduce layers  
- Use `.dockerignore`  
- Remove unnecessary files  

---

## ❓ Difference between CMD and ENTRYPOINT?

| CMD | ENTRYPOINT |
|-----|-----------|
| Default command | Fixed command |
| Can be overridden | Hard to override |

---

## ❓ What is Docker networking?

- Allows containers to communicate  
- Types:
  - bridge  
  - host  
  - overlay  

---

## ❓ What is Docker volume?

- Persistent storage for containers  
- Data is not lost when container stops  

---

# ☁️ Cloud & EC2

---

## ❓ How do you secure an EC2 instance?

- Use key-based authentication  
- Restrict ports using security groups  
- Disable root login  
- Use IAM roles  

---

## ❓ What is a Security Group?

- Virtual firewall controlling inbound/outbound traffic  

---

## ❓ Difference between Public and Private EC2?

| Public | Private |
|--------|--------|
| Has internet access | No direct internet |
| Used for web apps | Used for backend |

---

# 🔐 Security

---

## ❓ Why use GitHub Secrets?

- Prevent exposure of sensitive data  
- Secure credentials in pipeline  

---

## ❓ What happens if secrets are exposed?

- Unauthorized access  
- Security breach  

---

## ❓ How to improve pipeline security?

- Use least privilege  
- Rotate secrets  
- Use encrypted variables  

---

# 🚀 Deployment & Scaling

---

## ❓ What is Blue-Green Deployment?

- Two environments:
  - Blue (current)
  - Green (new)
- Switch traffic after testing  

---

## ❓ What is Canary Deployment?

- Deploy to small % of users first  
- Gradually increase  

---

## ❓ How would you scale this application?

- Move to Kubernetes  
- Use load balancer  
- Use auto-scaling  

---

# 🔧 Troubleshooting Scenarios (VERY IMPORTANT)

---

## ❓ Pipeline succeeds but app not updated. Why?

Possible reasons:
- Old container still running  
- Image not updated  
- Browser cache  

---

## ❓ Docker container is running but app not accessible?

Check:
- Port mapping  
- Security group  
- Application logs  

---

## ❓ Image works locally but not on EC2?

- Architecture mismatch  
- Missing dependencies  
- Incorrect configuration  

---

## ❓ SSH connection fails in pipeline?

- Wrong key  
- Incorrect permissions  
- Wrong username or IP  

---

## ❓ Docker push fails with permission error?

- Not logged in  
- Wrong repository name  
- Missing permissions  

---

# 🧠 Design-Based Questions

---

## ❓ How would you improve your current project?

- Add testing stage  
- Add monitoring  
- Add Kubernetes deployment  
- Add Terraform  

---

## ❓ How would you make deployment zero downtime?

- Use reverse proxy (Nginx)  
- Use Blue-Green strategy  
- Use load balancer  

---

## ❓ How would you implement rollback?

- Use versioned Docker images  
- Deploy previous stable version  

---

## ❓ How would you monitor your application?

- Use Prometheus for metrics  
- Use Grafana for dashboards  
- Use logs for debugging  

---

# ⚡ Rapid Fire Advanced

---

## ❓ What is Infrastructure as Code?
Managing infrastructure using code (Terraform)

---

## ❓ What is idempotency?
Same result even if executed multiple times  

---

## ❓ What is a load balancer?
Distributes traffic across servers  

---

## ❓ What is container orchestration?
Managing multiple containers (Kubernetes)

---

# 🎯 Final Tip

In interviews:
- Always explain with examples  
- Mention your project  
- Show problem-solving ability  

---

🚀 These questions cover beginner → advanced DevOps interviews

---

# 🔹 18. Future Improvements

- Kubernetes deployment  
- Terraform (IaC)  
- Monitoring (Prometheus, Grafana)  
- Zero downtime deployment  

---

# 🎯 Final Summary

This project covers:

- DevOps fundamentals  
- CI/CD automation  
- Docker & containerization  
- Cloud deployment  
- Real-world debugging  

---

🚀 This is a strong foundation for becoming a DevOps Engineer
