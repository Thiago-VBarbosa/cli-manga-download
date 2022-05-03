`%>%` <- magrittr::`%>%`

sys_list <- list(Windows = "https://www.sqlite.org/2022/sqlite-tools-win32-x86-3380200.zip",
                 Linux = "https://www.sqlite.org/2022/sqlite-tools-linux-x86-3380200.zip",
                 Macos = "https://www.sqlite.org/2022/sqlite-tools-osx-x86-3380200.zip")

system_name <- Sys.info()[["sysname"]]

download.file(url = sys_list[[system_name]], destfile = file.path(tempdir(), "sqlite.zip"))

zipfile_name <- httr::parse_url(sys_list[[system_name]])$path %>% 
  stringr::str_split("/") %>% 
  purrr::pluck(1) %>% 
  purrr::pluck(2) %>% 
  stringr::str_remove(".zip")

unzip(zipfile = file.path(tempdir(), "sqlite.zip"), exdir = tempdir())

file.path(
  file.path(tempdir(), zipfile_name),
  list.files(
    file.path(tempdir(), zipfile_name)
  )
) %>% 
  file.copy(to = "../db/") %>% 
  invisible()


invisible(
  system("../db/sqlite3 ../db/mangas.s3db < ../db/create_base.sql",
         wait = T, ignore.stderr = T)
)


