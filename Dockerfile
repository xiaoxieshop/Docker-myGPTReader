FROM python:3.9-slim

ENV PORT=8080

USER root

WORKDIR /app

COPY myGPTReader .

RUN ls \
    && pip install --no-cache-dir -r requirements.txt \
    && mkdir /data && mkdir /data/myGPTReader

EXPOSE 8080

CMD ["gunicorn", "app.server:app"]