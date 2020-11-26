%titles Jenkins
%author: xavki


# Jenkins : multibranches pipeline


<br>


* un projet avec un job mutlibranches

* scan les branches souhaitées ou non-souhaitées

* très pratique pour faire de la CI/CD

* améliore l'ogranisation de votre jenkins (plutôt que un job par branche)


-------------------------------------------------------------------------------


# Jenkins : multibranches pipeline



* Vérification : Jenkinsfile dans chanque branche

```
node {
sh 'echo $BRANCH_NAME'
}
```
