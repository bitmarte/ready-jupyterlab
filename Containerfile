FROM python:3.11-slim

# Evita prompt interattivi
ENV DEBIAN_FRONTEND=noninteractive

# Installa dipendenze di base
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Installa librerie Python principali
RUN pip install --no-cache-dir \
    jupyterlab \
    duckdb \
    pandas \
    pyarrow \
    polars \
    matplotlib \
    voila \
    ipywidgets \
    seaborn \
    scikit-learn \
    umap-learn \
    nltk

# Crea la directory di lavoro
WORKDIR /workspace

# Espone la porta del server Jupyter/Voilà
EXPOSE 8888

# Avvio JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]