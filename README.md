TavernOfCho
=============

Install
---------

To install TavernOfCho, first clone this repository as following
```bash
git clone git@github.com:TavernOfCho/config.git TavernOfCho
# Navigate to the cloned project
cd TavernOfCho
# Launch the make init-full command to trigger the installation of the components.
make init-full
```

If you want to know all the option available with make, just run :

```bash
make help
```

or simply :

```bash
make
```

The last step is to configure properly the ``.env.local`` file from the API and then launch the command ``make composer-dump-dev``.

Deploying to Production 
-----------------------

The API is deployed to Heroku.

The Website is deployed to Firebase.

Mercure is deployed to a Dedicated Server as it seems incompatible with Heroku.

Each one has his own process referenced in the .travis.yml file. 
The process is fully automated and triggered on the master branch.


Accessing the project
---------------------

### In dev
* Client  : https://127.0.0.1:8050
* Admin   : https://127.0.0.1:8051
* API     : https://127.0.0.1:8052
* Website : https://127.0.0.1:8054
* Mercure : https://127.0.0.1:8053

### In prod
* API     : https://api.tavernofcho.com
* Website : https://tavernofcho.com
* Mercure : https://mercure.tavernofcho.com

ElasticSearch and the Database are provided by Heroku.

Project detail
------------------

The base of this project is an APIPlatform app.

It follows the original repository with an admin, a client, an API and Mercure.

* Client
    * This is the same interface as the default APIPlatform Client, but with some modifications like the services links.
* Admin 
    * This part is no longer really used but it was kept around in case of necessity as for some debug.
* API
    * This is a classic APIPlatform with ElasticSearch and Mercure integration.
* Website
    * The core of the application, with the API. This is the front page of the project consuming the API to provide all its content to our users.
    * This part uses React as core language with the Redux module.  
* Mercure
    * Mercure : _Server-sent live updates: protocol and reference implementation_.
    * More informations at https://mercure.rocks/
