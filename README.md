# Recipes Hub

A simple app to search recipes based on the ingredients you have.

## Setup

NOTE: You would need Docker installed on your machine.

    $ docker-compose build
    $ docker-compose run --rm web bundle exec rake db:prepare

Next is to import the recipes into the database.
Save your recipe JSON file into `data` directory and run this command: (replace `recipes_en.json` with you own filename)

    $ ddocker-compose run --rm web bundle exec rake 'import_recipes:run[recipes_en.json]'

After import completed, start the app by this command:

    $ docker-compose up

You can access the app at http://localhost:3000 once the servers are up.

## Run tests

    $ docker-compose run --rm web bundle exec rake db:test:prepare
    $ docker-compose run --rm web bundle exec rspec
