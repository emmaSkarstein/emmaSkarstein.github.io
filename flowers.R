# ggplot flowers
# November 2023

library(ggplot2)
library(ggforce)

flower <- function(n_petals, 
                   fill_values = "white", 
                   color_values = "black", 
                   a = 0.5,
                   b = 0.5,
                   angle = 0, 
                   linewidth = 1){
  # Make color and fill vectors if only one color is given:
  if(length(fill_values) == 1){
    fill_values <- rep(fill_values, n_petals)
  }
  if(length(color_values) == 1){
    color_values <- rep(color_values, n_petals)
  }
  
  ggplot() +
    geom_ellipse(aes(x0 = 1:n_petals, y0 = 0, a = a, b = b, angle = angle,
                     fill = as.factor(1:n_petals), 
                     color = as.factor(1:n_petals)), 
                 linewidth = linewidth) +
    coord_polar() +
    scale_fill_manual(values = fill_values) +
    scale_color_manual(values = color_values) +
    theme_void() +
    theme(legend.position = "none") 
}

# Pansy
pansy_colors <- c("#EFE94F", "#8488D7", "#1E0E47", "#8488D7", "#EFE94F")
(pansy <- flower(5, fill_values = pansy_colors, a = 0.7))

# Poppy
(poppy <- flower(8, fill_values = "red3", a = 1.1))

# Sunflower
(sunflower <- flower(15, color_values = "#36180F", fill_values = "gold"))

# Calendula
(calendula <- flower(20, fill_values = "darkorange", a = 0.7))

# Pink pansy
(pink_pansy <- flower(
  5, a = 0.6, 
  fill_values = c("#EAC8D4", "#CB9DA7", "#B85186", "#CB9DA7", "#EAC8D4")))

# Orange
(orange_pansy <- flower(
  5, a = 0.7,
  fill_values = c("#804590", "#E1662D", "#C64826", "#E1662D", "#804590")))

# Pink nastertium
(nastertium <- flower(5, fill_values = "#D8647E", a = 0.48))

# Cream flower
(cream_flower <- flower(9, fill_values = "papayawhip", a = 0.46))

# Flax flower
(flax <- flower(5, fill_values = "#6280DF", a = 0.56))

  
  
library(patchwork)

(pansy | calendula | nastertium | orange_pansy | flax | 
    poppy | cream_flower | sunflower | pink_pansy)
