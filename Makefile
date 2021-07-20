.PHONY: build
build:
	cd sampleapp && mvn clean package

.PHONY: compose/up
compose/up:
	docker-compose up -d --build

.PHONY: upload
upload: build
	docker cp sampleapp/target/sampleapp-1.0-SNAPSHOT.war apache-tomcat-servlet-trial_tomcat_1:/usr/local/tomcat/webapps/app.war

.PHONY: deploy
deploy: compose/up upload

.PHONY: compose/down
compose/down:
	docker-compose down

.PHONY: clean
clean: compose/down
	cd sampleapp && mvn clean