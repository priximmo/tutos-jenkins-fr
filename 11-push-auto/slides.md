%title: Jenkins
%author: xavki

-> Jenkins : Git push auto <-
========


<br>
* credentials à ajouter : login/mdp + ID


* exemple : si build = Ok => push d'un nouveau tag


* possiblité de pusher sur une autre branche


```
git config --global user.email "xav@moi.fr"
git config --global user.name "xavki"

javac Main.java
java Main
```

Rq : config git particulier


----------------------------------------------------------------


-> Action à la suite du build <-




* si succès



* TAG

```
Tag to push : VERSION-$BUILD_ID

Tag message : Jenkins Job

create new tag

update new tag


Target remote Name à définir et utiliser

```
