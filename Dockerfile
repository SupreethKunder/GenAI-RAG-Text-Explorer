FROM python:3.9-slim-bullseye

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
