


#' Binning function for Time Series
#'
#' Get it a crack
#'
#' @name binner
#' @param df Input df
#' @param date_var Unquoted name of your date variable (POSIX)
#' @param val_var Unquoted name of your value variable
#' @param sum_nm Char string of summing variable name, defauls to "Total"
#' @param count_nm Char string of count variable name, defauls to "Count"
#' @param method Defaults to "sum", or use "avg"/"mean"
#' @export


binner <- function(df,
                   date_var,
                   cat_var, val_var,
                   interval = "day",
                   sum_nm = "Total",
                   count_nm = "Count",
                   method = "sum") {

  date_var <- enquo(date_var)
  val_var <- enquo(val_var)
  cat_var_ <- enquo(cat_var)

  if (method == "sum"){
    df <- df %>%
      mutate(bin_id = floor_date(!!date_var, interval)) %>%
      group_by(bin_id) %>%
      group_by(!!cat_var_, add = TRUE) %>%
      summarise(!!sum_nm := sum(as.numeric(!!val_var)),
                !!count_nm := n())
  }
  if (method == "avg" | method == "mean"){
    df <- df %>%
      mutate(bin_id = floor_date(!!date_var, interval)) %>%
      group_by(bin_id) %>%
      group_by(!!cat_var_, add = TRUE) %>%
      summarise(!!sum_nm := mean(as.numeric(!!val_var), na.rm = T),
                !!count_nm := n())
  }
  df
}


