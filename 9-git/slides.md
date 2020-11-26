%title: Jenkins
%author: xavki

-> Jenkins : Git et son trigger <-
========


<br>


* un dépôt :
https://github.com/priximmo/jenkins-helloworld

<br>


* build sans utilisation du plugin GIT

```
# clone
git clone https://github.com/priximmo/jenkins-helloworld

# déplacement
cd jenkins-helloworld

# compilation
javac Main.java

# lancement run
java Main
```

-------------------------------------------------------------


-> Avec Plugin GIT <-


<br>


* Gestion de Code Source : GIT


<br>


* git clone n'est plus nécessaire


* préciser bien la branche


* attention aux droits sur votre dépôt = credentials si nécessaire


<br>


* et directement placé dans le répertoire cloné


<br>


* build réduit :

```
javac Main.java

java Main
```


-------------------------------------------------------------



-> GIT - Trigger <-


<br>


* trigger : check à intervales réguliers 



* Ce qui déclenche le build : Scrutation de l'outil de gestion de version



* ajouter l'interval



