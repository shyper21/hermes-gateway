FROM nousresearch/hermes-agent:latest

RUN HERMES_BIN=$(which hermes 2>/dev/null || find /usr /opt /root /home -name hermes -type f 2>/dev/null | head -1) && \
    HERMES_REAL=$(readlink -f "$HERMES_BIN") && \
    HERMES_VENV=$(dirname $(dirname "$HERMES_REAL")) && \
    HERMES_PY="$HERMES_VENV/bin/python3" && \
    echo "Found hermes venv at: $HERMES_VENV" && \
    uv pip install \
        python-telegram-bot \
        duckduckgo-search \
        --python "$HERMES_PY"

# Copy config ke lokasi yang dibaca hermes gateway
COPY config.yml /root/.hermes/config.yml

CMD ["gateway", "run"]
