library(tidyverse)
library(hexbin)

# 1. LOAD DATA
shots <- read.csv("curry_shots_full.csv")
league <- read.csv("nba_league_avg_2024.csv")

# 2. STATISTICAL BENCHMARKING
plot_data <- shots %>%
  left_join(league, by = c("SHOT_ZONE_BASIC", "SHOT_ZONE_AREA")) %>%
  mutate(is_made = ifelse(EVENT_TYPE == "Made Shot", 1, 0)) %>%
  mutate(diff = is_made - FG_PCT)

# 3. THE VISUALIZATION
final_plot <- ggplot(plot_data, aes(x = LOC_X, y = LOC_Y, z = diff)) +
  annotate("rect", xmin = -250, xmax = 250, ymin = -52, ymax = 450, fill = "#0F0F0F", color = NA) +
  stat_summary_hex(fun = mean, bins = 45, color = "#0F0F0F", alpha = 0.9) +
  scale_fill_gradient2(low = "#0072B2", mid = "#F0F0F0", high = "#D55E00", 
                       midpoint = 0, labels = scales::percent) +
  
  # Court Lines
  annotate("rect", xmin = -250, xmax = 250, ymin = -52, ymax = 418, fill = NA, color = "white", linewidth = 0.6) +
  annotate("rect", xmin = -80, xmax = 80, ymin = -52, ymax = 138, fill = NA, color = "white", linewidth = 0.6) +
  stat_function(fun = function(x) sqrt(238^2 - x^2), xlim = c(-220, 220), color = "white", linewidth = 0.7) +
  
  coord_fixed(ylim = c(-60, 480), xlim = c(-260, 260)) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "#0F0F0F", color = NA),
    plot.title = element_text(color = "white", face = "bold", size = 20, hjust = 0.5, margin = margin(t = 15)),
    plot.subtitle = element_text(color = "#AAAAAA", size = 11, hjust = 0.5),
    legend.position = "bottom",
    legend.text = element_text(color = "white"),
    legend.title = element_text(color = "white")
  ) +
  labs(title = "STEPHEN CURRY: MARKET ALPHA",
       subtitle = "Efficiency vs. 2023-24 NBA Average",
       fill = "Performance Delta")

# 4. SAVE FINAL IMAGE
ggsave("Curry_Portfolio_Final.png", final_plot, width = 7, height = 8, dpi = 300)
print("Image saved as Curry_Portfolio_Final.png")