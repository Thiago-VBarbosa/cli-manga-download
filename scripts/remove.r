#funcao para remover um manga especifico no register ou todos
source("../docs/doc_remove.r")
args <- commandArgs(TRUE)

con <- DBI::dbConnect(RSQLite::SQLite(), "../db/mangas.s3db")
query <- DBI::sqlInterpolate(con, "DELETE FROM list_mangas
                             WHERE nome = ?nome", nome = args[1])
on.exit(DBI::dbDisconnect(con, add = TRUE))
DBI::dbSendQuery(con, query)