# apache-tomcat-servlet-trial

Java, maven を使って web app っぽいことがしたかった。

Servlet とその実行環境である tomcat 環境を docker で用意して、立ち上げ、
ブラウザからアクセスして、レスポンスができるまでやってみる。

## Maven コマンド

( `$ cd sampleapp` する )

* ビルド

```shell
$ mvn package
```

* 実行

```shell
$ java -cp target/sampleapp-1.0-SNAPSHOT.jar jp.sample.App
Hello World!
```
