FROM python:3.7-slim

WORKDIR /src
EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "--timeout=10", "--workers=4", "web.app:app"]

RUN pip3 install \
  gunicorn \
  flask \
  requests \
  webargs==4.1.2 \
  sqlalchemy==1.3.0b1 \
  https://cdn.mysql.com/Downloads/Connector-Python/mysql-connector-python-8.0.13.zip#md5=8c3073508160391c18d07663c7f03f87

COPY . /src
RUN cd /src && python3 setup.py develop
