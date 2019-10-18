%titles Jenkins
%author: xavki


# Jenkins : librairies - les maps


<br>
* vidéo précédente : utiliser une librairie et configurer

```
helloWorld{}
```

<br>
* comment lui passer une variable ?

```
helloWorld{
name = "Xavki"
action = "Bonjour"
}
```

------------------------------------------------------------------------------


# La librairie : récupération des valeurs


<br>
* le call de la librairie récupère une map (tableau)


```
#!/usr/bin/env groovy

import groovy.json.*

def call(body) {
    def mapVars             = [:]
    body.resolveStrategy   = Closure.DELEGATE_FIRST
    body.delegate          = mapVars
    body()

		def name = maVars.name
		def action = maVars.action

	  println( action + " " + name + "!!")
}
```
