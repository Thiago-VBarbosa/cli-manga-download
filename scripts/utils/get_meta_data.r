get_meta_data <- function(cod){
  cod <- as.character(cod)
  `%>%` <- magrittr::`%>%`

  page <- httr::GET(glue::glue("https://mangahosted.com/manga/{cod}"),
                    httr::user_agent("Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36"))
  title <- page %>% 
    xml2::read_html() %>% 
    xml2::xml_find_all("//h1[@class = 'title']") %>% 
    xml2::xml_text()
  
  autor <- page %>% 
    xml2::read_html() %>% 
    xml2::xml_find_all("//div[@class = 'text']
                      /div[@class = 'xlkai alert alert-left w-row']
                     /div[@class = 'w-col w-col-6']
                     /ul[@class = 'w-list-unstyled']
                     /li/div/strong[text() = 'Autor: ']/parent::div") %>% 
    xml2::xml_contents() %>% 
    .[2] %>% 
    xml2::xml_text()
  
  arte <- page %>% 
    xml2::read_html() %>% 
    xml2::xml_find_all("//div[@class = 'text']
                     /div[@class = 'xlkai alert alert-left w-row']
                     /div[@class = 'w-col w-col-6']
                     /ul[@class = 'w-list-unstyled']
                     /li/div/strong[text() = 'Arte: ']/parent::div") %>% 
    xml2::xml_contents() %>% 
    .[2] %>% 
    xml2::xml_text()
  
  ano <- page %>% 
    xml2::read_html() %>% 
    xml2::xml_find_all("//div[@class = 'text']
                     /div[@class = 'xlkai alert alert-left w-row']
                     /div[@class = 'w-col w-col-6']
                     /ul[@class = 'w-list-unstyled']
                     /li/div/strong[text() = 'Ano: ']/parent::div") %>% 
    xml2::xml_contents() %>% 
    .[2] %>% 
    xml2::xml_text()
  
  table <- data.frame(title, autor, arte, ano, stringsAsFactors = FALSE)
  table
}


