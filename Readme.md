# FastAPI App with PostgreSQL and Docker

Este proyecto es una aplicación basada en **FastAPI** con integración a **PostgreSQL**. Usa **Docker** y **Docker Compose** para el despliegue y tiene soporte para pruebas, análisis de cobertura y linter.

---

## **Instalación**

### **Requisitos Previos:**
- **Docker** y **Docker Compose** instalados.
- **Python 3.12** instalado en tu entorno local.
- `pip` actualizado:
  ```bash
  pip install --upgrade pip
  ```
- **pip-tools** para manejar dependencias:
  ```bash
  pip install pip-tools
  ```

---

## **Estructura del Proyecto**

```text
/app
│
├── requirements/
│   ├── base.in
│   ├── dev.in
│   ├── prod.in
│   ├── base.txt
│   ├── dev.txt
│   └── prod.txt
├── tests/
│   └── test_main.py
├── Dockerfile
├── docker-compose.yaml
├── main.py
├── models.py
├── postgres.py
├── .flake8
└── Makefile
```

---

## **Uso del Makefile**

El **Makefile** facilita tareas comunes como levantar el servidor, ejecutar pruebas y administrar dependencias.

### **Comandos Disponibles:**

1. **Compilar archivos de requerimientos:**
   ```bash
   make compile-requirements
   ```
   Genera los archivos `base.txt`, `dev.txt` y `prod.txt` desde sus respectivos `.in`.

2. **Instalar dependencias de desarrollo:**
   ```bash
   make install-dev
   ```
   Instala las dependencias necesarias para desarrollo.

3. **Levantar el servidor:**
   ```bash
   make runserver
   ```
   Levanta los servicios con Docker Compose y ejecuta el servidor en modo desarrollo.

4. **Ejecutar pruebas con cobertura:**
   ```bash
   make test
   ```
   Ejecuta las pruebas usando **pytest** y muestra la cobertura del código.

5. **Verificar el formato del código:**
   ```bash
   make lint
   ```
   Ejecuta **flake8** para asegurarse de que el código siga las convenciones de estilo.

6. **Apagar los servicios:**
   ```bash
   make stop
   ```
   Apaga los servicios que se ejecutan en segundo plano.

7. **Limpiar contenedores y volúmenes:**
   ```bash
   make clean
   ```
   Limpia contenedores, volúmenes y dependencias huérfanas.

8. **Reconstruir las imágenes de Docker:**
   ```bash
   make build
   ```
   Reconstruye las imágenes de Docker.

---

## **Uso del Proyecto**

1. **Levantar los servicios de Docker:**
   ```bash
   make runserver
   ```
   Accede a la aplicación en tu navegador en:
   ```text
   http://localhost:8000
   ```

2. **Documentación interactiva de la API:**
   Ve a:
   ```text
   http://localhost:8000/docs
   ```
   para ver y probar los endpoints mediante la interfaz Swagger.

---

## **Pruebas**

Para ejecutar las pruebas y verificar la cobertura del código:

```bash
make test
```

---

## **Verificación de Estilo de Código**

Para asegurarte de que el código sigue las convenciones, ejecuta:

```bash
make lint
```

---

## **Desarrollo y Despliegue**

### **Desarrollo:**
- Usa `dev.txt` para instalar dependencias de desarrollo:
  ```bash
  pip install -r requirements/dev.txt
  ```

### **Producción:**
- Usa `prod.txt` para instalar solo las dependencias necesarias en producción:
  ```bash
  pip install -r requirements/prod.txt
  ```

---

## **Detener y Limpiar Servicios**

1. **Apagar los servicios:**
   ```bash
   make stop
   ```

2. **Limpiar contenedores y volúmenes:**
   ```bash
   make clean
   ```

---

## **Licencia**

Este proyecto se distribuye bajo la Licencia MIT.

---

### **Conclusión**

Este **README.md** proporciona toda la información necesaria para desarrollar, probar y desplegar la aplicación. También detalla cómo usar el **Makefile** para automatizar tareas comunes, haciendo que el flujo de trabajo sea eficiente y fácil de manejar.