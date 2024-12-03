#!/bin/bash

# Caminhos para os arquivos ou diretórios a serem removidos
arquivos=(
  /home/fc54205/teste/rawdata/*.html
  /home/fc54205/teste/rawdata/*.zip
  /home/fc54205/teste/rawdata/multiqc*
  /home/fc54205/teste/finaldata/*.*
  /home/fc54205/teste/finaldata/multiqc_data
  /home/fc54205/teste/finaldata/logs/*.log
)

# Remove os arquivos especificados
rm -rf "${arquivos[@]}"

# Verifica se a remoção foi bem-sucedida. Se todos os arquivos definidos acima forem igual a 0 = não há arquivos, houve sucesso na remoção. Caso contrário não houve sucesso.
if [ $? -eq 0 ]; then
    echo "Arquivos/diretórios removidos com sucesso."
else
    echo "Erro ao remover os arquivos/diretórios."
fi
