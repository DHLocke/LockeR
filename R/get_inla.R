get_inla <- function(){
  keep(eapply(.GlobalEnv, class), ~any(str_detect(., 'inla'))) %>%
    names(.) %>% as.character(.)
}


get_inla()
get_inla() |> mget()
