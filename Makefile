ENV=dev
PROFILE=default

docker-build:
	docker build -t playground-common:tools .
bash:
	docker run --mount type=bind,source=$(CURDIR),target=/usr/src --mount type=bind,source=$(HOME)/.aws/,target=/root/.aws -it playground-common:tools bash
cfn-lint:
	docker run --mount type=bind,source=$(CURDIR),target=/usr/src playground-common:tools cfn-lint ./cloudformation/Networks.yml
deploy-net:
	docker run --mount type=bind,source=$(CURDIR),target=/usr/src --mount type=bind,source=$(HOME)/.aws/,target=/root/.aws playground-common:tools bash ./sh/deploy-net.sh $(ENV) $(PROFILE)
deploy-all:
	docker run --mount type=bind,source=$(CURDIR),target=/usr/src --mount type=bind,source=$(HOME)/.aws/,target=/root/.aws playground-common:tools bash ./sh/deploy-net.sh $(ENV) $(PROFILE)