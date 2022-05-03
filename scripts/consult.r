source("../docs/doc_consult.r")

con <- DBI::dbConnect(RSQLite::SQLite(), "../db/mangas.s3db")
on.exit(DBI::dbDisconnect(con, add = TRUE))
result <- DBI::dbGetQuery(con, "SELECT nome FROM list_mangas")
result$nome
cat("\n")