# Desafio 4
================

Informações do aluno:
---------------------

-   **Nome**: Lucas E. O. Silva
-   **Programa**: Mestrado em Ciência Política
-   **Número USP**: 10236603
-   **Data de entrega**: 23/05/2017
-   **Disponbilização de todo material**: <https://github.com/lucaseosilva>

Descrição da atividade
----------------------

O objetivo do trabalho é elaborar 4 mapas da Região Metropolitana de São Paulo utilizando dados de cada uma dessas fontes:

1.  [Perfil dos Municípios Brasileiros (IBGE)](http://www.ibge.gov.br/home/estatistica/economia/perfilmunic/2015/default.shtm);
2.  [Informações Financeiras e Fiscais dos Municípios (Tesouro Nacional)](https://siconfi.tesouro.gov.br/siconfi/pages/public/consulta_finbra/finbra_list.jsf);
3.  [Estatísticas sobre óbitos (DATASUS)](http://tabnet.datasus.gov.br/cgi/deftohtm.exe?sim/cnv/pobt10br.def);
4.  [Atlas Brasil (PNUD)](www.atlasbrasil.org.br/2013/pt/consulta/);

Com exceção dos dados do Atlas Brasil, que se referem ao censo de 2010, todos os demais são referentes ao ano de 2015.

Ao fim, pretendo criar uma base de dados que contenha informações dos municípios no que se refere à urbanização e governança municipal.

Variáveis selecionadas
----------------------

#### 1. IBGE

Do Perfil dos Municípios Brasileiros, foi selecionada a variável `ClassPop`, que se refere ao porte populacional do município. Essa variável possui sete categorias:

1.  Até 5000;
2.  5001 até 10000;
3.  10001 até 20000;
4.  20001 até 50000;
5.  50001 até 100000;
6.  100001 até 500000;
7.  Maior que 500000.

#### 2. Tesouro Nacional:

Em relação aos dados financeiros e fiscais dos municípios, foi selecionada a variável `TotalDesp`, que trata das despesas orçamentárias - pagas (Anexo I-D) dos municípios referentes ao ano de 2015 (variável contínua).

#### 3. DATASUS:

No que se refere aos dados de óbitos, foi selecionada a variável `TxObResTot`, que se refere ao total de óbitos por residência e de acordo com o Capítulo CID-10 (variável discreta).

#### 4. PNUD:

Por fim, foi selecionada a variável `AguaEnc`, que é o % da população em domicílios com água encanada (variável contínua);

Estratégia de operacionalização dos dados
-----------------------------------------

Basicamente, foram utilizadas as mesmas funções do [Desafio 3](https://github.com/lucaseosilva/Desafio3). A novidade consiste no aprimoramento dos mapas.

Ao invés de utilizar o pacote `sp`, preferi utilizar o `tmap`. Acredito que esse último gere *outputs* com uma melhor qualidade gráfica.

O carregamento do shape foi feito através da função `read_shape()`. Em seguida, criei a variável `CodIbge6` para padronizar com as outras bases. Para fazer o merge, primeiramente, é necessário ordenar a variável de interesse e, após isso, selecionar a função `append_data()` do `tmap`. O bloco abaixo descreve o procedimento:

Por fim, os mapas foram elaborados com a função `tm_shape`:

1.  Mapa com as informações do IBGE:

![](documentacao_files/figure-markdown_github/MAPA.IBGE-1.png)

1.  Mapa com as informações do Tesouro:

![](documentacao_files/figure-markdown_github/MAPA.TESOURO-1.png)

1.  Mapa com as informações do DataSUS:

![](documentacao_files/figure-markdown_github/MAPA.DATASUS-1.png)

1.  Mapa com as informações do Atlas:

![](documentacao_files/figure-markdown_github/MAPA.ATLAS-1.png)
