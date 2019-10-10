repository=kapacitor

.PHONY: deploy remove build push

deploy:
	mkdir -p /var/docker/${repository}/data
	mkdir -p /var/docker/${repository}/conf
	cp kapacitor.conf /var/docker/kapacitor/conf/kapacitor.conf
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
