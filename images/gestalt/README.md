## NGINX-GESTALT
Gestalt est une web-ui destinée à gérer les hôtes virtuels d'un serveur NGINX.
## Introduction
Les capacitées de Gestalt sont :
  + Creation / suppression d'hôtes ;
  + Activation / Désactivation d'hôtes ;
  + Activation / Désactivation d'hôtes ;
  + Activation / Désactivation du TLS ;
  + (?) Test d'hôtes ?
  + (?) Test TLS ?
  + (?) Upstreams TCP/UDP

## Techologies utilisées    
1. NGINX
2. Python
  + uwsgi
  + flask / django
  + jinja
3. BASH
4. Docker

## Comportement visé :
1. Démarrage du container Docker vers /entrypoint.sh. Ce dernier prend :

  + HTTPS ;
  + GESTALT_HOSTNAME ;    

  comme variables d'environnement pour initialiser l'hôte python Gestalt.    
  _L'initalisation ne s'effectue qu'une fois._
2. Une fois initalisé, entrypoint.sh apppelle l'executable __gestalt__ qui à son tour doit démarrer l'application __en daemon__.
3. Nginx est ensuite démarré __en avant-plan__.

## Répertoires et fichiers :
1. __/etc/nginx__ : répertoire de configuration de NGINX par défaut.
2. __/etc/nginx/servers__ : Serveurs NGINX __actifs__.
3. __/etc/nginx/disabled__ : Serveurs NGINX __inactifs__.
4. __/tmp/nginx_backup__ : Configuration NGINX standard post installation,
copié automatiquement par _entrypoint.sh_ si /etc/nginx est vide (volume
  Docker).
5. __/etc/nginx/boilerplate__ : Configurations optimisées, __manipulables et
composables par Jinja__. (?) __Fork
[nginx-boilerplate](https://github.com/nginx-boilerplate/nginx-boilerplate)?__
6. __/usr/local/src__ : Code source Gestalt
7. __/entrypoint.sh__ : Entrée Docker
8. __/usr/local/bin/gestalt__ : Executable serveur gestalt
9. __/etc/nginx/.initalized__(?) : Mémoire d'initialisation Gestalt
10. __/run/gestalt/gestalt.sock__ : Socket de communication uswgi python <-> nginx
11. __/run/gestalt/gestalt.pid__ : PID du daemon Gestalt
