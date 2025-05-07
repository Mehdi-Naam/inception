# Inception

**Inception** is a system administration and DevOps project from 42 School. It involves setting up a full web infrastructure using Docker and Docker Compose. The project includes WordPress, a MariaDB database, NGINX, and various Docker services with secure configuration and automation.

## 🧱 Project Overview

This project consists of building a scalable and secure web server using **Docker** containers and **Docker Compose**. Each essential service runs in its own container:

- **NGINX**: Web server with SSL (TLS) support via self-signed certificates
- **WordPress**: CMS running on PHP-FPM
- **MariaDB**: MySQL-compatible database for WordPress
- **Redis** *(optional)*: Caching layer for WordPress
- **Adminer** *(optional)*: Database management interface
- **File Structure**: Data is persisted using Docker volumes

## 📦 Services

| Service    | Description                      |
|------------|----------------------------------|
| NGINX      | Reverse proxy with SSL support   |
| WordPress  | PHP CMS hosted in container      |
| MariaDB    | MySQL database for WordPress     |
| Redis      | (Optional) Cache system          |
| Adminer    | (Optional) DB GUI (optional)     |

## 🛡️ Security

- Secure WordPress credentials using environment variables
- Auto-generation of SSL certificates (self-signed)
- Proper permission settings for volumes and files
- Docker network isolation between containers

## 🚀 Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/inception.git
cd inception
