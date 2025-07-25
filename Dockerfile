FROM n8nio/n8n:latest

USER root
RUN apt-get update && apt-get install -y git bash \
 && npm install -g n8n-nodes-tesseractjs

USER node
