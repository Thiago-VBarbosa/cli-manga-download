extract_img_links <- function(x) {
   `%>%` <- magrittr::`%>%`
   df <-  x %>% 
      xml2::read_html() %>%
      xml2::xml_find_all(xpath = "//img") %>%
      xml2::xml_attrs() %>%
      lapply(FUN = "as.data.frame.list") %>%
      do.call(what = "rbind", args = .) %>%
      tibble::as_tibble() %>%
      dplyr::select(-alt) #extraindo links das imagens
    
    df
}