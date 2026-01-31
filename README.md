# Laravel en Docker – Taller de Fundamentos

Este proyecto es un ejemplo **mínimo pero real** de una aplicación Laravel ejecutándose dentro de un contenedor Docker.

El objetivo no es construir una arquitectura compleja, sino **entender cómo Docker nos permite ejecutar un proyecto Laravel sin instalar manualmente su entorno de desarrollo**.

---

## 🧩 ¿Qué necesita normalmente un proyecto Laravel?

Para ejecutar este proyecto **sin Docker**, tu sistema debería tener instalado:

- PHP (versión compatible con Laravel)
- Extensiones de PHP:
    - OpenSSL
    - PDO
    - Mbstring
    - Tokenizer
    - XML
    - Ctype
    - JSON
- Composer
- Un servidor web o el servidor embebido de PHP
- Variables de entorno correctamente configuradas

Esto suele provocar problemas como:

- Diferentes versiones de PHP entre equipos
- “En mi máquina sí funciona”
- Conflictos con otros proyectos
- Instalaciones largas o errores difíciles de depurar

---

## 🐳 ¿Cómo soluciona esto Docker?

Docker nos permite **describir todo el entorno de ejecución en un archivo llamado `Dockerfile`**.

En lugar de pedir:
> “Instala PHP, Composer y estas extensiones…”

Pedimos:
> “Instala Docker y ejecuta este contenedor”.

Con Docker:
- El entorno es **idéntico para todos**
- No instalas PHP ni Composer en tu sistema
- No hay conflictos entre proyectos
- El proyecto se puede ejecutar en cualquier máquina con Docker

---

## 📦 Requisitos para ejecutar este proyecto

### ÚNICO requisito
- **Docker** (Docker Desktop o Docker Engine)

No necesitas:
- PHP instalado
- Composer instalado
- Servidor web
- Configuración adicional del sistema

---

## 🚀 Cómo ejecutar el proyecto con Docker

### 1. Construir la imagen

Desde la raíz del proyecto:

```bash
docker build -t laravel-docker-demo .
```

Esto:
- Lee el Dockerfile
- Descarga la imagen base
- Instala dependencias
- Copia el proyecto
- Genera una imagen lista para ejecutarse

### 2. Ejecutar el contenedor
```
docker run -p 8000:8000 laravel-docker-demo
```

Esto:
- Crea un contenedor a partir de la imagen
- Expone el puerto 8000
- Arranca el servidor de Laravel

### 3. Abrir la aplicación

En tu navegador visita:

```
http://localhost:8000
```

Deberías ver la vista de **Laravel corriendo dentro de Docker 🐳✨**

## 📚 ¿Qué estamos aprendiendo aquí?

Con este proyecto aprendemos:
- Qué es una imagen Docker
- Qué es un contenedor
- Qué es un Dockerfile
- Cómo Docker encapsula un entorno de desarrollo
- Cómo ejecutar Laravel sin instalar su stack localmente
