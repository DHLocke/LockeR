inla_plot_fe <- function(inla_model){
  inla_model |>
    purrr::pluck('summary.fixed') |>
    tibble::rownames_to_column(var = 'predictor') |>
    ggplot(aes(`0.5quant`, predictor)) +
    geom_vline(xintercept = 0) +
    geom_point() +
    geom_errorbarh(aes(xmin = `0.025quant`, xmax = `0.975quant`, height = .5)) +
    theme_bw() +
    NULL
}
