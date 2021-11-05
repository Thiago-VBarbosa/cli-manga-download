download_images <- function(table, manga, chapter){
  cat(paste("\nRealizando download:", manga, "- Capitulo", chapter,"\n"))
  barra <- txtProgressBar(min = 0, max = length(table$id), style = 3)
  #realizando o download das imagens
  for(i in 1:length(table$id)){
    download.file(url = as.character(table$src[i]),
                  destfile = file.path(tempdir(),
                                       ifelse(length(stringr::str_extract_all(table$id[i],"[0-9]")[[1]]) >= 2,
                                              paste0(table$id[i],".jpg"),
                                              paste0(gsub("[0-9]", paste0(0,stringr::str_extract_all(table$id[i],"[0-9]")[[1]]), table$id[i]),".jpg"))),
                  mode = "wb", quiet = TRUE)
    setTxtProgressBar(barra,i)
    if(i == length(table$id))
      cat("\nDownload concluido")
  }
  close(barra)
}