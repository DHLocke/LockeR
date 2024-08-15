inla_table_fe <- function(inla_model){
  inla_model |>
    purrr::pluck('summary.fixed') |>
    tibble::rownames_to_column(var = 'Predictors') |>
    select(Predictors, median = `0.5quant`, lower = `0.025quant`, upper = `0.975quant`) |>
    mutate(across(c(-Predictors), round, 3))
}
