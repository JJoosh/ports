#!/bin/bash

# Verifica si se proporciona un archivo como argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo="$1"

# Verifica si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "El archivo '$archivo' no existe."
    exit 1
fi

# Filtra los puertos usando la expresión regular y realiza el procesamiento
puertos=$(grep -oP '\d+\/\w+\/\w+\/\/\w+\/\/\/' "$archivo" | grep -oP '\d+' | tr '\n' ',')

# Muestra los puertos en la salida estándar
echo "Puertos abiertos: $puertos"

