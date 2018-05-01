heroku-web-build:
	docker build -t registry.heroku.com/<name>/web -f ./Dockerfile .
heroku-web-push:
	docker push registry.heroku.com/<name>/web
heroku-web-up:
	docker run --rm -p 7777:7777 -e PORT=7777 registry.heroku.com/<name>/web