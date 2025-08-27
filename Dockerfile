FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir \
    flask \
    flask-cors \
    streamrip \
    gunicorn

# Copy application files
COPY app.py /app/
COPY templates /app/templates/
COPY static /app/static/

# Create necessary directories - FIXED: Use /config instead of /root
RUN mkdir -p /downloads /logs /config/streamrip

# Create a basic streamrip config in the correct location
RUN HOME=/config rip config --non-interactive || true

# Expose port
EXPOSE 5000

# Run with gunicorn for production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--threads", "4", "--timeout", "300", "app:app"]