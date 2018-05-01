FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7

RUN apk --update --no-cache add \
    build-base \
    python-dev \
    jpeg-dev \
    libpng \
    zlib-dev \
    freetype-dev

ENV LIBRARY_PATH=/lib:/usr/lib

ENV NGINX_WORKER_PROCESSES auto
ENV STATIC_PATH /app/static

ENV DEBUG_MODE=false
ENV TEST_MODE=false

RUN pip install --upgrade pip
ADD requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

COPY ./app /app

CMD export PORT=$PORT && python3 /app/main.py