---
layout: default
title: My Yoga Journal
permalink: /yogajournal/
---

## Yoga Journal

This is my Yoga Journal.
<ul>
    {% assign sorted = (site.yogajournal | sort: 'date') %}
    {% for item in sorted %}
<li><a href="{{ item.url }}">{{ item.title }}</a> {{ item.topic }}</li>
    {% endfor %}
</ul>
{% include footer.html %}
