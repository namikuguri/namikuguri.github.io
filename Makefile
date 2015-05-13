sass:
	sass --watch --sourcemap=none src/static/stylesheets/app.scss:static/stylesheets/app.css
prefix:
	autoprefixer -b 'last 2 versions' static/stylesheets/app.css
