#!/bin/bash

# Esperar hasta que Neo4j esté disponible
until nc -z neo4j 7687; do
  echo "Esperando a que Neo4j esté disponible..."
  sleep 2
done

echo "Neo4j está disponible, procediendo con la ejecución de los notebooks"