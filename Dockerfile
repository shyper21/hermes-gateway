FROM nousresearch/hermes-agent:latest
RUN uv pip install python-telegram-bot --system || python3 -m pip install python-telegram-bot --break-system-packages
CMD ["gateway", "run"]