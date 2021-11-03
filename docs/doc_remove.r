'Remove. Remova um Mangá da base

Usage:
  remove.r <nome>
  remove.r (-h | --help)
  remove.r --version

Options:
  -h --help     Apresenta esta tela de ajuda.
  --version     Apresenta a versão.

' -> doc
Encoding(doc) <- "UTF-8"
arguments <- docopt::docopt(doc, version = '1.0')
