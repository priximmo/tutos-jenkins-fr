%title: Jenkins
%author: xavki

-> Jenkins Pipeline : liste déroulante dynamique <-
========


-> Avoir une liste alimentée par url <-

<br>
Exemple : liste des images docker d'un repo gitlab

```
curl -s "https://gitlab.com/api/v4/projects/9724367/registry/repositories/"
```

Puis récupérer l'id de l'image (ne devrait pas changer) => sinon saisie manuelle

```
curl -s "https://gitlab.com/api/v4/projects/9724367/registry/repositories/540409/tags"
```


------------------------------------------------------------------------------


-> Extensible Choice <-



<br>
* ajout d'un plugin : extensible choice

<br>
* utilisation d'un script groovy

```
import groovy.json.JsonSlurper;
def jsonSlurper = new JsonSlurper()
def myjson = ("curl -s 'https://gitlab.com/api/v4/projects/9724367/registry/repositories/540409/tags'").execute()
def nfile = "curl https://gitlab.com/api/v4/projects/9724367/registry/repositories/540409/tags".execute().text
result = jsonSlurper.parseText(nfile);

return result.name
```

Attention: pb de sécurité (voir administration jenkins)
