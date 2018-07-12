FROM jupyter/scipy-notebook:latest
LABEL maintainer="Stepan Kuzmin <to.stepan.kuzmin@gmail.com>"

USER root

RUN apt-get -yqq update \
  && apt-get -yqq install \
  python-gdal

USER $NB_UID

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
  'tqdm' \
  'tensorflow=1.3*' \
  'keras=2.0*' && \
  conda remove --quiet --yes --force qt pyqt && \
  conda clean -tipsy && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER

# conda install -c conda-forge mapboxgl
RUN pip install mapboxgl
