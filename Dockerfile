FROM n8nio/n8n:latest

USER root

# Install git dan bash (pakai apk karena Alpine base image)
RUN apk add --no-cache git bash \
 && npm install -g n8n-nodes-tesseractjs

USER node
