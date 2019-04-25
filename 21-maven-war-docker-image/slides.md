%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Build Image from Maven War <-
========

* webapp : hello world

* 1- package maven

* 2- create image

* 3- run image

* 4- push image to registry



----------------------------------------------------------------------------------------------------

-> Pipeline : Jenkinsfile <-

<br>
```
def pipelineContext = [:]
node {
   def registryProjet='registry.gitlab.com/xavki/presentations-jenkins/wartest'
   def IMAGE="${registryProjet}:version-${env.BUILD_ID}"
    stage('Clone') {
          git 'https://github.com/priximmo/war-build-docker.git'
    }
    stage('Maven package'){
            sh 'mvn package'
    }
    def img = stage('Build') {
          docker.build("$IMAGE",  '.')
    }
    stage('Run') {
            img.withRun("--name run-$BUILD_ID -p 8081:8080") { c ->
            sh 'docker ps'
            sh 'netstat -ntaup'
            sh 'sleep 30s'
            sh 'curl 127.0.0.1:8081'
            sh 'docker ps'
          }
    }
    stage('Push') {
          docker.withRegistry('https://registry.gitlab.com', 'reg1') {
              img.push 'latest'
              img.push()
          }
    }
}
```
