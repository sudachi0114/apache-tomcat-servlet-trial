# apache-tomcat-servlet-trial

Java, maven を使って web app っぽいことがしたかった。

Servlet とその実行環境である tomcat 環境を docker で用意して、立ち上げ、
ブラウザからアクセスして、レスポンスができるまでやってみる。

## Maven コマンド

```shell
$ mvn --version
Apache Maven 3.8.1 (05c21c65bdfed0f71a2f2ada8b84da59348c4c5d)
Maven home: /usr/local/Cellar/maven/3.8.1/libexec
Java version: 1.8.0_292, vendor: AdoptOpenJDK, runtime: /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/jre
Default locale: ja_JP, platform encoding: UTF-8
OS name: "mac os x", version: "10.15.7", arch: "x86_64", family: "mac"
```

( `$ cd sampleapp` する )

* ビルド (パッケージ生成)

JAR, WAR といったパッケージを生成するコマンドらしい。

package を実行すると validate, compile, test, package のフェーズで実行されるらしい。

```shell
$ mvn package
```

* 実行

```shell
$ java -cp target/sampleapp-1.0-SNAPSHOT.jar jp.sample.App
Hello World!
```

* こんなコマンドもあるらしい

```shell
# コンパイルは実行せずに、プロジェクトの検証をする
$ mvn validate

# コンパイルする
$ mvn compile

# JUnit テスト?の実行
$ mvn test

# jar をインストールする?
$ mvn install

# デプロイ
mvn deploy

# target ディレクトリを削除する
$ mvn clean
```

## container

* compose-up

```shell
$ docker-compose up -d --build
```

* process

```shell
$ docker-compose ps
```

* tail logs

```shell
$ docker-compose logs -f
$ docker-compose logs -f tomcat
$ docker-compose logs -f tomcat

# こういうデバッグ の方法もあるらしい
$ docker exec -it httpd-container tail -f /etc/httpd/logs/access_log
$ docker exec -it tomcat-container tail -f /usr/local/tomcat/logs/localhost_access_log.`date +%Y-%m-%d`.log
```


## Links

* [よく使うMavenコマンド集](https://qiita.com/KevinFQ/items/e8363ad6123713815e68)