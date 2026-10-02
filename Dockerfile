FROM python:3.10-slim-bookworm

RUN mkdir /LazyPrincess
WORKDIR /LazyPrincess

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements first for Docker cache
COPY requirements.txt .

RUN cd /
# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy bot source code
COPY . .

# Start the bot

CMD ["/bin/bash", "/start.sh"]




