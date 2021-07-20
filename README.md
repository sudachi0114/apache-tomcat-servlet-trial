# apache-tomcat-servlet-trial

Java, maven を使って web app っぽいことがしたかった。

maven のお試し・練習でもある。

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

---

* ビルド (パッケージ生成)

JAR, WAR といったパッケージを生成するコマンドらしい。

package を実行すると validate, compile, test, package のフェーズで実行されるらしい。

```shell
sampleapp$ mvn package
```

* 実行

```shell
sampleapp$ java -cp target/sampleapp-1.0-SNAPSHOT.jar jp.sample.App
Hello World!
```

* こんなコマンドもあるらしい (以下は全て sampleapp 下で実行する)

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
$ docker-compose up -d

# image をビルドする
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

## deploy

* 一括実行

```shell
$ make deploy
```

---

* コンテナ立ち上げ

```shell
$ docker-compose up -d
```

* ビルド

```shell
sampleapp$ mvn clean package
```

* war のデプロイ

```shell
$ docker cp sampleapp/target/sampleapp-1.0-SNAPSHOT.war apache-tomcat-servlet-trial_tomcat_1:/usr/local/tomcat/webapps/app.war
```


## endpoint

http://localhost:8000/app/HelloServlet


## Links

### Maven 周り
* [Mavenとは何ぞや](https://qiita.com/ASHITSUBO/items/6c2aa8dd55043781c6b4)
  * エコシステム的なところの図がわかりやすかった
* [Java初心者のためのMaven入門](https://myenigma.hatenablog.com/entry/2019/11/10/084321)
* [Mavenの使い方](https://qiita.com/soushiy/items/6095401054959ce5d1a5)
* [よく使うMavenコマンド集](https://qiita.com/KevinFQ/items/e8363ad6123713815e68)
  * 基本的なコマンド
* [【超初心者向け】Maven超入門](https://qiita.com/tarosa0001/items/e5667cfa857529900216)
  * windows だけど、Eclipse とか `pom.xml` 周りの説明は詳しい..気がする..

### Docker, application 周り
* [Maven で war ファイルを作成する](https://a4dosanddos.hatenablog.com/entry/2015/03/05/002822)
  * war ファイル作成や `HelloServlet.java, WEB-INF/web.xml` などを作成する際に参照
* [DockerでApacheとTomcat環境構築。ついでにMaven&Java連携](https://qiita.com/shintaro123/items/a8a3d222d3dd46aba876)
  * 主に Docker 周りを参照
* [Dockerで別コンテナでApache+Tomcat連携する](https://confrage.jp/docker%E3%81%A7%E5%88%A5%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A%E3%81%A7apachetomcat%E9%80%A3%E6%90%BA%E3%81%99%E3%82%8B/)
  * tomcat のルーティングのアクセスがどこかを参照するときに参照