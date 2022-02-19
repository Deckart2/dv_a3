library(tidyverse)
library(rjson)

cum_stats <- read_tsv("cumulative-stats.tsv")
player_lookup <- fromJSON(file = "player-lookup.json") 
pl <- do.call(rbind.data.frame, player_lookup)
cum_stats_joined <- left_join(cum_stats, pl)

cum_stats_joined <- mutate(cum_stats_joined, 
                           current_age =
                           year - year_start + age_start)


write.csv(cum_stats_joined, "cum_stats_joined.csv")
