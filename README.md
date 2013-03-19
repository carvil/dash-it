# Dash-It

[![Build Status](https://secure.travis-ci.org/carvil/dash-it.png)](http://travis-ci.org/carvil/dash-it)
[![Code Climate](https://codeclimate.com/github/carvil/dash-it.png)](https://codeclimate.com/github/carvil/dash-it)

Create todo lists for your projects

## Motivation

Here is why I decided to build this app: [Replacing rails views with ember.js ](http://carvil.github.com/Programming/2012/03/18/replacing-rails-views-with-ember-js/)

## Try it online

You can try it online [here](http://dash-it-app.herokuapp.com).

## Run it locally

If you prefer to run it locally, follow these steps.

    git clone git@github.com:carvil/dash-it.git
    cd dash-it
    bundle install

If you don't want to use postgres in development mode, change the gemfile to use sqlite3 instead (and change the database.yml file).
Then, create the database and run the migrations:

    bundle exec rake db:create
    bundle exec rake db:migrate

To get started right away with a test user (complete with an example project and some todos), run:

    bundle exec rake db:seed

This will create a user in your development database with email 'ada@example.com' and the password 'lovelace'. When you run the app in development, you will be able to use this user to play around. Don't run this in production.

And finally, you can then either run:

    bundle exec rails s

or

    foreman start

Please note that if you want to try the login via github and facebook locally, you will need to create the apps there and create a .env file in the root of the project that contains the app ids and keys. An example would be:

    GITHUB_APP_ID=your_github_app_id
    GITHUB_APP_SECRET=your_github_app_secret
    RACK_ENV=development
    FACEBOOK_APP_ID=your_facebook_app_id
    FACEBOOK_APP_SECRET=your_facebook_app_secret

## Copyright

Copyright (c) 2012 Carlos Vilhena. See [LICENSE](https://github.com/carvil/dash-it/blob/master/LICENSE) for details.

