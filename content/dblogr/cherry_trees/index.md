---
title: "Cherry Tree Flowering Date"
subtitle: "Historical Series of Phenological data for Cherry Tree Flowering at Kyoto City"
summary:  "Historical Series of Phenological data for Cherry Tree Flowering at Kyoto City"
date: "2021-06-05"
author: "Derek Michael Wright <wrightmderek@gmail.com> [www.dblogr.com/](https://dblogr.com/dblogr/cherry_trees/)"
tags: [ "dblogr", "SciComm" ]
weight: 10
codefolding_show: "hide"
image:
  preview_only: true
links:
  - icon: "file-code"
    icon_pack: "far"
    name: "HTML < R Script Vignette >"
    url: "https://derekmichaelwright.github.io/htmls/dblogr/cherry_trees.html"
---

<script src="{{< blogdown/postref >}}index_files/font-awesome/js/script.js"></script>

-----

# Data

http://atmenv.envi.osakafu-u.ac.jp/aono/kyophenotemp4/

<a href="https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/cherry_trees/KyotoFullFlower7.csv">
<button class="btn btn-success"><i class="fa fa-save"></i> KyotoFullFlower7.csv</button>
</a>

-----

# Prepare data

``` r
# devtools::install_github("derekmichaelwright/agData")
library(agData) # Loads: tidyverse, ggpubr, ggbeeswarm, ggrepel
# Prep data
dd <- read.csv("KyotoFullFlower7.csv") %>%
  filter(!is.na(Full.flowering.date..DOY.))
```

-----

# All Data

``` r
# Plot
mp <- ggplot(dd, aes(x = AD, y = Full.flowering.date..DOY.)) +
  geom_smooth(method = "loess", se = F, color = "black") +
  geom_line(alpha = 0.8, color = "darkgreen") +
  scale_x_continuous(breaks = seq(800, 2000, 100)) +
  theme_agData() +
  labs(title = "Cherry Tree Flowering Date - Kyoto City", y = "Day of the Year", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: OPU")
ggsave("cherry_trees_01.png", mp, width = 12, height = 4)
```

![](cherry_trees_01.png)

-----

# Last 100 Years

``` r
# Prep data
xx <- dd %>% filter(AD > 1900)
# Plot
mp <- ggplot(xx, aes(x = AD, y = Full.flowering.date..DOY.)) +
  geom_smooth(method = "lm", se = F, color = "darkgreen") +
  geom_line(alpha = 0.8) +
  theme_agData() +
  labs(title = "Cherry Tree Flowering Date - Kyoto City", y = "Day of the Year", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: OPU")
ggsave("cherry_trees_02.png", mp, width = 12, height = 4)
```

![](cherry_trees_02.png)

-----

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
