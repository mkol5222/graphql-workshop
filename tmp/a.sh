#!/bin/bash

curl 'http://127.0.0.1:3000/graphql'   -H 'content-type: application/json'   --data-raw $'{"query":"query MyQuery($n: Int\u0021) {\\n  multiplyBy2(n: $n)\\n}","variables":{"n":15},"operationName":"MyQuery","extensions":{}}' -s | jq .

echo $'{"query":"query MyQuery($n: Int\u0021) {\\n  multiplyBy2(n: $n)\\n}","variables":{"n":15},"operationName":"MyQuery","extensions":{}}' | jq .

MQ='{ "query": "{ multiplyBy2(n:2) }"} '
echo $MQ | jq .

curl -s 'http://127.0.0.1:3000/graphql'   -H 'content-type: application/json'   --data-raw "$MQ" | jq .data.multiplyBy2



curl --request POST \
  --url http://127.0.0.1:3000/graphql \
  --header 'content-type: application/json' \
  --header 'user-agent: vscode-restclient' \
  --data '{ "query": "{ multiplyBy2(n:8) }"}'


curl --request POST \
  --url http://127.0.0.1:3000/graphql \
  --header 'content-type: application/json' \
  --header 'user-agent: vscode-restclient' \
  --data '{"query":"query m($n: Int!) { multiplyBy2(n:$n) }","operationName":"m","variables":{"n":17}}'


  echo '{"query":"query m($n: Int!) { multiplyBy2(n:$n) }","operationName":"m","variables":{"n":17}}' | jq .
