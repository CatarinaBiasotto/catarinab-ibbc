# catarinab-ibbc

script1 - cria diretorias para organizar o processamento das análises. Cria uma pasta principal chamada teste e subdiretorias rawdata e finaldata (finaldata que inclui ainda uma sub subdiretoria, designada logs). 
script2 - faz o processamento através das ferramentas fastqc, multiqc e trimomatic. Resultado do processamento é guardado na pasta finaldata. 
script3 - remove os ficheiros e pastas criados no decorrer do processamento dos arquivos (ficheiros criados através do script2). 

nota 1: para utilizar o script2 é necessário previamente organizar as amostras num ficheiro de texto (samples.txt) que irá funcionar como um indice de busca dos ficheiros. É necessário ter as ferramentas fastqc, multiqc e trimomatic instaladas. Os ficheiros para analisar, o ficheiro txt, o script2 e o script3 devem estar guardados na diretoria rawdata.
