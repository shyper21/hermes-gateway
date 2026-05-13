FROM nousresearch/hermes-agent:latest
RUN pip install python-telegram-bot
CMD ["gateway", "run"]