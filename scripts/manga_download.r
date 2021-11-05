source("../docs/doc_manga_download.r")

args <- commandArgs(TRUE)

manga_download <- function(what, chapters, path = "C:/", combine_pdf = FALSE, combine_mobi = FALSE){
  `%>%` <- magrittr::`%>%`

  manga_list <- jsonlite::fromJSON("../register.JSON")
  what <- match.arg(what, choices = manga_list$nome)
  
  if(!is.numeric(chapters))
    stop("O argumento 'chapters' precisa ser numerico")
  
  get_manga <- function(manga, chapter, generate_pdf, generate_mobi){
    url <- "https://mangahosted.com/manga/"
    page_manga <- httr::GET(paste0(url, manga_list[manga_list$nome == manga, "cod"],"/",chapter),
                          httr::user_agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41"))

    source("utils/extract_img_links.r")
    manga_df <- extract_img_links(page_manga)
    
    source("utils/manga")
    download_images(manga_df, manga, chapter)
    #gerando os diretórios onde serão armazenados os arquivos finais
    fs::dir_create(path_dest <- paste0(ifelse(substr(path, start = nchar(path), stop = nchar(path)) == "/",
                                              path, paste0(path,"/")), gsub(manga, pattern = " ", replacement = "-"))) #criando diretorio do manga especifico, caso nao exista
    fs::dir_create(path_dest1 <- paste0(path_dest, "/","Chapter_",
                                        ifelse(nchar(chapter) >= 2, chapter, gsub("[0-9]", paste0(0,chapter), chapter)))) #criando diretorio do capitulo especifico do manga, caso nao exista

    if(generate_pdf == TRUE){
      tryCatch(
        {
          cliapp::start_app(theme = cliapp::simple_theme())
          cliapp::cli_h1("\nGerando arquivo PDF\n") 
          imgs <- magick::image_read(list.files(tempdir(), full.names = TRUE))
          magick::image_write(imgs, path = path_dest2 <- paste0(path_dest1, "/", "Chapter_",ifelse(nchar(chapter) >= 2, chapter, gsub("[0-9]", paste0(0,chapter), chapter)),".pdf"), format = "pdf")
          cliapp::cli_alert_success("\nArquivo PDF gerado\n")
        },
        error = function(cond){
          message("Não foi possível realizar a conversão para o formato PDF")
          message("A conversão apresentou os seguintes erros")
          message(cond)
        })
    }
    if(generate_mobi == TRUE){
      source("utils/generate_cbz.r")
      source("utils/convert_to_mobi.r")
      tryCatch(
        {
          cliapp::cli_h1("\nGerando arquivo Mobi\n")
          cbz_file <- generate_cbz(path = path_dest1,
            name = paste0("Chapter_",chapter), list_files = tempdir())
          convert_to_mobi(file = cbz_file, nome = manga, chapter = chapter)
          file.remove(cbz_file)
          cliapp::cli_alert_success("\nArquivo Mobi gerado\n")
        },
        error = function(cond){
          message("Não foi possível realizar a conversão para o formato MOBI")
          message("A conversão apresentou os seguintes erros")
          message(cond)
        })
    }
  }
  
  invisible(lapply(X = chapters, FUN = get_manga, manga = what, generate_pdf = combine_pdf, generate_mobi = combine_mobi))
  
}

source("utils/entries_chapters.r")
manga_download(
  what = args[1], chapters = as.numeric(entries_chapters(args[2])),
  path = "../mangas", combine_pdf = as.logical(args[3]),
  combine_mobi = as.logical(args[4])
  )