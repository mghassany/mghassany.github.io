---
title: Publications
layout: page
css: "/css/academicons.css"
---

<!-- My [Google Scholar](https://scholar.google.com/citations?user=rqfVsosAAAAJ) page.
 -->
<div style="text-align: right">
<h4 id="academic">My academic profiles</h4> <a target="_blank" href="https://scholar.google.com/citations?user=rqfVsosAAAAJ"><span class="ai ai-google-scholar ai-lg" style="color:#00B4A1" aria-hidden="true"></span></a> <a target="_blank" href="https://www.researchgate.net/profile/Mohamad_Ghassany"><span class="ai ai-researchgate ai-lg" style="color:#00B4A1" aria-hidden="true"></span></a> <a target="_blank" href="http://dblp.uni-trier.de/pers/hd/g/Ghassany:Mohamad"><span class="ai ai-dblp ai-lg" style="color:#00B4A1" aria-hidden="true"></span></a>
</div>

## Journal articles

{% bibliography --query @article[status!=editorial && status!=other] %}

## Conference articles

{% bibliography --query @conference[status!=editorial && status!=other] %}

## PhD

{% bibliography --query @phdthesis %}

## Master

{% bibliography --query @masterthesis %}