FROM python:3.10-slim

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8

WORKDIR /gpt

COPY myGPTReader .

RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && mkdir -p /data/myGPTReader

CMD ["gunicorn", "app.server:app"]