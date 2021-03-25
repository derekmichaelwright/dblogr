+++
widget = "blank"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = false  # This file represents a page section.
active = false  # Activate this widget? true/false
weight = 3  # Order that this section will appear.

title = "The Journalism Around Amazon Fires"
subtitle = "An analysis of science journalism by the CBC"
summary  = "An analysis of science journalism by the CBC"
tags = [ "dblogr", "SciComm", "Featured" ]

[image]
  preview_only = true
  
[design]
  columns = "1"
+++

{{% alert note %}}
**< R Script >**: [fires_amazon.html](https://derekmichaelwright.github.io/htmls/dblogr/fires_amazon.html)
{{% /alert %}}

# Introduction

In August of 2019, fires in the Amazon made international news after the story became viral on social media. Notably, the story was tweeted out by the French President [Emmanuel Macron](https://twitter.com/EmmanuelMacron/status/1164617008962527232), and retweeted by the Canadian Prime Minister [Justin Trudeau](https://twitter.com/JustinTrudeau/status/1164703456453681153). These two tweets got > 70,000 retweets and > 200,000 likes combined, and serve as an example of how misleading information can quickly be spread online.

![](tweet_trudeau.png)

- **Does the Amazon produce 20% of our planet's oxygen? Is that a photo of the fires in question? Is the Amazon on fire?** 

> *No*, phytoplankton in the ocean our are planet's "lungs". *No*, its over 20 years old. *Yes/No*, it is important to distinguish between *forest fires* (such as the one pictured in the tweet) and *controlled burning of dry scrub and felled trees as a strategy to gain ownership of land* (the type of fires in question).

For a good explanation, refer to this article by Machael Shellenberger: [**Click Here**](https://www.forbes.com/sites/michaelshellenberger/2019/08/26/why-everything-they-say-about-the-amazon-including-that-its-the-lungs-of-the-world-is-wrong/#546e8bd75bde) 

# CBC reporting

In Canada, the story made national news for a week straight on the CBC:

[The National Aug 21 starting around 19:30](https://www.youtube.com/watch?v=oN4Wa-7eKyA)

> "Record number of wildfires burning in the amazon rain forest. Brazil's space reserach centre has said its detected more than 74,000 fires this year. That's 83% more than last year"

[The National Aug 22 starting around  5:58](https://www.youtube.com/watch?v=ZKEj45YaymI&t=417s)

> "Continues to burn at a record pace"

[The National Aug 23 starting around  3:33](https://www.youtube.com/watch?v=jCfPm2Qu58U&t=2403s) 

> "The numbers show just how dire the situation is"

[The National Aug 25 starting around 6:55](https://www.youtube.com/watch?v=quMeStA20yk)

> "At least 41,000 wildfires have sparked in the world largest rain forest this year"

[The National Aug 26 starting around 4:05](https://www.youtube.com/watch?v=RQw251jYjj4)

> "Nearly 80,000 wildfires have been recorded this year"

[The National Aug 27 starting around 3:43](https://www.youtube.com/watch?v=3CmbJnJ9aWk) 

> "The rain forrest is being consumed at a rate not seen in 9 years"

So what started as a *"record number"* eventually became a *"rate not seen in 9 years"* with no correction or acknowledgment of error. *"More than 74,000 fires"*, *"at least 41,000"*, *"nearly 80,000"*, where is the CBC getting this information? This article gives a source:

https://www.cbc.ca/news/world/trudeau-more-work-needed-g7-summit-amazon-burns-1.5257458

> "According to Brazil's space research centre, INPE, which has been recording wildfires since 2013, more than 75,000 fires are burning in Brazil, which is a more than 80 per cent increase over the same period of 2018, the agency told Reuters."

Ok, lets check out the data ourselves.

Data source: National Institute for Space Reserach (*INPE*)

[http://queimadas.dgi.inpe.br/queimadas/portal-static/estatisticas_paises/](http://queimadas.dgi.inpe.br/queimadas/portal-static/estatisticas_paises/)

---

# Data

[*Download Data*](https://github.com/derekmichaelwright/htmls/blob/master/dblogr/fires_amazon_data.xlsx?raw=true)

---

First thing we notice, they have been recording data prior to 2013. That's odd, why would the CBC say that? Perhaps a look at the data will tell us why.

![Figure 1: Number of detected fires per year from 1999 - 2019.](fires_amazon_01.png)

Hmm, looking at *Figure 1* there seems to have been a lot more forest fires prior to 2013. Lets look at just the data CBC claimed was available (since 2013).

![Figure 2: Number of detected fires per year, from 2013 - 2020.](fires_amazon_02.png)

Even when looking at this subset of the data, it doesn't appear to be some kind of crisis. However, lets look at the data by month and see if it tells a different story:

![Figure 3: Number of detected fires per month, 2013-2019.](fires_amazon_03.png)

Now it does look like forest fires have increased. And if we compare the data from 2018, there is a significant increase, as the CBC notes:

> "Record number of wildfires burning in the amazon rain forest. Brazil's space reserach centre has said its detected more than 74,000 fire this year. That's 83% more than last year"

However, this calculation was done when the story broke, so we will recalculate it with the end of month values.

We can see there is indeed a 68% increase from the same time last year. 

However, what happens when we look at all the data?

---

# Data visualization

![Figure 4: Number of detected fires per month, 1998-2019.](fires_amazon_04.png)

Now a different picture is painted. But why pick 2013 as the starting point?

![Figure 5: Number of detected fires per month, 2012, 2013 & 2019.](fires_amazon_05.png)

Looks like they just went back to the first year things were worse. However in thier last report, they do note that:

> "The rain forrest is being consumed at a rate not seen in 9 years"

so what happened in 2010 (9 years ago)

![Figure 6: Number of detected fires per month, 2010 & 2019.](fires_amazon_06.png)

Now lets do our own bias selection of data:

![Figure 7: Number of detected fires per month for selected years.](fires_amazon_07.png)

Doing this makes it seem like forest fires are decreasing.

Lastly, lets do a cumulative sum and plot all the data:

![Figure 8: Cumulative number of detected fires by month, 1998-2019.](fires_amazon_08.png)

This all raises in interesting question: is the CBC being purposely deceitful? or are they just poor journalists?

You decide...