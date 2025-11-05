# Use lightweight Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY app ./app

# Make directory for SQLite DB (optional mount)
VOLUME ["/data"]
ENV DB_PATH=/data/mirror.db

# Expose app port
EXPOSE 4004

# Start FastAPI app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "4004", "--workers", "1"]
