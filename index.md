<ol class="showcase">
  {% for post in site.posts %}
    <li>
      <a class="card" href="{{ post.url }}">
        <h2 class="card__title">{{ post.title }}</h2>
        <time class="card__date" datetime="{{ post.date }}">{{ post.date | date: "%Y年%-m月%-d日" }}</time>
      </a>
    </li>
  {% endfor %}
</ol>
