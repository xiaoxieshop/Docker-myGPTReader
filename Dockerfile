FROM python:3.10-slim

WORKDIR /app

COPY myGPTReader .

RUN pip install --no-cache-dir -r requirements.txt \
    && mkdir -p /data/myGPTReader

CMD ["gunicorn", "app.server:app"]