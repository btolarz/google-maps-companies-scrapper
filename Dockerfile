# Use the official Python image from the Docker Hub
FROM python:3.12

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    chromium \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    jq \
    firefox-esr \
    && rm -rf /var/lib/apt/lists/*

# Download and install geckodriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux-aarch64.tar.gz \
    && tar -xvzf geckodriver-v0.33.0-linux-aarch64.tar.gz \
    && mv geckodriver /usr/bin/geckodriver \
    && chmod +x /usr/bin/geckodriver \
    && rm geckodriver-v0.33.0-linux-aarch64.tar.gz

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables for Chrome and ChromeDriver
ENV PYTHONUNBUFFERED=1

# Default command to run the scraper
ENTRYPOINT ["python", "scraper.py"]
