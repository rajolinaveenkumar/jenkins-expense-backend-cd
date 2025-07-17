FROM node:23-alpine AS builder
WORKDIR /opt/backend
COPY scripts/* .
RUN npm install

FROM node:23-alpine
RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/backend && \
    chown -R expense:expense /opt/backend
ENV DB_HOST="mysql-dev.naveenrajoli.site"
WORKDIR /opt/backend
USER expense
COPY --from=builder /opt/backend /opt/backend
CMD ["node", "index.js"]

