<h1 align="center"> push_swap </h1>

---

<h2 id="description_id"> Description of the project: </h2>

The goal of this project is to write docker images from scratch and link them to build a fully functional WordPress website.

<h2 id="usage_id"> Usage: </h2>

You will need to set new volume path in docker-compose.yaml for wordpress and the database. You can set the same path in the makefile for the rule fclean.

You will also need a .env (in the same location as docker-compose.yaml) file with the variable:

```
WEBSITE_NAME=

#MYSQL
DATABASE_NAME=
MYSQL_ROOT_PASSWORD=
MYSQL_USER=
MYSQL_PASSWORD=

#Wordpress Admin
ADMIN_NAME=
ADMIN_PASSWORD=
ADMIN_EMAIL=

#Wordpress User
USER_NAME=
USER_PASSWORD=
USER_EMAIL=
```

After you can build the container by typing (int the *makefile* location)
```shell
sudo make
```
