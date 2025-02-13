curl 'http://127.0.0.1:3000/graphql' \
  -H 'content-type: application/json' \
  --data-raw '{"query":"query MyQuery {\n  multiplyBy3(n: 1.5)\n}","variables":{"n":15},"operationName":"MyQuery","extensions":{}}' | jq .

echo '{"query":"query MyQuery {\n  multiplyBy3(n: 1.5)\n}","variables":{"n":15},"operationName":"MyQuery","extensions":{}}' | jq .  


curl --request POST \
  --url https://cloudinfra-gw.portal.checkpoint.com/app/i2//graphql/V1 \
  --header 'authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnRJZCI6IjcyZDU2ZjViLTY4NTUtNGQ2OS1hYTU2LTI2ZWI5ZmY2MTFkMiIsImNzcmYiOiIyMTY4Njc5Yy1hN2Q5LTQ0M2MtYWY4Mi1iYmU4OTBmMDA3OTUiLCJzZXNzaW9uSWQiOiJjNGI0NDU5ZS0xZTk2LTRjMTctODkwNi0zMTE0YTE3YjE1OTEiLCJjbGllbnRJZCI6IjA3YjBlYWQzLTg1YjMtNGZlYy1iOWQ1LTZkYWFjN2QyOTA3YSIsImRlc2NyaXB0aW9uIjoiIiwiYXBwSWQiOiJmNDdiNTM2Yy1hOTkwLTQyZmItOWFiMi1lYzM4ZjhjMmRjZmYiLCJyb2xlIjoiQWRtaW4iLCJyb2xlcyI6WyJhZG1pbiJdLCJzY29wZSI6bnVsbCwiaXNzdWVkQnkiOm51bGwsIm1hcmtldHBsYWNlSWQiOm51bGwsImF1dGhUeXBlIjoiRVhURVJOQUwiLCJyZWdpb24iOiJldSIsImNvb2tpZVZlcnNpb24iOiI3IiwiaWF0IjoxNzM5NDQzNzMzLCJleHAiOjE3Mzk0NDU1MzN9.YGbSmlXLhUSDrbkFNFQ374K3Fc2a77BE-w7kjjkOPQ6Pm20nzM0ZNXx4SZ_7tMakVfnuip0DmKCf0R1DW6-Wxt0Us-xpE-4x9jqeMmAbgGpwcTEALm0iFzYI27vUIijBYYSwFJh_geaQmk_UoMOdf_7_huIF0VqQkBQVADHcPwG-v27uiCFkFNOSg_S9dSkqcxuJcurXsEcTW0ZY9JMwmCreJQ-BAhTSkP1dkqVJ2p8KnfeGXnTvPiZtOVhfxSqFpRf6J5wfuMTnXMZ4RMYTMM0OWhSP7KxBgWOEXV1DPC84HWcar61xwNCA8hZznx5Mx_K0gnyRlxjwlVQPuP5XFQTsVW09pKOi8yklvaTav0iezkQ2As8vQaY5uztlpFU-YxpVRaZ_BndZSJ4bz3ALgwojEyiuS1UdcTFMxPvkeCMvydHhON9YyYPP78X5ADevrAPhdF5Sjt4DEnTjpV_PT3pVaXRTu6RMjmP3SrS8Di3sUE2H5sNgz1EXiujpT1CbfIacjCMmB8Gm7D3Jc2GVkr0DKmT5JhjyIa7NPryzE4kcHykeIzMERZyjY1jnEpivC6gpJ_pgGQovnbIdgL_FuzPImp_Hb2Apj4nZRX5RUTPKJjovb99Jw-pFPoacjyKdGvO2WIS6ORG9Gr4F8PgtpHde0DSMqcdpwQOkYJV2BWo' \
  --header 'content-type: application/json' \
  --header 'user-agent: vscode-restclient' \
  --data '{"query":"query Q1($userDefined: Boolean)  {\n  getAssets(userDefined: $userDefined) {\n    status \n      assets  {\n        id\n        name\n       state\n      }\n  }\n}","operationName":"Q1","variables":{"userDefined":true}}' | jq .