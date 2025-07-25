# Gunakan base image Debian-based agar apt dan dependensi native bisa diinstall
FROM node:18-bullseye

# Install Git dan Tesseract OCR
RUN apt-get update && apt-get install -y \
    git \
    tesseract-ocr \
    && rm -rf /var/lib/apt/lists/*

# Install custom node untuk n8n (tesseractjs node)
RUN npm install -g n8n-nodes-tesseractjs

# Install n8n
RUN npm install -g n8n

# Tentukan environment variable dasar
ENV N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=admin123 \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    WEBHOOK_TUNNEL_URL=https://n8n-private.kretyastudio.com/

# Expose port untuk n8n
EXPOSE 5678

# Jalankan n8n
CMD ["n8n"]
