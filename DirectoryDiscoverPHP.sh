#!/bin/bash
for palavra in $(cat $2)
do
  resposta=$(curl -s -H "User-Agent: Mozilla/5.0" -o /dev/null -w "%{http_code}" $1/$palavra.php/)
  if [ $resposta == "200" ]
  then
    echo "Diretorio Encontrado: $palavra.php"
  fi
  if [ $resposta == "404" ]
  then
    echo "Diretorio Nao Encontrado: $palavra.php "
  fi
done
