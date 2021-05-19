*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}       https://www.google.com.br/
${BROWSER}   chrome

*** Keywords ***
#Setup e Teardown
Abrir navegador
  Open Browser   ${URL}   ${BROWSER}

Fechar navegador
    Close Browser

#Ações
Acessar o Google
  Wait Until Element Is Visible   name=q

Realizar busca por "${TEMA}"
  Input Text                      name=q     ${TEMA}
  Wait Until Element Is Visible   //*[@class="lJ9FBc"]//*[@name="btnK"]
  Click Button                    //*[@class="lJ9FBc"]//*[@name="btnK"]

Checar se a busca retornou resultados
  Page Should Contain Element     id=result-stats

Acessar o terceiro resultado
  ${STATUS}     Run Keyword And Return Status    Page Should Contain Element     //*[@id="rso"]/div[3]/div/div/div/div[1]/a/h3
  ${LINK}       Set Variable If    ${STATUS}==True
  ...  //*[@id="rso"]/div[3]/div/div/div/div[1]/a/h3
  ...  //*[@id="rso"]/div[3]/div/div/div/div/div[2]/div[2]/div[1]/div[2]/div/a/div/div[2]/div[1]/div
  Click Element    ${LINK}

Verificar se é mostrada a página esperada
  Title Should Be    Robot Framework
