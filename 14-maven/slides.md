%title: Jenkins
%author: xavki

-> Jenkins : Maven <-
========

Dépôt : https://github.com/priximmo/mvn-helloworld

<br>

* install jenkins hors docker

```
https://jenkins.io/doc/book/installing/
```


<br>
* install java :

```
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
sudo apt-get install oracle-java11-installer
sudo vim /etc/environment 

JAVA_HOME="/usr/lib/jvm/java-11-oracle/"
```

* install maven :

```
sudo apt-get install maven
```

----------------------------------------------------------------------


-> Maven dans jenkins <-




<br>
* configuration global des outils


<br>

* configuration maven

<br>

* maven : MAVEN_HOME à définir



------------------------------------------------------------------------


-> Pour un build <-




<br>
* ajout d'un dépôt git avec un projet maven : pom.xml


* build : définir les actions


* post step : 

```
java -jar target/helloworld-app-1.0-SNAPSHOT.jar
```
