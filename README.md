# 🚀 Barbara + Docker Training (Factovia)

![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker\&logoColor=white)
![Docker Compose](https://img.shields.io/badge/Docker--Compose-Orchestration-384d54)
![Barbara](https://img.shields.io/badge/Barbara-Edge%20Platform-orange)
![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![License](https://img.shields.io/badge/License-Training-lightgrey)

---

## 📖 Overview

This repository contains **hands-on exercises** to learn how to build, run, and deploy applications using:

* Docker & Docker Compose
* Barbara platform
* Real-world deployment patterns

---

## 🎯 Objectives

By completing this training, you will be able to:

* Build Docker images from scratch
* Run and debug containers locally
* Use Docker Compose for multi-service apps
* Manage persistence, networking, and configs
* Apply Barbara-specific deployment constraints
* Deploy applications to Barbara Edge nodes

---

## 🧱 Prerequisites

* Docker installed
* Docker Compose v2+
* VSCode (recommended)
* Barbara account
* API Credentials

---

## 📚 Exercises

### 1️⃣ Pull & Run a Public Image

```bash
docker pull nginx
docker run -p 80:80 nginx
```

👉 Open: [http://localhost](http://localhost)

---

### 2️⃣ Build a Custom Image

```bash
docker build -t alpine-counter .
docker run alpine-counter
```

✔️ Expected: infinite counter output

---

### 3️⃣ Push Image to Registry

```bash
docker tag alpine-counter:latest <repo>/alpine-counter:1.0
docker login
docker push <repo>/alpine-counter:1.0
```

---

### 4️⃣ Dockerfile Basics

```dockerfile
FROM alpine:latest
CMD sh -c 'while true; do echo "$MESSAGE"; sleep 1; done'
```

```bash
docker run -e MESSAGE="Hello Factovia" image-name
```

---

### 5️⃣ Docker Compose – Grafana

```yaml
services:
  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
```

```bash
docker compose up
```

---

### 6️⃣ Environment Variables (`env_file`)

```yaml
env_file:
  - grafana.env
```

```env
GF_SECURITY_ADMIN_USER=admin
GF_SECURITY_ADMIN_PASSWORD=admin
```

---

### 7️⃣ Volumes (Persistence)

```yaml
volumes:
  - grafana-data:/var/lib/grafana

volumes:
  grafana-data:
```

✔️ Persist dashboards & configs

---

### 8️⃣ Networks

```yaml
networks:
  barbaraServices:
    external: true
```

✔️ Enables DNS-based communication between apps

---

### 9️⃣ Global Secrets (Barbara)

```yaml
environment:
  MY_SECRET: ${MY_SECRET}
```

```python
import os
os.getenv("MY_SECRET")
```

✔️ Injected at runtime (not in host env)

---

### 🔟 App & Global Config

```python
import json

with open('/appconfig/global.json') as f:
    data = json.load(f)
```

✔️ Mounted as JSON files (`/appconfig`)

---

### 1️⃣1️⃣ Resource Management

```yaml
deploy:
  resources:
    limits:
      cpus: "0.5"
      memory: 512M
```

---

### 1️⃣2️⃣ Device Access

```yaml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"

group_add:
  - dialout
```

---

### 1️⃣3️⃣ Restart Policies

```yaml
restart: on-failure
```

❌ Not allowed:

```yaml
restart: always
```

---

## ⚠️ Barbara Constraints

* Compose file must be:

  * `docker-compose.yml` or `.yaml`
* ❌ `privileged: true` not allowed
* ❌ Admin capabilities not allowed
* ❌ `tty` not supported
* ❌ `name` not supported
* ✅ `env_file` must be a list
* Bind mounts restricted to:

  * `./persist`
  * `./appconfig`
  * `./sys`

---

## 🧠 Core Concepts

| Concept   | Meaning                       |
| --------- | ----------------------------- |
| Image     | Template                      |
| Container | Running instance              |
| Compose   | Multi-container orchestration |
| Volumes   | Persistent storage            |
| Networks  | Service communication         |
| Secrets   | Secure runtime config         |

---

## 📦 Deployment Flow (Barbara)

```text
Code → Dockerfile → Image → docker-compose.yml → ZIP → Edge Node
```

---

## 🛠 Tooling

* 🧩 Barbara VSCode Extension
* 🐍 Python SDK (automation & API usage)

---

## 🤝 Contributing

This repo is intended for training purposes.
Feel free to fork and extend exercises.

---

## 📄 License

Internal training material – Factovia / Barbara

---
