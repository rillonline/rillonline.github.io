---
layout: page
title: A List of Pages
permalink: /page-list/
---
You can access all my writing via the links below.

 <ul>
  {% for page in site.pages %}
    <li>
      <a href="{{ page.url }}">{{ page.title }}</a>
    </li>
  {% endfor %}
</ul>
{% include footer.html %}