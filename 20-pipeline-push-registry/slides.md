%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Docker Push to registry <-
========



<br>
```
node {
    checkout scm

    def imageName='registry.gitlab.com/xavki/presentations-jenkins'

    docker.withRegistry('https://registry.gitlab.com', 'credentials-id') {

    def customImage = docker.build("$imageName:${env.BUILD_ID}")

    customImage.push()
    }
}
```
