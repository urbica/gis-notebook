FROM jupyter/scipy-notebook:latest
LABEL maintainer="Stepan Kuzmin <to.stepan.kuzmin@gmail.com>"

USER root

RUN apt-get -yqq update \
  && apt-get -yqq install \
  python-gdal

USER $NB_UID

# Install Python 3 packages
RUN conda install --quiet --yes \
  'fiona' \
  'folium' \
  'gdal' \
  'geocoder' \
  'geopandas' \
  'geopy' \
  'googlemaps' \
  'psycopg2' \
  'pyproj' \
  'pysal' \
  'rtree' \
  'shapely' \
  'tqdm'
