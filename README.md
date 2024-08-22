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

    $ docker-compose run --rm web bundle exec rspec

NOTE: If you receive error `Failed to open TCP connection to elasticsearch:9200 (Connection refused - connect(2) for "elasticsearch" port 9200)`, try again after few seconds. This is because the test is dependent on Elasticsearch being up and running and sometimes it might take a little bit longer than the web container to start.
