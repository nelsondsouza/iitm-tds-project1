FROM python:3.12-slim-bookworm

# Install essential system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && rm -rf /var/lib/apt/lists/*

# ✅ Create the /data folder
RUN mkdir -p /data

# Set up the application directory
WORKDIR /app

# Copy application files
COPY app.py /app
COPY tasksA.py /app
COPY tasksB.py /app

# Install FastAPI and Uvicorn
RUN pip install --no-cache-dir fastapi uvicorn

# Start the application using Uvicorn
CMD ["python", "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]