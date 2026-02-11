# =============================================================================
# VECTOR DATABASE BENCHMARK - DOCKERFILE
# Author: Cihat Özkurt
# Project: Comprehensive Benchmarking of Vector Databases for Chatbot Applications
# Master's Thesis - TH Köln
# =============================================================================

FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Create necessary directories
RUN mkdir -p /app/data/raw_data \
    /app/data/processed_data \
    /app/data/embeddings \
    /app/data/evaluation \
    /app/data/results

# Expose Jupyter port
EXPOSE 8888

# Default command: Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
