%titles Jenkins
%author: xavki


# Jenkins : Utilisation de librairies - HelloWorld


<br>
* pour quoi faire ?
		- factoriser
		- mutualiser
		- rendre plus lisible son jenkinsfile
		- autres vidéos passage de variables


<br>
* Comment ?
		- création d'un dépôt git :
				- ajout dir src/ressources/vars
		

* création d'un fichier .groovy dans vars avec à minima :

```
#!/usr/bin/env groovy
import groovy.json.*
def call(body) {
	println("Hello World !!!")
}
```

* ajouter la lib dans la conf générale de jenkins

éventuellement modifier la branche par défaut de la lib

```
@Library('lib@master')_
```
