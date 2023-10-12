#
#x1 <- d2 %>% select(1:5) %>% gather(Industry, Value, 4:5)
#x2 <- d2 %>% select(1:3, 9:ncol(.)) %>% gather(Industry, Value, 4:ncol(.))
#x3 <- x2
#for(i in 1:nrow(x3)) {
#  x3[i,"Value"] <- d1[d1$Area==x3$Area[i] & d1$Year==x3$Year[i],"Current dollars"] * x3[i,"Value"] / 100  
#}

```{r eval = F, echo = F}
xx <- x3 %>% filter(Year == 2016, Area %in% c("Saskatchewan","British Columbia")) %>%
  left_join(d3, by = c("Area","Year")) %>%
  mutate(Value = Value.x / Value.y,
         Industry = factor(Industry, levels = levs))
mp <- ggplot(xx, aes(x = Area, y = Value, fill = Area)) +
  geom_bar(stat = "identity") +
  facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) +
  labs(title ="GDP Per Person 2016", y = "Million $ / Person", x = NULL)#+
#scale_y_log10()
ggsave("economics_of_canada_6.4.png", mp, width = 25, height = 8)
```

# Pie Charts

```{r eval = F, echo = F}
gg_econ <- function(xx, years, provinces) {
  xx <- d1 %>% filter(Year %in% years, Area %in% provinces)
  ggplot(xx, aes(x = 1, y = Value, fill = Industry)) + 
    geom_bar(stat = "identity", color = "black") +
    coord_polar("y", start = 0) +
    facet_grid(Area ~ Year) +
    #theme_minimal() +
    theme(axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.ticks = element_blank(),
          axis.text = element_blank()) + 
    labs(title = "Percent GDP by Industry", caption = "Data: www.statcan.gc.ca/")
}
```

```{r eval = F, echo = F}
# Prep data
xx <- d2 %>% 
  filter(Year %in% c(1999,2006,2015,2018), 
         Area %in% c("British Columbia", "Alberta", "Saskatchewan", "Ontario", "Quebec"))
# Plot
ggplot(xx, aes(x = 1, y = `Current dollars`, fill = Industry)) + 
  geom_bar(stat = "identity", color = "black") +
  coord_polar("y", start = 0) +
  facet_grid(Area ~ Year) +
  #theme_minimal() +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank()) + 
  labs(title = "Percent GDP by Industry", caption = "Data: www.statcan.gc.ca/")
mp <- gg_econ(x1, c(1999,2006,2015,2018), c("British Columbia", "Alberta", "Saskatchewan", "Ontario", "Quebec" )) +
  theme(legend.position = "bottom")
ggsave("economics_of_canada_08.png", mp, width = 8, height = 6)
```



```{r eval = F, echo = F}
mp <- gg_econ(x2, c(1997,2006,2015,2018),
              c("Alberta","British Columbia","Ontario","Quebec","Saskatchewan"))
ggsave("economics_of_canada_09.png", mp, width = 10, height = 6)
```


```{r eval = F, echo = F}
provs <- c("British Columbia", "Alberta", "Saskatchewan", "Manitoba", "Ontario", "Quebec", 
           "New Brunswick", "Newfoundland & Labrador", "Prince Edward Island", "Nova Scotia", 
           "Yukon", "Nunavut", "Northwest Territories")
xx <- x2 %>% spread(Year, Value) %>% 
  mutate(Area = factor(Area, levels = provs),
         Difference = `2015` - `2006`)
#
mp <- ggplot(xx, aes(x = Industry, y = Difference, fill = Industry)) + 
  geom_bar(stat = "identity") +
  facet_wrap(.~Area, scale = "free_y", ncol = 5) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  labs(title = "Change in GDP percent by Industry (2006-2015)", 
       caption = "Data: www.statcan.gc.ca/",
       y = "Percent of GDP change", x = NULL)
ggsave("economics_of_canada_10.png", mp, width = 15, height = 6)
```



```{r eval = F, echo = F}
xx <- x2 %>% filter(Area %in% c("Alberta","Quebec","British Columbia", "Saskatchewan"))
mp1 <- ggplot(xx, aes(x = Year, y = Value, color = Area)) + 
  geom_line() +
  facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5)) +
  labs(title = "Percent GDP", y = "Percent", x = NULL,
       caption = "Data: www.statcan.gc.ca/")
ggsave("economics_of_canada_5.1.png", mp1, width = 25, height = 5)
```


```{r eval = F, echo = F}
xx <- x3 %>% filter(Area %in% c("Alberta","Quebec","British Columbia", "Saskatchewan"))
mp2 <- ggplot(xx, aes(x = Year, y = Value, color = Area)) + 
  geom_line() +
  facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) + 
  scale_y_log10(breaks = c(1000,10000,100000)) +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5)) +
  labs(title = "GDP", y = "Million $", x = NULL,
       caption = "Data: www.statcan.gc.ca/")
ggsave("economics_of_canada_5.2.png", mp2, width = 25, height = 5)
```

```{r eval = F, echo = F}
xx <- x3 %>% filter(Area %in% c("Alberta","Quebec","British Columbia", "Saskatchewan")) %>%
  left_join(d3, by = c("Area","Year")) %>%
  mutate(GDP_PP = Value / Number) #GDP per person
mp3 <- ggplot(xx, aes(x = Year, y = Value, color = Area)) + 
  geom_line() +
  scale_y_log10(breaks = c(0.001,0.01,0.02)) +
  facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) + 
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5)) +
  labs(title = "GDP per person (current dollars)", y = "Million $ / Person", x = NULL,
       caption = "Data: www.statcan.gc.ca/")
ggsave("economics_of_canada_5.3.png", mp3, width = 25, height = 5)
```

```{r eval = F, echo = F}
ggGDP_PP <- function(prov1, prov2) {
  levs <- x3 %>% filter(Year == 2016, Area == "Alberta") %>% arrange(Value) %>% pull(Industry)
  xx <- x3 %>% filter(Year == 2016, Area %in% c("Alberta","Quebec")) %>%
    left_join(d3, by = c("Area","Year")) %>%
    mutate(GDP_PP = Value / Number,
           Industry = factor(Industry, levels = levs))
  ggplot(xx, aes(x = Area, y = Value, fill = Area)) +
    geom_bar(stat = "identity") +
    facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) +
    labs(title ="GDP Per Person 2016", y = "Million $ / Person", x = NULL)#+
  #scale_y_log10()
}

ggsave("economics_of_canada_6.1.png", mp, width = 25, height = 8)
```

```{r eval = F, echo = F}
levs <- x3 %>% filter(Year == 2016, Area == "Alberta") %>% arrange(Value) %>% pull(Industry)
xx <- x3 %>% filter(Year == 2016, Area %in% c("Alberta","British Columbia")) %>%
  left_join(d3, by = c("Area","Year")) %>%
  mutate(GDP_PP = Value / Number,
         Industry = factor(Industry, levels = levs))
mp <- ggplot(xx, aes(x = Area, y = Value, fill = Area)) +
  geom_bar(stat = "identity") +
  facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) +
  labs(title ="GDP Per Person 2016", y = "Million $ / Person", x = NULL)#+
#scale_y_log10()
ggsave("economics_of_canada_6.2.png", mp, width = 25, height = 8)
```

```{r eval = F, echo = F}
levs <- x3 %>% filter(Year == 2016, Area == "Saskatchewan") %>% arrange(Value) %>% pull(Industry)
xx <- x3 %>% filter(Year == 2016, Area %in% c("Saskatchewan","Quebec")) %>%
  left_join(d3, by = c("Area","Year")) %>%
  mutate(Value = Value.x / Value.y,
         Industry = factor(Industry, levels = levs))
mp <- ggplot(xx, aes(x = Area, y = Value, fill = Area)) +
  geom_bar(stat = "identity") +
  facet_grid(.~Industry, labeller = label_wrap_gen(width = 15)) +
  labs(title ="GDP Per Person 2016", y = "Million $ / Person", x = NULL)#+
#scale_y_log10()
ggsave("economics_of_canada_6.3.png", mp, width = 25, height = 8)
```



```{r eval = F, echo = F}
i<-1
year <- xx$Year[i]
province <- xx$Province[i]
year_div <- function(year, province) {
  levs <- x2 %>% filter(Year == year, Area == province) %>% 
    arrange(Value) %>% pull(Industry)
  xx <- x2 %>% filter(Year == year, Area == province) %>%
    mutate(Industry = factor(Industry, levels = levs))
  #
  mp <- ggplot(xx, aes(x = Industry, y = Value)) +
    geom_bar(stat = "identity", color = "black", fill = "darkred") + 
    geom_smooth(method = lm, se = F, size = 2, color = "black") +
    labs(title ="GDP Per Person 2016", y = "Million $ / Person", x = NULL)
}
year_slope <- function(year, province) {
  levs <- x2 %>% filter(Year == year, Area == province) %>% 
    arrange(Value) %>% pull(Industry)
  xx <- x2 %>% filter(Year == year, Area == province) %>%
    mutate(Industry = as.numeric(factor(Industry, levels = levs)))
  lm(Value ~ Industry, data = xx)$coefficients
}
xx <- d1 %>% mutate(Intercept = NA, Slope = NA) %>% filter(!Year %in% 1997:1998)
i<-1
for (i in 1:nrow(xx)) {
  xx[i,c("Intercept","Slope")] <- year_slope(xx$Year[i], xx$Area[i])
}
xi<-xx%>%filter(Area == "Alberta", Year == 2010)
#ggplot(xx%>%filter(Area == "Alberta"), aes(slope=Slope, intercept = Intercept, color = Year, group = Year)) + 
#  geom_abline() + 
#  facet_grid(Area~Year) +
#  ylim(c(min(xx$Intercept),10))
ggplot(xx, aes(x = Year, y = Slope)) + geom_bar(stat = "identity") + facet_grid(.~Area)
ggplot(xx, aes(x = Year, y = Intercept)) + geom_bar(stat = "identity") + facet_grid(.~Area)
```