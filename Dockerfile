FROM node:22-alpine

ENV NODE_ENV=production
WORKDIR /kutt

# Install dependencies (tanpa cache = no error)
RUN npm ci --omit=dev

RUN mkdir -p /var/lib/kutt

COPY . .

EXPOSE 3000

CMD npm run migrate && npm start