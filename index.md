<ol class="showcase">
  {% for post in site.posts %}
    <li>
      <a class="card" href="{{ post.url }}">
        <h2 class="card__title">{{ post.title }}</h2>
        <time class="card__date" datetime="{{ post.date }}">{{ post.date | date: "%Y年%-m月%-d日" }}</time>
      {% if {{ post.date | date: "%Y年" }} == {{ site.time | date: "%Y年" }} %}
        <time class="card__date" datetime="{{ post.date }}">{{ post.date | date: "%-m月%-d日" }}</time>
      {% else %}
        <time class="card__date" datetime="{{ post.date }}">{{ post.date | date: "%Y年%-m月%-d日" }}</time>
      {% endif %}
      </a>
    </li>
  {% endfor %}
</ol>
