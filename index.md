<ol class="showcase">
  {% for post in site.posts %}
    <li>
      <a class="card" href="{{ post.url }}">
        <h2 class="card__title">{{ post.title }}</h2>
        <time class="card__date" datetime="{{ post.date }}">{{ post.date }}</time>
      </a>
    </li>
  {% endfor %}
</ol>
