# 1. load library ---------------------------------------------------------

library(tidyverse) # data manipulation and visualization

?diamonds

View(diamonds)

str(diamonds)

glimpse(diamonds)


# 2. check for any NA values per column in dataset ------------------------
colSums(is.na(diamonds))


# 3. subset by row with filter --------------------------------------------
?filter

ideal_diamonds <- diamonds %>% 
  filter(cut == "Ideal")

exp_diamonds <- diamonds %>% 
  filter(price >= 10000)

exp_ideal <- diamonds %>% 
  filter(cut == "Ideal",
         price >= 10000)


# 4. subset by column with select -----------------------------------------
?select

mini_diamonds <- diamonds %>% 
  select(cut, color, price)

mini_diamonds <- diamonds %>% 
  select(1:5)

mini_diamonds <- diamonds %>% 
  select(starts_with("c"))

mini_diamonds <- diamonds %>% 
  select(contains("c"))

mini_diamonds <- diamonds %>% 
  select(cut,
         everything())

mini_diamonds <- diamonds %>% 
  select(-price) # remove price column

View(mini_diamonds)


# 5. reorder rows with arrange() ------------------------------------------
?arrange

diam_arr <- diamonds %>% 
  arrange(color)

diam_arr <- diamonds %>% 
  arrange(desc(depth))

diam_arr <- diamonds %>% 
  arrange(color, carat)

View(diam_arr)


# 6. add or modify columns with mutate() ----------------------------------
?mutate

upd_diamonds <- diamonds %>% 
  mutate(g_mass = .20 * carat) # new column g_mass added

upd_diamonds <- diamonds %>% 
  mutate(g_mass = .20 * carat,
         price_per_carat = price / carat) # added multiple columns

upd_diamonds <- diamonds %>% 
  mutate(g_mass = .20 * carat,
         price_per_carat = price / carat,
         exp_bool = price >= 5000)

View(upd_diamonds)


# 7. grouped summaries with group_by() and summarise() --------------------
diamonds %>% 
  group_by(cut) %>% 
  summarise(avg_price = mean(price))


diamonds %>% 
  group_by(cut) %>% 
  summarise(avg_price = mean(price),
            sd_price = sd(price),
            count = n()) # multiple summaries


diamonds %>% 
  group_by(cut,
           color) %>% 
  summarise(avg_price = mean(price),
            sd_price = sd(price),
            count = n()) # multiple groupings


diamonds %>% 
  count(color,
        cut) # counts only






