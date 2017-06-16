# timemerge
binning function for time series

```
devtools::install_github("rosseji/timemerge")

df_binned <- binner(df = df_coff,
                    date_var = Item.Time.Created.date,
                    cat_var = Item.Name,
                    val_var = Prices,
                    interval = "hour")
                    
ggplot(df_binned, aes(x = bin_id, y = Total, colour = Item.Name)) + 
  geom_line()
  
```
Has a new argument `method` to specify the math

![](https://media.tenor.com/images/e0a669626522df539e2c3cced9454700/tenor.gif)

```
df_binned <- binner(df = df_coff,
                    date_var = Item.Time.Created.date,
                    cat_var = Item.Name,
                    val_var = Prices,
                    interval = "hour",
                    method = "avg")
```
