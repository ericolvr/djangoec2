FROM python:3.8-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y nginx

EXPOSE 8000

COPY nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

ENV GUNICORN_WORKERS 4

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "${GUNICORN_WORKERS}", "ec2django.wsgi:application"]

