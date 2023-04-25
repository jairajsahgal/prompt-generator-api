FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade torch transformers flask flask_restful flask_limiter

WORKDIR /app

COPY . /app

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app

USER appuser

RUN pip install --upgrade torch transformers flask flask_restful flask_limiter

EXPOSE 8000

CMD [ "python3","main.py" ]