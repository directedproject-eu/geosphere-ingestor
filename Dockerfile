FROM python:3.12

#
# Fight OS CVEs and install dependencies
#
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get dist-upgrade -y \
 && apt-get install --assume-yes --no-install-recommends  \
        gdal-bin \
        libgdal-dev \
 && apt-get clean \
 && apt autoremove -y  \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./requirements.txt ./

RUN pip install -r requirements.txt

COPY geosphere_ingestor ./geosphere_ingestor

ENTRYPOINT [ "python", "/app/geosphere_ingestor/ingestor.py"]
