
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies first (good for caching)
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy only essential app files
COPY app.py .
COPY templates/ templates/
COPY static/ static/
COPY insurance.csv .

# Expose Flask port
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]



