# Variables
PIP_COMPILE = pip-compile
DOCKER_COMPOSE = docker-compose
UVICORN = uvicorn
APP_MODULE = main:app

# Generar archivos .txt desde los .in en requirements/
compile-requirements:
	$(PIP_COMPILE) requirements/base.in -o requirements/base.txt
	$(PIP_COMPILE) requirements/dev.in -o requirements/dev.txt
	$(PIP_COMPILE) requirements/prod.in -o requirements/prod.txt

# Instalar dependencias de desarrollo
install-dev:
	pip install -r requirements/dev.txt

# Instalar dependencias de producción
install-prod:
	pip install -r requirements/prod.txt

# Construir y levantar los servicios en segundo plano
runserver:
	$(DOCKER_COMPOSE) up -d
	$(UVICORN) $(APP_MODULE) --reload --host 0.0.0.0 --port 8000

# Ejecutar pruebas con coverage
test:
	pytest --cov=.

# Verificar formato de código con flake8
lint:
	flake8 .

# Apagar los servicios
stop:
	$(DOCKER_COMPOSE) down

# Limpiar contenedores y volúmenes (solo si es necesario)
clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

# Reconstruir las imágenes de Docker
build:
	$(DOCKER_COMPOSE) build