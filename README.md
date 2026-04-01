# 🚀 DevOps CI/CD Pipeline Project

<p align="center">
  <b>Automated Build • Multi-Arch Docker • CI/CD • AWS Deployment</b><br>
  <i>From Code Commit → Live Application in Seconds</i>
</p>

---

## Overview

This project deploys a simple web app to an AWS EC2 instance automatically every time code is pushed to the `main` branch. No manual steps needed after the initial setup.

---

## Architecture Diagram

```
Developer
    |
    | git push
    v
GitHub Repository
    |
    | triggers
    v
GitHub Actions
    |
    |── Build Docker Image (multi-arch: amd64 + arm64)
    |── Push to DockerHub
    |
    | SSH
    v
AWS EC2 Instance
    |
    |── Pull latest image
    |── Stop old container
    |── Start new container
    |
    v
Live App (Nginx serving HTML/CSS/JS)
```

---

## Tech Stack

| Tool | Purpose |
|------|---------|
| GitHub Actions | CI/CD automation |
| Docker | Containerization |
| Nginx | Web server |
| AWS EC2 | Cloud hosting |
| DockerHub | Image registry |

---

## Project Structure

```
DevOps-app_Project1/
├── app/
│   ├── index.html
│   ├── style.css
│   └── script.js
├── .github/
│   └── workflows/
│       └── cicd.yml
├── Dockerfile
├── nginx.conf
└── deploy.sh
```

---

## How to Run Locally

```bash
# Build the Docker image
docker build -t devops-app .

# Run the container
docker run -d -p 80:80 devops-app
```

Then open your browser at `http://localhost`.

---

## CI/CD Pipeline

Every push to `main` triggers the following steps automatically:

1. **Build** — Docker image is built with multi-arch support (`amd64` + `arm64`)
2. **Push** — Image is pushed to DockerHub
3. **Deploy** — Pipeline SSHs into EC2, pulls the latest image, and restarts the container

Secrets like DockerHub credentials and the EC2 SSH key are stored securely in GitHub Secrets.

---

## What's Next

- [ ] Add a test stage before deployment
- [ ] Set up monitoring with Prometheus & Grafana
- [ ] Use Terraform to provision the EC2 infrastructure
- [ ] Implement blue-green deployment for zero downtime
- [ ] Add image vulnerability scanning in the pipeline

---

## Key Concepts

**Containerization**
The app is packaged into a Docker image, so it runs the same way on any machine — no "works on my machine" problems.

**CI/CD Automation**
GitHub Actions watches for code changes and handles the entire build-push-deploy flow automatically, removing the need for manual deployments.

**Multi-Architecture Build**
Using Docker Buildx, the image is built for both `amd64` (AWS EC2) and `arm64` (Apple Silicon / local dev), solving cross-platform issues.

**Secrets Management**
Sensitive credentials (DockerHub token, EC2 SSH key) are stored in GitHub Secrets and never hardcoded in the codebase.

**Infrastructure on the Cloud**
The app runs inside a Docker container on an AWS EC2 instance, making it easy to scale or move later.

---

## Conclusion

This project covers the full journey from writing code to having it live on the internet — automatically. It demonstrates a real-world DevOps workflow that eliminates manual steps, keeps environments consistent, and lays the groundwork for more advanced practices like monitoring, IaC, and zero-downtime deployments in the future.

---

## Author

**Vigneshwari** — DevOps & Cloud Enthusiast
