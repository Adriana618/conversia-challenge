# Build Stage
FROM python:3.12-slim-bullseye AS builder

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Instalar dependencias necesarias para compilar paquetes nativos
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar los archivos de requerimientos y compilarlos
COPY requirements/ /app/requirements/
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements/prod.txt

# Final Stage
FROM python:3.12-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Copiar dependencias del build stage
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

# Copiar el código fuente
COPY . .

# Exponer el puerto para la API
EXPOSE 8000

# Ejecutar la aplicación FastAPI con Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]