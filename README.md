SEI15 Backend Platform
======================

Backend User Platform for 2015 CeSIUM's **Computer Engineering Week @ Minho University** event

Main Features
-------------

+ Participant Account Registration
+ Activities Listing
+ Participant Registration in Activities
+ Badges Listing
+ Badge Acquirement Registration
+ Platform Administration

Technology Used
---------------

+ Ruby on Rails

Model
-----

### Entities

+ User
+ Activity
+ Speaker
+ Company
+ Badge
+ BadgeAcquisition
+ Edition

### Relationships Between Entities

+ User and Activity (*N:N*)
+ Activity and Speaker (*N:N*)
+ Speaker and Company (*N:1*)
+ User and Badge (*N:N*) (through BadgeAcquisition)
+ User and Edition (*N:N*)
+ Activity and Edition (*N:1*)
+ Company and Edition (*N:N*)
+ Speaker and Edition (*N:N*)
+ Badge and Edition (*N:1*)

Up and Runnning
---------------

1. First you need to set the secret key needed by Devise. Run `bundle exec rake db:migrate `.
The command will fail but a secret key will be printed to the terminal.
Export the secret key to an environment variable `export SECRET_KEY_BASE=[secret_key]`.
Do not forget to remove the trailing `'`
2. Run all migrations `bundle exec rake db:migrate`.
3. If needed, create a new Edition, using the rails console, run:
`Edition.connection`
followed by:
`Edition.new({id: [id], name: [name], edition_number: [edition_number], description: [description]}).save`
Change the edition id, defined in the `set_global_info` method of the application controller, to the id of the new edition.
4. Start the server `rails s`.

Adding and Removing Organizers
------------------------------

There are rake tasks which allow you to give organizer status to a user. In case you which to see all the tasks available run `rake -T`.

If you wish to give organizer status to an user run:

`rake sei:add_organizer[username]`

On the other hand, if you wish to revoke organizer status from an user run:

`rake sei:remove_organizer[username]`
