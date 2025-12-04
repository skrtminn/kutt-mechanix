# Gunakan Node.js 22 Alpine (ringan & cepat)
FROM node:22-alpine

# Production mode
ENV NODE_ENV=production

# Folder kerja di dalam container
WORKDIR /kutt

# Install dependencies tanpa cache mount → 100 % bebas error Railway
RUN npm ci --omit=dev

# Buat folder untuk database SQLite (biar persistent kalau pakai volume nanti)
RUN mkdir -p /var/lib/kutt

# Copy semua file project
COPY . .

# Buka port 3000
EXPOSE 3000

# Jalankan migrasi database dulu, baru start server
CMD npm run migrate && npm start