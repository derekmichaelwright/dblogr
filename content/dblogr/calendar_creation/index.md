---
title: "Calendar Creation"
subtitle: "Create a custom calendar in R"
summary:  "Create a custom calendar in R"
date: "2021-06-05"
author: "Derek Michael Wright <wrightmderek@gmail.com> [www.dblogr.com/](https://dblogr.com/dblogr/calendar_creation)"
tags: [ "dblogr", "R" ]
weight: 3
codefolding_show: "hide"
image:
  preview_only: true
links:
  - icon: "file-code"
    icon_pack: "far"
    name: "HTML < R Script Vignette >"
    url: "https://derekmichaelwright.github.io/htmls/dblogr/calendar_creation.html"
  - icon: "file-pdf"
    icon_pack: "far"
    name: "Year Calendar"
    url: "https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/calendar_creation/calendar_year.pdf"
  - icon: "file-pdf"
    icon_pack: "far"
    name: "Monthly Calendar"
    url: "https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/calendar_creation/calendar_monthly.pdf"
  - icon: "file-pdf"
    icon_pack: "far"
    name: "Weekly Calendar"
    url: "https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/calendar_creation/calendar_weekly.pdf"
---

<script src="{{< blogdown/postref >}}index_files/font-awesome/js/script.js"></script>

<script src="{{< blogdown/postref >}}index_files/font-awesome/js/script.js"></script>

<script src="{{< blogdown/postref >}}index_files/font-awesome/js/script.js"></script>

-----

``` r
# Load libraries
library(tidyverse); library(lubridate); library(magick); library(fs)
library(extrafont); library(patchwork); library(sugrrants) 
```

-----

``` r
# Prep data
year <- 2021
min_date <- make_date(year)
days <- if_else(leap_year(min_date), 365, 364)
week <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
year_cal <- data.frame(date = min_date + 0:days, x = 0, y = 0) %>%
  mutate(month = format(date, "%B"),
         weekday = factor(format(date, "%A"), levels = week),
         day = format(date, "%e"), week = NA,
         weekend = as.factor(if_else(weekday %in% c("Saturday","Sunday"), 1, 0)),
         text = NA )
year_cal$weekday <- factor(year_cal$weekday,                  )
week <- 1
for(i in 1:nrow(year_cal)) {
  year_cal[i, "week"] <- week
  if(year_cal$weekday[i] == "Sunday" & i != 1) { week <- week + 1 }
}
# add text
year_cal$text[year_cal$date == "2021-01-01"] <- "This is the first day of the\nyear 2021"
year_cal$text[year_cal$date == "2021-07-01"] <- "Canada Day"
year_cal$text[year_cal$date == "2021-08-10"] <- "My Birthday"
year_cal$text[year_cal$date == "2021-12-25"] <- "Christmas"
```

-----

# Create Year Calendar

``` r
cal<-list()
for (i in 1:12) {
  start_date <- make_date(year, i)
  end_date <- start_date + months(1)
  tbl_cal <- year_cal %>% filter(date >= start_date, date < end_date)
  cal[[i]] <- ggplot(tbl_cal, aes(x = x, y = y)) +
    geom_text(aes(label = day), hjust = 0.5, size = 4, 
              alpha = 0.2, fontface = "bold.italic") +
    geom_rect(aes(fill = weekend), alpha = 0.1, 
              xmin = -1, xmax = 1, ymin = -1, ymax = 1) +
    facet_calendar(~ date, format = "%e", week_start = 7) +
    labs(x = "", y = "", title = tbl_cal$month[1]) +
    scale_fill_manual(values = c(alpha("darkgoldenrod",0.5), alpha("darkgreen",0.5))) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5),
          legend.position = "none",
          axis.ticks = element_blank(),
          axis.text = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          strip.background = element_blank(),
          strip.text = element_blank() 
          )
}
mp <- ggpubr::ggarrange(plotlist = cal, nrow = 3, ncol = 4) +
  annotate("text", label = year)
#
pdf(file = "calendar_year.pdf", width = 10.5, height = 8)
mp
dev.off() #dev.set(dev.next())
```

    ## png 
    ##   2

![](img_calendar_year.png)

<a href="https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/calendar_creation/calendar_year.pdf">
<button class="btn btn-success"><i class="fa fa-file-pdf"></i> calendar_year.pdf</button>
</a>

-----

# Create Monthly Calendar

``` r
pdf(file = "calendar_monthly.pdf", width = 10.5, height = 8)
par(mar = c(1,1,1,1))
for (i in 1:12) {
  im <- image_read(paste0("images/",list.files("images/")[i]))
  im <- grid::rasterGrob(im, interpolate = TRUE)
  month_image <- ggplot() + geom_blank() + theme_void() +
    annotation_custom(im)
  start_date <- make_date(year, i)
  end_date <- start_date + months(1)
  tbl_cal <- year_cal %>% filter(date >= start_date, date < end_date)
  cal <- ggplot(tbl_cal, aes(x = x, y = y)) +
    geom_rect(aes(fill = weekend), alpha = 0.1,
              xmin = -1, xmax = 1, ymin = -1, ymax = 1) +
    # For adding daily text
    geom_text(aes(label = text), x = -0.045, y = 0.045, 
              size = 2, alpha = 0.8, vjust = 1, hjust = 0,
              fontface = "bold.italic", data = tbl_cal %>% filter(!is.na(text))) +
    # Use this for day labels instead of facets
    #geom_text(aes(label = day),
    #  data = tbl_cal %>% filter(!is.na(text)),
    #  size = 4, alpha = 0.2, fontface = "bold.italic") +
    facet_calendar(~ date, format = "%e", week_start = 7) +
    labs(x = "", y = "", title = paste(year,"-",tbl_cal$month[1])) +
    scale_fill_manual(values = c(alpha("darkgoldenrod",0.5), alpha("darkgreen",0.5))) +
    theme_bw() +
    theme(legend.position = "none",
          axis.ticks = element_blank(),
          axis.text = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          strip.background = element_rect(fill = NA),
          strip.text = element_text(hjust = 0) )
  cal
  print(month_image)
  print(cal)
}
dev.off()
```

    ## png 
    ##   2

![](img_calendar_month.png)

<a href="https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/calendar_creation/calendar_monthly.pdf">
<button class="btn btn-success"><i class="fa fa-file-pdf"></i> calendar_monthly.pdf</button>
</a>

-----

# Create Weekly Calendar

``` r
pdf(file = "calendar_weekly.pdf", width = 8, height = 10.5)
par(mar = c(1,1,1,1))
for (i in 1:max(year_cal$week)) {
  tbl_cal <- year_cal %>% filter(week == i)
  cal <- ggplot(tbl_cal, aes(x = x, y = y)) +
    geom_rect(aes(fill = weekend), alpha = 0.1,
              xmin = -1, xmax = 1, ymin = -1, ymax = 1) +
    facet_grid(weekday + date ~ ., switch = "y") +
    # For adding daily text
    geom_text(aes(label = text), size = 4, alpha = 0.8,
      data = tbl_cal %>% filter(is.na(text))) +
    #
    labs(x = "", y = "", 
         title = paste(year, "-", tbl_cal$month[1], "- week -", tbl_cal$week[1])) +
    scale_fill_manual(values = c(alpha("darkgoldenrod",0.5), alpha("darkgreen",0.5))) +
    theme_bw() +
    theme(legend.position = "none",
          axis.ticks = element_blank(),
          axis.text = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          strip.background = element_rect(fill = NA) )
  print(cal)
}
dev.off()
```

    ## png 
    ##   2

![](img_calendar_week.png)

<a href="https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/calendar_creation/calendar_weekly.pdf">
<button class="btn btn-success"><i class="fa fa-file-pdf"></i> calendar_weekly.pdf</button>
</a>

-----

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
