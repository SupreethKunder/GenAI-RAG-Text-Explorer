FROM python:3.12-slim-bullseye

LABEL version="1.0" \
    description="An RAG implementation with Ollama Embeddings & Model (Mistral) over sample TXT files via Langchain wrapped as a Gradio Application!" \
    org.opencontainers.image.authors="kundersupreeth@gmail.com"

RUN useradd --create-home devops
USER devops
WORKDIR /home/devops

ENV VIRTUALENV=/home/devops/venv
RUN python3 -m venv $VIRTUALENV
ENV PATH="$VIRTUALENV/bin:$PATH"

COPY --chown=devops dist/*.whl /tmp/
COPY --chown=devops assets/ assets/
# COPY --chown=devops .env .env

RUN pip install -U pip \
    && pip install --no-cache-dir -U /tmp/*.whl \
    && pip install unstructured \
    && rm -rf /tmp/*.whl
