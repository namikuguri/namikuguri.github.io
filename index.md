---
title: なみく
---

<section class="container">
  <h2>反映されたんか？日付？</h2>
  <ol class="showcase">
    {% for post in site.posts %}
      <li>
        <a class="card" href="{{ post.url}}">
          <h2 class="card__title">{{ post.title }}</h2>
        </a>
      </li>
    {% endfor %}
  </ol>
  <ol class="showcase">
    <li>
      <a class="card" href="/article/2021-02-28">
        <h2 class="card__title">作品集からブログに</h2>
        <time class="card__date" datetime="2021-02-28">2021年2月28日</time>
      </a>
    </li>
    <li>
      <a class="card" href="/article/2017-09-amagasa-hatenablog-theme">
        <h2 class="card__title">Amagasa Hatenablog Theme</h2>
        <time class="card__date" datetime="2017-09-01">2017年9月</time>
      </a>
    </li>
    <li>
      <a class="card" href="/article/2016-10-corocoro-dice">
        <h2 class="card__title">corocoro dice</h2>
        <time class="card__date" datetime="2016-10-01">2016年10月</time>
      </a>
    </li>
    <li>
      <a class="card" href="/article/2016-03-bilibili-calendar">
        <h2 class="card__title">bilibili calendar</h2>
        <time class="card__date" datetime="2016-03-01">2016年3月</time>
      </a>
    </li>
    <li>
      <a class="card" href="/article/2015-05-thleap-net-v2">
        <h2 class="card__title">thleap.net v2</h2>
        <time class="card__date" datetime="2015-05-01">2015年5月</time>
      </a>
    </li>
    <li>
      <a class="card" href="/article/about">
        <h2 class="card__title">about</h2>
      </a>
    </li>
  </ol>
</section>
