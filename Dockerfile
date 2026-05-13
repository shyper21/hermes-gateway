FROM nousresearch/hermes-agent:latest
RUN uv pip install python-telegram-bot --system
CMD ["gateway", "run"]