# build
podman build -t ready-jupyterlab .

# run
podman run -it --rm \
  -p 8888:8888 \
  -v path/to/parquet/output:/data/parquet/moneytransfer:Z \
  -v path/to/your/file/like/sample.json:/data/json/sample.json \
  -v path/for/saving/notebooks:/workspace:Z \
  ready-jupyterlab