<ol class="showcase">
  {% for post in site.posts %}
    <li>
      <a class="card" href="{{ post.url }}">
        <h2 class="card__title">{{ post.title }}</h2>
          <time class="card__date" datetime="{{ post.date }}">{{ post.date | date: "%Y" }}年{{ post.date | date: "%-m" }}月{{ post.date | date: "%-d" }}日</time>
        {% endif %}
      </a>
    </li>
  {% endfor %}
</ol>
