entries_chapters <- function(x) {
    `%>%` <- magrittr::`%>%`
    chapters <- stringr::str_replace_all(x, "-", ":") %>%
        stringr::str_split(pattern = ",") %>%
        .[[1]] %>%
        rlang::parse_exprs() %>%
        lapply("eval") %>%
        unlist()
    chapters
}