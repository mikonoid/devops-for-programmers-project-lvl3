setup:
	make -C ansible setup
	make -C terraform setup

deploy:
	make -C ansible deploy

build-infrastructure:
	make -C terraform apply

destroy:
	make -C terraform destroy