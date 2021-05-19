*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Case ***
Cenário 01: Realizar pesquisa no google
  Acessar o Google
  Realizar busca por "robot framework"
  Checar se a busca retornou resultados
  Acessar o terceiro resultado
  Verificar se é mostrada a página esperada
