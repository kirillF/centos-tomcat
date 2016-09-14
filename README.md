Docker container: CentOS 7 + Java 8 + Tomcat 8

## Build the image

```sh
git clone https://github.com/kirillF/centos-tomcat.git
cd centos-tomcat
docker build -t kirillf/centos-tomcat .
```

## How to use
Put your war under the `/opt/tomcat/webapps` directory.

```sh
docker run -v /opt/tomcat/webapps:/opt/tomcat/webapps -i -t --name centos-tomcat kirillf/centos-tomcat
```

## Versions

|Software|Version|Note|
|:-----------|:------------|:------------|
|CentOS|7||
|Java|8u101||
|Apache Tomcat|8.5.4||
