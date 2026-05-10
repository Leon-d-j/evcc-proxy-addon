#!/usr/bin/with-contenv bashio

EVCC_IP=$(bashio::config 'evcc_ip')
EVCC_PORT=$(bashio::config 'evcc_port')
EVCC_URL="http://${EVCC_IP}:${EVCC_PORT}"
INGRESS_PATH=$(bashio::addon.ingress_path)

bashio::log.info "Starting evcc Proxy..."
bashio::log.info "evcc URL: ${EVCC_URL}"
bashio::log.info "Ingress path: ${INGRESS_PATH}"

# Write nginx config with actual values
cat > /etc/nginx/http.d/evcc_proxy.conf << EOF
server {
    listen 8099;

    location ${INGRESS_PATH}/ {
        proxy_pass ${EVCC_URL}/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;

        # WebSocket support (needed for evcc live updates)
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_read_timeout 86400;
    }

    location ${INGRESS_PATH} {
        return 301 ${INGRESS_PATH}/;
    }
}
EOF

bashio::log.info "nginx config written, starting nginx..."
nginx -g "daemon off;"
