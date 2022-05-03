convert_to_mobi <- function(file, nome, chapter) {
  
    con <- DBI::dbConnect(RSQLite::SQLite(), "../db/mangas.s3db")
    on.exit(DBI::dbDisconnect(con, add = TRUE))
    register <- DBI::dbGetQuery(con, "SELECT * FROM list_mangas")
    bookdown::calibre(input = file,
    output = "mobi",
    options = c("--output-profile=kindle_pw",
        glue::glue('--authors="{glue::glue_collapse(x = register[register$nome == nome,c("autor","arte")], sep = " & ")}"'),
        glue::glue('--author-sort="{register$autor[register$nome == nome]}"'), #firts author or author (the another author are the person responsable for draw the art)
        glue::glue('--title="{register$title[register$nome == nome]} capitulo #{chapter}"'),
        glue::glue('--title-sort="{register$title[register$nome == nome]} capitulo #{chapter}"'),
        glue::glue("--cover={file.path(tempdir(),'img_01.jpg')}"),
        "--max-toc-links=0"))
}