---
title: PHP 7.1 Sample Application
---

# 🚀 PHP 7.1 Sample Application - Containerized

Este repositorio contiene una aplicación PHP 7.1 de ejemplo, que ha sido **containerizada usando Docker** siguiendo buenas prácticas. La solución implementa dos contenedores: uno para la aplicación PHP con Apache y otro para la base de datos MariaDB. Además, se ha utilizado Composer para la gestión de dependencias y se han corregido múltiples rutas internas para garantizar la ejecución exitosa del entorno.

---

## 🧩 Tecnologías utilizadas

- PHP 7.1 + Apache
- MariaDB 10.5
- Docker & Docker Compose
- Composer 2.2 (compatible con PHP 7.1)
- Bootstrap 3.4
- Negotiation (willdurand/negotiation)

---

## 📁 Estructura del repositorio

```bash
├── config-dev/          # Configuración del virtual host de Apache
├── dic/                 # Contenedores de dependencias (DI)
├── logs/                # Logs personalizados (errores)
├── sql/                 # Dump inicial de la base de datos
├── src/                 # Clases PHP organizadas por dominio
├── web/                 # Archivos accesibles desde el navegador (entrypoints)
├── bootstrap.php        # Bootstrap del entorno
├── composer.json        # Dependencias PHP
├── Dockerfile           # Imagen personalizada para PHP + Apache + Composer
├── docker-compose.yml   # Orquestación de contenedores
└── README.md            # Este archivo


# PHP 7.1 sample application

Sample PHP applications that uses:
* Dependency Injection
* Apache routing
* Composer (aka: Not reinventing the wheel)

## Requirements

* Unix-like operating systems
* Apache

# PHP 7.1 sample application

Sample PHP applications that uses:
* Dependency Injection
* Apache routing
* Composer (aka: Not reinventing the wheel)

## Requirements

* Unix-like operating systems
* Apache
* MariaDB/MySQL
* PHP >= 7.1
* Command line tools `make` & `wget`

## Setup

1. Run `make` from project root.
2. Create a 'sampleuser' MariaDB/MySQL account, by default, application is configured to use password 'samplepass'.
3. Create the 'sample' database and load [sql/db.sql](/sql/db.sql).
4. Configure Apache:
```apache
<VirtualHost *:80>
    ServerName %application.host.name%
    DocumentRoot /%path-to-repository%/web

    <Directory /%path-to-repository%>
        Require all granted
        AllowOverride all
    </Directory>

    php_admin_value include_path "/%path-to-repository%/"

    Include /%path-to-repository%/config/vhost.conf
</VirtualHost>
```

You are all set, point your browser to http://%application.host.name%/
