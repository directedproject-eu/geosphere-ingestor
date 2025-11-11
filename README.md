# GeoSphere forecast data ingestion for DIRECTED project

GeoSphere dataset reference: https://data.hub.geosphere.at/dataset/nwp-v1-1h-2500m  
API metadata description: https://dataset.api.hub.geosphere.at/v1/grid/forecast/nwp-v1-1h-2500m/metadata  

Metadata section with information on the ingested parameter
```json
{
    "name": "rain_acc",
    "long_name": "total rainfall amount",
    "desc": "Accumulated total amount of rainfall since start of the forecast",
    "unit": "kg m-2"
}
```

Build the Docker image:

```shell
docker build . -t 52north/directed-geosphere-ingestor:latest
```

Run the Docker image for accumulated rainfall (is the default):

```shell
docker run -e BUCKET_NAME="" -e BUCKET_KEY="" -e BUCKET_SECRET="" 52north/directed-geosphere-ingestor:latest
```

Run the Docker image with different parameters and bbox:

```shell
docker run -e BUCKET_NAME="" -e BUCKET_KEY="" -e BUCKET_SECRET="" -e BBOX="46.0, 15.0, 50.0, 18.0" -e PARAMETERS="sp,t2m" 52north/directed-geosphere-ingestor:latest
```
