%title: Jenkins
%author: xavki

-> Jenkins <-
========


<br>
* ordonnanceur / Scheduleur

- run de jobs

- pipeline d'intégration continue : build / run / test

- java / open source

- utilisé en devops (comme gitlab ci)

- 1000 plugins

- GUI : port 8080

- CLI possible

<br>
* site

```
https://jenkins.io/
```

----------------------------------------------------------------------------------------

-> Installation jenkins <-



<br>
* installation par paquet


```
https://pkg.jenkins.io/debian-stable/

```

ou


```
wget -q -O -http://pkg.jenckins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

sudo apt-get install jenkins
```


Attention à la clef : 

```
/var/jenkins_home/secrets/initialAdminPassword
```

----------------------------------------------------------------------------


Key:
eda4060eb8404c3d985800c96c7841e8

