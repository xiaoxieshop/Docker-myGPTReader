FROM python:3.10-slim

WORKDIR /gpt

COPY myGPTReader .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "app.server:app"]