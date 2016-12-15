---
layout: page
---

All the writing I have done about my (Seeing Eye)[http://seeingeye.org] dogs is listed below.


<ul>
  {% for page in site.[include.dogwriting] %}
    <li><a href="{{ site.url }}{{ page.url }}">{{ page.title }}</a></li>
    {% endunless %}
  {% endfor %}
  <li>&nbsp;</li>
</ul>
{% include footer.html %}