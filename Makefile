# Create script to put requirements in requirements.txt and install

# Create requirements.txt
requirements:
	uv pip compile requirements.ini > requirements.txt
	uv pip install -r requirements.txt

runserver:
	docker-compose up -d
	uvicorn src.main:app --reload