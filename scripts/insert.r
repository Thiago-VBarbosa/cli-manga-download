#library(GetoptLong)

#GetoptLong(
 # "nome=s", "Nome do Mangá a ser cadastrado na base.",
  #"cod=s","Código do Mangá a ser inserido na base."
#)


#print(arguments)
#library(docopt)
source("utils/get_meta_data.r")
source("../docs/doc_insert.r")

args <- commandArgs(TRUE)
meta_data <- get_meta_data(args[2])

register <- jsonlite::fromJSON("../register.JSON")
register <- rbind(register, cbind(data.frame(nome = args[1], cod = args[2]), meta_data))
jsonlite::write_json(register, "../register.JSON")
