---
title: "Hex Stickers"
subtitle: "Creation of hex stickers with R"
summary:  "Creation of hex stickers with R"
date: "2021-06-05"
author: "Derek Michael Wright <wrightmderek@gmail.com> [www.dblogr.com/](https://dblogr.com/dblogr/hex_stickers/)"
tags: [ "dblogr", "R" ]
weight: 5
codefolding_show: "hide"
image:
  preview_only: true
links:
  - icon: "file-code"
    icon_pack: "far"
    name: "HTML < R Script Vignette >"
    url: "https://derekmichaelwright.github.io/htmls/dblogr/hex_stickers.html"
---



---


```r
# devtools::install_github("derekmichaelwright/agData")
library(agData) # Loads: tidyverse, ggpubr, ggbeeswarm, ggrepel
library(hexSticker)
```

---

# dblogr


```r
sticker(filename="hex_dblogr.png", package="",  
        # Logo
        "logo_mapleleaf_dblogr.png", 
        s_x = 1, s_y = 1, 
        s_width = 0.8,
        # Border
        h_fill = "grey90", h_color = "darkgreen", h_size = 1.5,
        # Url
        url = "www.dblogr.com/", u_color = "black",
        u_x = 1.1, u_y = 0.15, u_size = 6 )
```

![](hex_dblogr.png)

---

# agData


```r
# Prep data
xx <- agData_FAO_Crops %>% 
  filter(Area        == "Canada", 
         Crop        == "Lentils", 
         Measurement == "Production")
# Create sticker
mp <- ggplot(xx, aes(x = Year, y = Value) ) + 
  geom_line(size = 1) + 
  theme_void() +
  theme(panel.grid.major = element_line(size = 0.5,  colour = "white"), 
        panel.grid.minor = element_line(size = 0.25, colour = "white") ) 
#
sticker(filename = "hex_agData.png",
        package = "agData", p_color = "grey10",
        p_x = 0.9, p_y = 1.3, p_size = 27,
        # Logo
        mp, s_x = 1, s_y = 1, 
        s_width = 1.5, s_height = 1,
        # Border 
        h_fill = "grey90", h_color = "darkgreen", h_size = 1.5,#"darkolivegreen"
        # Url
        url = "github.com/derekmichaelwright", u_color = "black",
        u_x = 1, u_y = 0.09, u_size = 4.5 )
```

![](hex_agData.png)

---

# Green mapleleaf


```r
sticker(filename="hex_mapleleaf_green.png", package="",  
        # Logo
        "logo_mapleleaf_green.png", #"logo_dblog.png", 
        s_x = 1, s_y = 1, 
        s_width = 0.8,
        # Border
        h_fill = "grey90", h_color = "darkgreen", h_size = 1.5,
        # Url
        url = "www.dblogr.com/", u_color = "black",
        u_x = 1.1, u_y = 0.15, u_size = 6 )
```

![](hex_mapleleaf_green.png)

---

# Red mapleleaf


```r
sticker(filename="hex_mapleleaf_red.png", package="",  
        # Logo
        "logo_mapleleaf_red.png", #"logo_dblog.png", 
        s_x = 1, s_y = 1, 
        s_width = 0.8,
        # Border
        h_fill = "grey90", h_color = "darkred", h_size = 1.5,
        # Url
        url = "www.dblogr.com/", u_color = "black",
        u_x = 1.1, u_y = 0.15, u_size = 6 )
```

![](hex_mapleleaf_red.png)

---

# buffalo


```r
sticker(filename="hex_buffalo_green.png", package="",  
        # Logo
        "logo_buffalo_green.png", 
        s_x = 1, s_y = 1.1, 
        s_width = 0.9,
        # Border
        h_fill = "grey90", h_color = "darkgreen", h_size = 1.5,
        # Url
        url = "www.dblogr.com/", u_color = "black",
        u_x = 1.1, u_y = 0.15, u_size = 6 )
```

![](hex_buffalo_green.png)


```r
sticker(filename="hex_buffalo_black.png", package="",  
        # Logo
        "logo_buffalo_black.png", 
        s_x = 1, s_y = 1, 
        s_width = 0.9,
        # Border
        h_fill = "grey90", h_color = "darkgreen", h_size = 1.5,
        # Url
        url = "www.dblogr.com/", u_color = "black",
        u_x = 1.1, u_y = 0.15, u_size = 6 )
```

![](hex_buffalo_black.png)

---



---

&copy; Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
