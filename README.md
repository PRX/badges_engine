BadgesEngine
============


Description
-----------
This project is a mountable Rails 3.1 engine gem.  The purpose is to make a Rails app that installs and mounts this an issuer of badges following the design of the Mozilla Open Badges Infrastructure: [http://openbadges.org/)](http://openbadges.org/).

Maybe it will be useful to folks interested in the ['Badges for Lifelong Learning'](http://www.dmlcompetition.net/)


Install
-------
Start by adding the gem to your Gemfile, then do the usual routine, and install the bundle:

    gem 'badges_engine'

Next there are migrations to copy over:

    rake badges_engine:install:migrations

That will copy the migrations over to support saving the badges and assertions.

Next you can run the install rails generator.
This will mount the engine in your routes.rb, and add 'config/initializers/badges_engine.rb'

    rails generate badges_engine:install

Next you should edit 'config/initializers/badges_engine.rb'.

This sets up the initial values you need for the issuer, and specifies the User class for mixins.


Author(s)
-----------
Andrew Kuklewicz - https://github.com/kookster

License
-------
This project uses MIT-LICENSE.