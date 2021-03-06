CLI-manga\_download
===================

> Um Command-Line Interface desenvolvida em R para baixar e converter em
> formato adequado obras de Mangás.

Fornece um conjunto de funcionalidades que permite a partir de linhas de
código sintéticas o download e processamento automático de obras
convertendo para formato PDF e MOBI (Kindle)

Para baixar a ferramenta execute:

`git clone https://github.com/Thiago-VBarbosa/cli-manga-download`

------------------------------------------------------------------------

Os comandos abaixo tem como referência o diretório **"/scripts"**. No
Windows a execução do arquivo app.cmd abre o Prompt de comando no
diretório **"/scripts"**. Em qualquer sistema operacional, basta abrir o
terminal no diretório **"/scripts"**.

Para utilizá-la deve-se ter certeza de que a linguagem R esteja
instalada e as bibliotecas R necessárias estejam disponíveis. Para
garantir que as bibliotecas estejam disponíveis para executar as
funcionalidades rode:

    Rscript utils/check_packs_avaliable.r

Caso as bibliotecas necessárias não estejam disponíveis, o comando acima
fará a instalação.

Uma vez instaladas as bibliotecas necessárias, as funcionalidades
estarão disponíveis.

------------------------------------------------------------------------

Uso
---

### insert.r

Agora basta inserir na base a obra que deseja baixar com o comando
insert.r da seguinte forma:

    Rscript insert.r <nome> <codigo>

Para mais detalhes: `Rscript insert.r --help`

O nome refere-se ao nome que deseja inserir e fazer referência a ele em
outros comandos e o código refere-se ao codigo após a url
<https://mangahosted.com/manga/>`<cod>`.

### consult.r

Uma vez inserido, pode-se checar as obras cadastradas na base com o
seguinte comando:

    Rscript consult.r

### remove.r

Para remover uma obra da base, basta rodar o seguinte comando:

    Rscript remove.r <nome>

onde `<nome>` refere-se ao nome cadastrado na base;

Para mais detalhes: `Rscript remove.r --help`

### manga\_download.r

Para baixar uma obra cadastrada na base, basta rodar o seguinte comando:

    Rscript manga_download.r <nome> <chapters> <convert_to_pdf> <convert_to_mobi>

O argumento `chapters` pode ser fornecido de forma única ou vários de
uma só vez. Para fornecer vários capítulos de uma vez, basta separá-los
por "**,**" ou por "**:**" para indicar uma sequência.

Os argumentos `convert_to_pdf` e `convert_to_mobi` são booleanos. Quando
fornecidos o valor `TRUE` serão gerados respectivamente um arquivo PDF e
um arquivo MOBI, onde o arquivo MOBI tem seus meta-dados configurados
automaticamente. Ao menos um dos parâmetros `convert_to_` deve ser
fornecido, caso contrário as imagens baixadas serão descartadas.

Por exemplo:

    Rscript manga_download.r "Nome da obra cadastrada" 55 TRUE TRUE

Ou

    Rscript manga_download.r "Nome da obra cadastrada" 55,59:61 FALSE TRUE

No último exemplo serão baixados os capítulos 55,59,60,61 e gerado um
arquivo MOBI somente.

Para mais detalhes: `Rscript manga_download.r --help`

As obras baixadas estarão disponíves no diretório **"/mangas"**

------------------------------------------------------------------------

***ESSE PROJETO FOI DESENVOLVIDO POR MIM SOMENTE COMO UM EXERCÍCIO DE
CONSOLIDAÇÃO DE CONHECIMENTO ACERCA DE PROGRAMAÇÃO. O OBJETIVO DESSE
PROJETO NÃO É INCENTIVAR TAMPOUCO FACILITAR O COMETIMENTO DE CRIME. O
EVENTUAL USO DA FERRAMENTA, ASSIM COMO SUA FORMA É DE RESPONSABILIDADE
DO USUÁRIO.***
