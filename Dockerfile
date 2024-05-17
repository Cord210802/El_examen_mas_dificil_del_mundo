FROM jupyter/scipy-notebook

# Instalar netcat
USER root
RUN apt-get update && apt-get install -y netcat

# Cambiar al usuario jovyan
USER jovyan

# Copiar los scripts
COPY wait-for-neo4j.sh /
COPY convert_notebooks.sh /

USER root
# Dar permisos de ejecución a los scripts
RUN chmod +x /wait-for-neo4j.sh
RUN chmod +x /convert_notebooks.sh

# Instalar py2neo y neo4j
USER jovyan
RUN pip install py2neo neo4j

USER root
# Instalar paquetes LaTeX necesarios para la conversión de notebooks a PDF
RUN apt-get update && \
    apt-get install -y texlive-xetex texlive-fonts-recommended texlive-plain-generic

USER jovyan