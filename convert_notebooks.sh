#!/bin/bash

# Ruta de la carpeta notebooks dentro del contenedor
NOTEBOOKS_DIR="/home/jovyan/notebooks"

# Ruta de salida para los archivos PDF dentro del contenedor
OUTPUT_DIR="/home/jovyan/notebooks"

# Esperar a que Neo4j esté disponible
/wait-for-neo4j.sh

# Cambiamos al directorio de trabajo
cd $NOTEBOOKS_DIR

# Convertir cada notebook a PDF
for nb in $(find . -name '*.ipynb'); do
    jupyter nbconvert --execute --to notebook --inplace "$nb"
    jupyter nbconvert --to pdf "$nb" --output-dir "$OUTPUT_DIR"
done