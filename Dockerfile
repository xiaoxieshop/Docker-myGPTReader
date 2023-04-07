FROM python:3.10-alpine

ENV TZ Asia/Shanghai \
    LANG=zh_CN.UTF-8

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt \
    && apk add --no-cache tzdata \
    && tzdata /usr/share/zoneinfo/Asia/Shanghai \
    && rm -rf /var/cache/apk/*

CMD ["gunicorn", "app.server:app"]