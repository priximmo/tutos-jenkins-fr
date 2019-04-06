%title: Jenkins
%author: xavki

-> Jenkins Pipeline : Docker <-
========



<br>
* pourquoi ?

 
* runner des conteneurs

 
* construire des images pour livrer et déployer en production

 
* intégrer des tests sur conteneurs



-----------------------------------------------------

->  Run d'un nginx <-



```
node {
    docker.image('nginx:latest').withRun('-p 80:80') { c ->
        sh 'docker ps'
    }
}
```
