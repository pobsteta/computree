# computree

Lancer les commandes suivantes :

```
docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix pobsteta/computree
```

Le container est lancé, se rendre dans le répertoire d'installation de computree :

```
cd /usr/share/computree_release
```

Vérifiez la version installée :

```
./computreebatch.sh -v
```
