---
title: "The Journalism Around Amazon Fires"
subtitle: "An analysis of science journalism by the CBC"
summary:  "An analysis of science journalism by the CBC"
date: "2021-06-05"
author: "Derek Michael Wright <wrightmderek@gmail.com> [www.dblogr.com/](https://dblogr.com/dblogr/fires_amazon/)"
tags: [ "dblogr", "SciComm", "Politics" ]
weight: 3
codefolding_show: "hide"
image:
  preview_only: true
links:
  - icon: "file-code"
    icon_pack: "far"
    name: "HTML < R Script Vignette >"
    url: "https://derekmichaelwright.github.io/htmls/dblogr/fires_amazon.html"
---

<script src="{{< blogdown/postref >}}index_files/font-awesome/js/script.js"></script>

<script src="{{< blogdown/postref >}}index_files/htmlwidgets/htmlwidgets.js"></script>

<script src="{{< blogdown/postref >}}index_files/jquery/jquery.min.js"></script>

<link href="{{< blogdown/postref >}}index_files/datatables-css/datatables-crosstalk.css" rel="stylesheet" />

<script src="{{< blogdown/postref >}}index_files/datatables-binding/datatables.js"></script>

<link href="{{< blogdown/postref >}}index_files/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="{{< blogdown/postref >}}index_files/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />

<script src="{{< blogdown/postref >}}index_files/dt-core/js/jquery.dataTables.min.js"></script>

<link href="{{< blogdown/postref >}}index_files/crosstalk/css/crosstalk.css" rel="stylesheet" />

<script src="{{< blogdown/postref >}}index_files/crosstalk/js/crosstalk.min.js"></script>

-----

# Introduction

In August of 2019, fires in the Amazon made international news after the story became viral on social media. Notably, the story was tweeted out by the French President [Emmanuel Macron](https://twitter.com/EmmanuelMacron/status/1164617008962527232), and retweeted by the Canadian Prime Minister [Justin Trudeau](https://twitter.com/JustinTrudeau/status/1164703456453681153). These two tweets got \> 70,000 retweets and \> 200,000 likes combined, and serve as an example of how misleading information can quickly be spread online.

![](tweet_trudeau.png)

  - **Does the Amazon produce 20% of our planet’s oxygen? Is that a photo of the fires in question? Is the Amazon on fire?**

> *No*, phytoplankton in the ocean our are planet’s “lungs”. *No*, its over 20 years old. *Yes/No*, it is important to distinguish between *forest fires* (such as the one pictured in the tweet) and *controlled burning of dry scrub and felled trees as a strategy to gain ownership of land* (the type of fires in question).

For a good explanation, refer to this article by Machael Shellenberger: [**Click Here**](https://www.forbes.com/sites/michaelshellenberger/2019/08/26/why-everything-they-say-about-the-amazon-including-that-its-the-lungs-of-the-world-is-wrong/#546e8bd75bde)

# CBC reporting

In Canada, the story made national news for a week straight on the CBC:

[The National Aug 21 starting around 19:30](https://www.youtube.com/watch?v=oN4Wa-7eKyA)

> “Record number of wildfires burning in the amazon rain forest. Brazil’s space reserach centre has said its detected more than 74,000 fires this year. That’s 83% more than last year”

[The National Aug 22 starting around 5:58](https://www.youtube.com/watch?v=ZKEj45YaymI&t=417s)

> “Continues to burn at a record pace”

[The National Aug 23 starting around 3:33](https://www.youtube.com/watch?v=jCfPm2Qu58U&t=2403s)

> “The numbers show just how dire the situation is”

[The National Aug 25 starting around 6:55](https://www.youtube.com/watch?v=quMeStA20yk)

> “At least 41,000 wildfires have sparked in the world largest rain forest this year”

[The National Aug 26 starting around 4:05](https://www.youtube.com/watch?v=RQw251jYjj4)

> “Nearly 80,000 wildfires have been recorded this year”

[The National Aug 27 starting around 3:43](https://www.youtube.com/watch?v=3CmbJnJ9aWk)

> “The rain forrest is being consumed at a rate not seen in 9 years”

So what started as a *“record number”* eventually became a *“rate not seen in 9 years”* with no correction or acknowledgment of error. *“More than 74,000 fires”*, *“at least 41,000”*, *“nearly 80,000”*, where is the CBC getting this information? This article gives a source:

https://www.cbc.ca/news/world/trudeau-more-work-needed-g7-summit-amazon-burns-1.5257458

> “According to Brazil’s space research centre, INPE, which has been recording wildfires since 2013, more than 75,000 fires are burning in Brazil, which is a more than 80 per cent increase over the same period of 2018, the agency told Reuters.”

Ok, lets check out the data ourselves.

-----

# Data source

National Institute for Space Reserach (*INPE*)

http://queimadas.dgi.inpe.br/queimadas/portal-static/estatisticas\_paises/

<a href="https://github.com/derekmichaelwright/dblogr/blob/master/content/dblogr/fires_amazon/fires_amazon_data.xlsx">
<button class="btn btn-success"><i class="fa fa-save"></i> fires_amazon_data.xlsx</button>
</a>

-----

# Prepare Data

``` r
# devtools::install_github("derekmichaelwright/agData")
library(agData) # Loads: tidyverse, ggpubr, ggbeeswarm, ggrepel
library(readxl) # read_xlsx()
# Prep data
dd <- read_xlsx("fires_amazon_data.xlsx", "INPE") %>%
  filter(Year < 2020)
DT::datatable(dd)
```

<div id="htmlwidget-1" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"],[1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019],[null,1081,778,547,1653,6697,3883,7058,4532,4220,2777,3874,3683,1889,2978,2544,3045,4317,5960,2253,2553,4030],[null,1284,562,1060,1569,3100,1932,2898,2388,2761,1751,1396,2909,1128,1731,1716,1374,2026,3238,1239,1476,2865],[null,667,848,1267,1678,3549,2928,2529,2427,3340,1887,2004,2863,1266,2510,2284,1929,1659,3425,1922,2659,5213],[null,717,538,1081,1683,3643,2956,2743,2269,2550,1906,2290,2681,1617,2507,1891,2024,2024,3408,1703,1656,2842],[null,1811,2097,2090,3816,6448,6609,5075,4313,5123,2951,3138,4196,2625,3987,2844,2931,2169,3287,2571,3366,2963],[3551,3632,6274,8405,10845,16752,18024,7854,7601,12716,4594,3795,9895,5627,6830,4665,6212,5569,6185,5384,5790,7258],[8067,8758,4740,6488,18080,30391,30356,30238,17788,19931,14029,7824,21030,9768,14868,8794,10529,8541,19242,17568,12652,13394],[35551,39492,22204,31838,72412,57004,64067,90729,54630,91085,34431,21782,90444,23881,50926,21410,40845,37883,39088,37380,22774,51936],[41976,36914,23293,39829,93417,97758,121395,102455,76475,141220,50671,36116,109030,55031,63408,36019,42049,61739,42209,72895,42251,53234],[23499,27017,27332,31039,59258,57495,54292,65023,32043,67228,51784,31215,38842,23340,39860,22159,36572,46741,30809,33607,19568,25613],[6804,8863,8399,15640,39913,35422,45364,31631,29303,31421,30724,29396,24052,18541,18114,11955,17667,26411,19160,19334,13014,20585],[4448,4376,4465,6200,17092,22980,28640,14333,15415,12320,14428,12274,9761,13389,9519,11868,10723,17703,8207,11655,5113,7700]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Year<\/th>\n      <th>Jan<\/th>\n      <th>Feb<\/th>\n      <th>Mar<\/th>\n      <th>April<\/th>\n      <th>May<\/th>\n      <th>June<\/th>\n      <th>July<\/th>\n      <th>Aug<\/th>\n      <th>Sept<\/th>\n      <th>Oct<\/th>\n      <th>Nov<\/th>\n      <th>Dec<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8,9,10,11,12,13]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

First thing we notice, they have been recording data prior to 2013. That’s odd, why would the CBC say that? Perhaps a look at the data will tell us why.

-----

# Data visualization

``` r
# Prep data
xx <- dd %>% 
  mutate(Total = rowSums(., na.rm = T),
         Alpha = ifelse(Year < 2013, "Deleted", "Archived"))
# Plot
mp <- ggplot(xx, aes(x = Year, y = Total / 1000, alpha = Alpha)) + 
  geom_bar(stat = "identity", fill = "Darkred", color = "Black") +
  scale_x_continuous(breaks = c(min(xx$Year):max(xx$Year))) +
  scale_alpha_manual(values = c(1, 0.7)) +
  theme_agData(legend.position = "none", 
               axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x= NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_01.png", mp, width = 6, height = 4)
```

![Figure 1: Number of detected fires per year from 1999 - 2019.](fires_amazon_01.png)

Hmm, looking at *Figure 1* there seems to have been a lot more forest fires prior to 2013. Lets look at just the data CBC claimed was available (since 2013).

``` r
# Prep data
xx <- xx %>% filter(Year > 2012)
# Plot
mp <- ggplot(xx, aes(x = Year, y = Total / 1000)) + 
  geom_bar(stat = "identity", fill = "Darkred", color = "Black") +
  scale_x_continuous(breaks = c(min(xx$Year):max(xx$Year))) +
  theme_agData() +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x= NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_02.png", mp, width = 6, height = 4)
```

![Figure 2: Number of detected fires per year, from 2013 - 2020.](fires_amazon_02.png)

Even when looking at this subset of the data, it doesn’t appear to be some kind of crisis. However, lets look at the data by month and see if it tells a different story:

``` r
# Prep data
xx <- dd %>% filter(Year > 2012) %>%
  gather(Month, Value, 2:ncol(.)) %>%
  mutate(Month = factor(Month, levels = unique(Month)),
         Value = as.numeric(Value),
         Highlight = ifelse(Year == 2019, "1", "2"))
# Plot
mp <- ggplot(xx, aes(x = Month, y = Value / 1000, color = Year, group = Year)) + 
  geom_line(aes(size = Highlight, alpha = Highlight)) + 
  scale_size_manual(values = c(2, 1)) +
  scale_alpha_manual(values = c(1, 0.7), guide = F) +
  scale_color_gradientn(colors = c("darkblue", "darkorange3", "darkred")) +
  theme_agData(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) + 
  guides(size = F) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_03.png", mp, width = 6, height = 4)
```

![Figure 3: Number of detected fires per month, 2013-2019.](fires_amazon_03.png)

Now it does look like forest fires have increased. And if we compare the data from 2018, there is a significant increase, as the CBC notes:

> “Record number of wildfires burning in the amazon rain forest. Brazil’s space reserach centre has said its detected more than 74,000 fire this year. That’s 83% more than last year”

However, this calculation was done when the story broke, so we will recalculate it with the end of month values.

``` r
xx <- dd %>% select(-Dec, -Nov, -Oct, -Sept) %>%
  mutate(Total = rowSums(., na.rm = T),
         Highlight = ifelse(Year == 2019, "2", "1"))
x2018 <- xx$Total[xx$Year == 2018]
x2018 # 54944 forest fires from Jan 01 - Aug 31 2018
```

    ## [1] 54944

``` r
x2019 <- xx$Total[xx$Year == 2019]
x2019 # 92520 forest fires from Jan 01 - Aug 31 2019
```

    ## [1] 92520

``` r
100 * (x2019-x2018) / x2018
```

    ## [1] 68.38963

We can see there is indeed a 68% increase from the same time last year.

However, what happens when we look at all the data?

-----

``` r
# Prep data
xx <- dd %>% gather(Month, Value, 2:ncol(.)) %>%
  mutate(Month = factor(Month, levels = unique(Month)),
         Value = as.numeric(Value),
         Highlight = ifelse(Year == 2019, "1", "2"))
# Plot
mp <- ggplot(xx, aes(x = Month, y = Value / 1000, color = Year, group = Year)) + 
  geom_line(aes(size = Highlight, alpha = Highlight)) + 
  scale_size_manual(values = c(2, 1)) +
  scale_alpha_manual(values = c(1, 0.6), guide = F) +
  scale_color_gradientn(colors = c("darkblue", "darkorange3", "darkred")) +
  theme_agData(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  guides(size = F) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE") 
ggsave("fires_amazon_04.png", mp, width = 6, height = 4)
```

![Figure 4: Number of detected fires per month, 1998-2019.](fires_amazon_04.png)

Now a different picture is painted. But why pick 2013 as the starting point?

``` r
# Prep data
x1 <- xx %>% filter(Year %in% c(2020, 2019, 2012, 2013)) %>%
  mutate(Year = factor(Year))
# Plot
mp <- ggplot(x1, aes(x = Month, y = Value / 1000, color = Year, group = Year)) + 
  geom_line(size = 2, alpha = 0.5) + 
  geom_point(size = 2) +
  scale_color_manual(values = c("darkblue", "darkorange3", "darkred")) +
  theme_agData(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_05.png", mp, width = 6, height = 4)
```

![Figure 5: Number of detected fires per month, 2012, 2013 & 2019.](fires_amazon_05.png)

Looks like they just went back to the first year things were worse. However in thier last report, they do note that:

> “The rain forrest is being consumed at a rate not seen in 9 years”

so what happened in 2010 (9 years ago)

``` r
# Prep data
x1 <- xx %>% filter(Year %in% c(2019, 2010)) %>%
  mutate(Year = factor(Year))
# Plot
mp <- ggplot(x1, aes(x = Month, y = Value / 1000, color = Year, group = Year)) + 
  geom_line(size = 2, alpha = 0.5) + 
  geom_point(size = 2) + 
  scale_color_manual(values = c("darkblue", "darkred")) +
  theme_agData(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_06.png", mp, width = 6, height = 4)
```

![Figure 6: Number of detected fires per month, 2010 & 2019.](fires_amazon_06.png)

Now lets do our own bias selection of data:

``` r
# Prep data
x1 <- xx %>% filter(Year %in% c(2019, 2010, 2007, 2005, 2004, 2003, 2002))
# Plot
mp <- ggplot(x1, aes(x = Month, y = Value / 1000, color = Year, group = Year)) + 
  geom_line(aes(size = Highlight, alpha = Highlight)) + 
  scale_size_manual(values = c(2, 1)) +
  scale_alpha_manual(values = c(1, 0.6), guide = F) +
  scale_color_gradientn(colors = c("darkblue", "darkorange3", "darkred")) +
  theme_agData(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  guides(size = F) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_07.png", mp, width = 6, height = 4)
```

![Figure 7: Number of detected fires per month for selected years.](fires_amazon_07.png)

Doing this makes it seem like forest fires are decreasing.

Lastly, lets do a cumulative sum and plot all the data:

``` r
xx <- dd %>% gather(Month, Value, 2:ncol(.)) %>%
  mutate(Month = factor(Month, levels = unique(Month)),
         Highlight = ifelse(Year == 2019, "1", "2"))
for(i in unique(xx$Year)) {
  xx[xx$Year == i,"Value"] <- cumsum(xx[xx$Year == i,"Value"])
}
mp <- ggplot(xx, aes(x = Month, y = Value / 1000, color = Year, group = Year)) +
  geom_line(aes(size = Highlight, alpha = Highlight)) +
  scale_size_manual(values = c(2, 1)) +
  scale_alpha_manual(values = c(1, 0.6), guide = F) +
  scale_color_gradientn(colors = c("darkblue", "darkorange3", "darkred")) +
  theme_agData(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
  guides(size = F) +
  labs(title = "Fires detected by the INPE",
       y = "Fires (x1000)", x = NULL,
       caption = "\xa9 www.dblogr.com/  |  Data: INPE")
ggsave("fires_amazon_08.png", mp, width = 6, height = 4)
```

![Figure 8: Cumulative number of detected fires by month, 1998-2019.](fires_amazon_08.png)

This all raises in interesting question: is the CBC being purposely deceitful? or are they just poor journalists?

You decide…

-----

© Derek Michael Wright [www.dblogr.com/](https://dblogr.com/)
