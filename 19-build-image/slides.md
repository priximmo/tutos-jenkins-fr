%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Docker Build<-
========



<br>
```
node{
  def app

    stage('Clone') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("xavki/nginx")
    }

    stage('Test image') {
        docker.image('xavki/nginx').withRun('-p 80:80') { c ->
        sh 'docker ps'
        sh 'curl localhost'
	     }
    }
}

```
