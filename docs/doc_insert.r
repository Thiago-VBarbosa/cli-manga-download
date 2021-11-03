'Insert. Insira na base o Mangá que deseja baixar

Usage:
  insert.r <nome> <codigo>
  insert.r (-h | --help)
  insert.r --version

Options:
  -h --help     Apresenta esta tela de ajuda.
  --version     Apresenta a versão.

' -> doc
Encoding(doc) <- "UTF-8"
arguments <- docopt::docopt(doc, version = '1.0')
