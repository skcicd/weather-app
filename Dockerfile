# Minimal python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy a file with a list of requirements 
COPY requirements.txt .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files
COPY static/ /app/static
COPY templates/ /app/templates
COPY weather.py /app/weather.py

# Env. variables for flask
ENV FLASK_HOST=0.0.0.0
ENV FLASK_PORT=5000

# Указываем порт, который будет использовать приложение
EXPOSE 5000

# Определяем ENTRYPOINT для запуска команды
ENTRYPOINT ["python"]

# Определяем команду по умолчанию для приложения
CMD ["weather.py"]
