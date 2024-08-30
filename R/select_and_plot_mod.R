select_and_plot_mod <- function(mod_1, mod_2) {
  winning_mod <-
    compare_performance(
      mod_1
      , mod_2
      , rank = TRUE
    ) |>
    tibble() |>
    arrange(desc(Performance_Score)) |> # is this really needed?
    slice(1) |>
    pull(Name) |>
    mget() |>
    pluck(1)

  graph <-
    winning_mod |>
    ggpredict(terms = c('STATECD_NWOS', 'urbanization')) |>
    # ggeffects::ggpredict(terms = c('urbanization', 'STATECD_NWOS')) |>
    plot() +
    NULL

  smry <- winning_mod |> summary()

  print(smry)
  return(graph)
}
