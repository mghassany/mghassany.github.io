---
layout: post
title: "Jekyll-scholar"
tags: [blog, LaTeX, Jekyll]
---

This post is from [Stefan Lankes](https://techblog.lankes.org/2015/04/06/From-Wordpress-to-Jekyll/). It helped me to show my publications on this website. Here it is:


I have migrated my blog from Wordpress to [Jekyll](http://jekyllrb.com/).
Jekyll is the better choice for my workflow and there exist quite a few nice open source themes.
For instance, [jekyllthemes.org](http://jekyllthemes.org) provides a collection of great themes. 
I like the themes from [Michael Rose](https://mademistakes.com/work/) and use his theme [Minimal Mistakes](https://mademistakes.com/work/minimal-mistakes-jekyll-theme/) as a base for this blog.
 
For the migration, I used the guideline from [PullReview](http://blog.8thcolor.com/en/2014/05/migrate-from-wordpress/).
However, my publication list presented a real challenge.
Nearly all my papers are written in LaTeX.
Consequently, I maintain my publications with a [BibTeX](http://en.wikipedia.org/wiki/BibTeX) file and I want to automatically generate my publication list from this file.
[Jekyll-Scholar](https://github.com/inukshuk/jekyll-scholar) was able to close this gap.

I already mentioned that I use [Minimal Mistakes](https://mademistakes.com/work/minimal-mistakes-jekyll-theme/) as a base for this blog.
In its gem configuration file (`Gemfile`) I attached  the following for *Jekyll-Scholar*:

{% highlight bash %}
gem 'jekyll-scholar'
{% endhighlight %}

If you use [Bundler](http://bundler.io), you are now able to update your system to the latest versions of Jekyll-Scholar.
To enable it, I created the file `ext.rb` in the plugin directory (`_plugins`) with the following statement:

{% highlight ruby %}
require 'jekyll/scholar'
{% endhighlight %}

In the configuration file (`_config.yml`) of my web site, I attached the following Jekyll-Scholar settings:

{% highlight yaml %}
scholar:
  style: assets/bibliography/ieee-with-url.csl
  locale: en

  sort_by: year
  order: descending
  bibliography_list_tag: ul

  source: _bibliography
  repository: pdf
  bibliography: references
  bibliography_template: bibliography

  replace_strings: true

  details_dir:    bibliography
  details_layout: bibtex.html
  details_link:   Details

  query: "@*"
{% endhighlight %}

In this settings, the value of `source` describes the location and the value of `references` the name of my BibTeX file.
According to my settings, I put my BibTeX file with the name *references.bib* in the directory *_bibliography*.
As citation style I used a modified version of *ieee-with-url* from the [official repository for distribution of validated CSL citation styles](https://github.com/citation-style-language/styles-distribution), which I copied to the directory `assets/bibliography/`.
I removed the citation number from this style, which is nonrelevant for my web site.
The differences to the original are minimal and are shown as follows *diff*:

{% highlight diff %}
diff --git a/assets/bibliography/ieee-with-url.csl b/assets/bibliography/ieee-with-url.csl
index 08dbeb1..da17fb0 100755
--- a/assets/bibliography/ieee-with-url.csl
+++ b/assets/bibliography/ieee-with-url.csl
@@ -28,7 +28,7 @@
     <category citation-format="numeric"/>
     <category field="engineering"/>
     <category field="generic-base"/>
-    <updated>2014-09-03T18:33:58+00:00</updated>
+    <updated>2012-10-18T22:38:43+00:00</updated>
     <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
   </info>
   <locale xml:lang="en">
@@ -220,7 +220,9 @@
   <bibliography entry-spacing="0" second-field-align="flush">
     <layout>
       <!-- Citation Number -->
+<!--
       <text variable="citation-number" prefix="[" suffix="]"/>
+-->
       <!-- Author(s) -->
       <text macro="author" suffix=", "/>
       <!-- Rest of Citation -->
{% endhighlight %}

Furthermore, with the file `bibtex.html` I defined the layout of my publication list in the directory `_layout`.
The current version of `bibtex.html` is shown below:

{% highlight html %}
---Natascha McElhone
---
{{ "{{reference" }}}}

<div id="{{ "{{key" }}}}-materials">
  <ul class="nav nav-pills">
    {{ "{% if entry.abstract " }}%}
    <li><a data-toggle="collapse" href="#{{ "{{key" }}}}-abstract">Abstract</a></li>
    {{ "{% endif " }}%}

    <li><a data-toggle="collapse" href="javascript:toggleDiv('{{ "{{key" }}}}-bibtex')">BibTeX</a></li>
    <div id="{{ "{{key" }}}}-bibtex" style="display:none;">
    <pre class="collapse">{{ "{{entry.bibtex" }}}}</pre>
    </div>

    {{ "{% if link " }}%}
    <li><a href="{{ "{{link" }}}}">Download</a></li>
    {{ "{% endif " }}%}
    {{ "{% if entry.doi " }}%}
    <li>DOI: <a href="http://dx.doi.org/{{ "{{entry.doi" }}}}">{{ "{{entry.doi" }}}}</a></li>
    {{ "{% endif " }}%}
  </ul>

  {{ "{% if entry.abstract " }}%}
  <p id="{{ "{{key" }}}}-abstract" class="collapse">{{ "{{entry.abstract" }}}}</p>
  {{ "{% endif " }}%}

</div>
{% endhighlight %}

The final step was to write a markdown file with the description of the web site, which contains the publication list.
In my case, I sorted the list by the year of publication.
Consequently, I had to query the bibliography for every year.
The first half of the file looks as follows:

{% highlight html %}
---
layout: page
title: "Publications"
date: 2013-04-08
excerpt:
share: false
---

### 2013

{{ "{% bibliography --query @*[year=2013] " }}%}

### 2012

{{ "{% bibliography --query @*[year=2012] " }}%}
{% endhighlight %}

The rest of the file is an iteration over the years.
The final result is a publication list as follows:

### 2013

{% bibliography --query @*[year=2013] %}

### 2012

{% bibliography --query @*[year=2012] %}

In principle, this is an extremly simple approach to generating a publication list.
Unfortunately, Jekyll-Scholar [isn't supported](https://pages.github.com/versions/) by [GitHub pages](https://pages.github.com).
I hope that this will change in the future...
