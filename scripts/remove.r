#funcao para remover um manga especifico no register ou todos
source("../docs/doc_remove.r")
args <- commandArgs(TRUE)

register <- jsonlite::fromJSON("../register.JSON")
register <- register[-which(register$nome %in% args),]
jsonlite::write_json(register, "../register.JSON")