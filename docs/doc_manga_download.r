'Manga Download. Realiza o download do Mangá previamente cadastrado na base

Usage:
  manga_download.r <manga> <chapters> <convert_to_pdf> <convert_to_mobi>
  manga_download.r (-h | --help)
  remove.r --version

Options:
  -h --help     Apresenta esta tela de ajuda.
  --version     Apresenta a versão.

' -> doc
Encoding(doc) <- "UTF-8"
arguments <- docopt::docopt(doc, version = '1.0')
