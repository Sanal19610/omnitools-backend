FROM node:20-slim

# Copy Deno 2.x binary from official Deno image
COPY --from=denoland/deno:bin /deno /usr/local/bin/deno
RUN chmod +x /usr/local/bin/deno

# Install system dependencies: Python3, pip, ffmpeg, and ca-certificates
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    ca-certificates \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Install yt-dlp via pip (supporting Debian bookworm/PEP 668 environments)
RUN pip3 install --no-cache-dir --break-system-packages -U yt-dlp || pip3 install --no-cache-dir -U yt-dlp

# Verify Deno, Node, Python, FFmpeg, and yt-dlp JS runtime detection
RUN deno --version && \
    node --version && \
    python3 --version && \
    ffmpeg -version | head -n 1 && \
    (yt-dlp --verbose || true)

# Set working directory
WORKDIR /app

# Copy package files and install production dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy application files
COPY . .

# Default environment variables
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start backend server
CMD ["node", "server.js"]

