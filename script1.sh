#!/bin/bash

# Define o nome da diretoria principal
diretoria_principal="teste"

# Cria a diretoria principal
mkdir "$diretoria_principal"

# Define os nomes das subdiretórias
subdiretoria1="rawdata" 
subdiretoria2="finaldata"

# Cria as subdiretórias dentro da diretoria principal
mkdir "$diretoria_principal/$subdiretoria1"
mkdir "$diretoria_principal/$subdiretoria2"

# Define o nome da subsubdiretórias
subsubdiretoria1="logs" 

# Cria a subsubdiretória dentro da subdiretoria1
mkdir "$diretoria_principal/$subdiretoria2/$subsubdiretoria1"

echo "Diretoria principal e subdiretorias criadas"
