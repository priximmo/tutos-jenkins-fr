%title: Jenkins
%author: xavki

-> Jenkins Pipeline : les boucles <-
========


-> Docker <-


```
node {
      for (i=0; i<2; i++) { 
           stage "Stage #"+i
           print 'Hello, world !'
           if (i==0)
           {
               git "https://github.com/Zulaikha12/gitnew.git"
               echo 'Running on Stage #0'
           }
           else {
               build 'Declarative pipeline'
               echo 'Running on Stage #1'
           }
      }
}
```
