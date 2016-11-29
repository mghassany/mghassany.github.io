---
title: Publications
layout: page
---

My [Google Scholar](https://scholar.google.com/citations?user=rqfVsosAAAAJ) page.

## Journal articles

{% bibliography --query @article[status!=editorial && status!=other] %}

## Conference articles

{% bibliography --query @conference[status!=editorial && status!=other] %}

## PhD

{% bibliography --query @phdthesis %}

## Master

{% bibliography --query @masterthesis %}