
# example script

df_binned <- binner(input)df,
                    date_var = ______,
                    fact_var = ______,
                    val_var = ______,
                    interval = "month") # "year" "month" "quarter" "week"


ggplot(df_binned, aes(x = bin_id, y = Total, colour = ______ )) +
  geom_line()

ggplot(df_binned, aes(x = bin_id, y = Count, colour = ______)) +
  geom_line()
