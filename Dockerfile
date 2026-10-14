FROM node:22-bookworm

RUN npm install -g @openai/codex

USER root
RUN mkdir -p /home/node/.codex \
  && chown -R node:node /home/node

COPY --chown=node:node config.toml /home/node/.codex/config.toml

USER node
WORKDIR /tmp

ENTRYPOINT ["codex"]
