.PHONY: build

build:
	sam build

deploy:
	sam deploy

delete:
	sam delete


watch-api:
	echo "Watching API..."; \
	nodemon --watch hello-world/ --ext go --delay 500ms --exec "./watch.sh api"

watch-build:
	echo "Watching Build..."; \
	nodemon --watch hello-world/ --ext go --delay 500ms --exec "./watch.sh build"