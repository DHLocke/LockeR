# scale_x_reordered <- function(..., sep = "___") {
#   reg <- paste0(sep, ".+$")
#   ggplot2::scale_x_discrete(labels = function(x) gsub(reg, "", x), ...)
# }


# # https://stackoverflow.com/questions/51710863/how-to-order-bars-within-all-facets
# scale_y_reordered <- function(..., sep = "___") {
#   reg <- paste0(sep, ".+$")
#   ggplot2::scale_y_discrete(labels = function(y) gsub(reg, "", y), ...)
# }
#
# reorder_within <- function(y, by, within, fun = mean, sep = "___", ...) {
#   new_y <- paste(y, within, sep = sep)
#   stats::reorder(new_y, by, FUN = fun)
# }
#
#
# # ggplot(ii, aes(reorder_within(sn, nbr, s), nbr)) +
# #      geom_bar(stat = 'identity') +
# #      scale_x_reordered() +
# #      facet_wrap(.~ s, ncol=2,scales = "free_x") +
# #     theme(axis.text.x=element_text(angle=90,hjust=1,vjust=.5,colour='gray50'))
#
#
#
# scale_x_reordered <- function(..., sep = "___") {
#   reg <- paste0(sep, ".+$")
#   ggplot2::scale_x_discrete(labels = function(x) gsub(reg, "", x), ...)
# }
#
# reorder_within <- function(x, by, within, fun = mean, sep = "___", ...) {
#   new_x <- paste(x, within, sep = sep)
#   stats::reorder(new_x, by, FUN = fun)
# }
