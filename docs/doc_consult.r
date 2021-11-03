'Consult. Consulta os Mangás cadastrados na base

Usage:
  consult.r 
  consult.r (-h | --help)
  consult.r --version

Options:
  -h --help     Apresenta esta tela de ajuda.
  --version     Apresenta a versão.

' -> doc
Encoding(doc) <- "UTF-8"
arguments <- docopt::docopt(doc, version = '1.0')
