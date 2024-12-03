#!/bin/bash

# Define o arquivo de texto com a lista dos arquivos FASTQ.gz
txt_file="samples.txt"

# Lê o arquivo linha por linha
while IFS=$' ' read -r sample treatment file1 && read -r _ _ file2 
do

  # Remove caracteres ^M inviseis de mudança de linha do ficheiro samples.txt
  file1=$(echo "$file1" | tr -d '\r') 
  file2=$(echo "$file2" | tr -d '\r')

  # Executa o FastQC para o par de cada amostra e informa que amostras foram processadas
  fastqc "$file1" "$file2"
  echo "---!FASTQC finalizado para $sample com arquivos: $file1 e $file2!---"

done < "$txt_file"

# Informa que terminou o processamento fastqc
echo "Processamento FASTQC para as amostras raw completo!" 

# Executa o Multiqc para todas as amostras previamente processadas para ver as amostras com os pares juntos
  multiqc *.zip* 

# Informa que terminou o processamento multiqc
echo "Processamento MULTIQC para as amostras raw completo!" 

# Lê o arquivo linha por linha
while IFS=$' ' read -r sample treatment file1 && read -r _ _ file2 
do

  # Remove caracteres ^M inviseis de mudança de linha do ficheiro txt
  file1=$(echo "$file1" | tr -d '\r') 
  file2=$(echo "$file2" | tr -d '\r')

  # Executa o trimmomatic para as amostras em par (PE) rawdata, guarda output (trimp e trimu) e ficheiro log com resumi de informações na pasta finaldata
  trimmomatic PE -phred33 "$file1" "$file2" "/home/catarina/ibbc/teste/finaldata/${sample}_file1.trimP.fastq.gz" "/home/catarina/ibbc/teste/finaldata/${sample}_file1.trimU.fastq.gz" "/home/catarina/ibbc/teste/finaldata/${sample}_file2.trimP.fastq.gz" "/home/catarina/ibbc/teste/finaldata/${sample}_file2.trimU.fastq.gz" SLIDINGWINDOW:4:20 >> "/home/catarina/ibbc/teste/finaldata/logs/${sample}_trimmomatic.log" 2>&1
  echo "---!TRIMOMMATIC finalizado para $sample com arquivos: $file1 e $file2!---"

done < "$txt_file"

# Informa que terminou o processamento trimmomatic
echo "Processamento TRIMOMMATIC completo!" 

# Lê o arquivo linha por linha
while IFS=$' ' read -r sample treatment file1 && read -r _ _ file2 
do

  # Remove caracteres ^M invisíveis de mudança de linha do ficheiro txt
  file1=$(echo "$file1" | tr -d '\r')
  file2=$(echo "$file2" | tr -d '\r')

  # Verifica se as amostras nas duas linhas são iguais (que é o que acontece no ficheiro e ignora essa repetição, ficando só com uma vez o nome da amostra)
  if [[ "$sample" == "$sample" ]]; then

  # Executa o FastQC para o par das amostras em finaldata
  fastqc "/home/catarina/ibbc/teste/finaldata/${sample}_file1.trimP.fastq.gz" "/home/catarina/ibbc/teste/finaldata/${sample}_file2.trimP.fastq.gz" -o /home/catarina/ibbc/teste/finaldata/
  echo "---!FASTQC finalizado para $sample com arquivos: "/home/catarina/ibbc/teste/finaldata/${sample}_file1.trimP.fastq.gz" e "/home/catarina/ibbc/teste/finaldata/${sample}_file2.trimP.fastq.gz"---"
  
  fi
done < "$txt_file"

# Informa que terminou o processamento fastqc
echo "Processamento FASTQC para as amostras finais completo!" 

  # Executa o Multiqc para todas as amostras processadas para ver as amostras com os pares juntos
  multiqc /home/catarina/ibbc/teste/finaldata/*.zip* -o /home/catarina/ibbc/teste/finaldata/

# Informa que terminou o processamento multiqc
echo "Processamento MULTIQC para as amostras finais completo!"

echo "-------TERMINOU O PROCESSAMENTO DAS AMOSTRAS---------"
