SEI Internal Platform
======================

Badge Platform for CeSIUM's **Computer Engineering Week @ Minho University** event.

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

+ [Ruby on Rails](https://github.com/rails/rails)
+ Amazon Web Services S3

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

## Up and Runnning

### Configure AWS S3 Credentials

**The following steps are only needed for production.** First off you need to correctly configure your AWS S3 credentials in order for image uploading to work correctly. If you do not have a AWS account yet create a new one and create a bucket, for instructions check [Creating A Bucket](http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html).

Because this webapp is built on top of AWS S3 you need to create a `.env` file in the root folder with the needed credentials. Check [this](https://github.com/cesium/intra.seium.org/blob/master/.env.sample) example file for guidance, you only need to fill in the missing values.

In order to find out your `AWS_REGION` visit [AWS Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html).

### Running on localhost

Devise requires a secrete key specified in the environment in which you are working so, in order to be able to use the rails server and console you need to specify this secret key.

1. First you need to set the secret key needed by Devise. Start by running rake migrations. 

    `bundle exec rake db:migrate `.

    The command will fail (if the secret key is not already set) but a secret
    key will be printed to the terminal. Export the secret key to an environment 
    variable:

    `export SECRET_KEY_BASE=[secret_key]`.

2. Run all migrations 

    `bundle exec rake db:migrate`
    
    It should not fail this time around.

3. If needed, create a new Edition, using the rails console, run:

    `Edition.connection`

    followed by:

    `Edition.new({id: [id], name: [name], edition_number: [edition_number], 
    description: [description]}).save`

    Change the edition id, defined in the `set_global_info` method of the 
    application controller, to the id of the new edition.
    
4. Start the server `rails s`.

## Permissions

In order to enable most of the work to be done using the web app we are using [cancancan](https://github.com/CanCanCommunity/cancancan) to deal with authorization for different resources with different users.

### Adding and Removing Organizers

Organizers will appear in the `Organizer Of Fame` instead of the `Hall Of Fame` page.

- If you wish to give organizer status to an user run:

    `rake sei:add_organizer[username]`

- On the other hand, if you wish to revoke organizer status from an user run:

    `rake sei:remove_organizer[username]`

### Adding and Removing Badge Managers

Badge Managers are the only ones which can add and edit badges to the application.

Badge Managers can create new badges using the `new_edition_badge` path, and edit badges using the `edit_edition_badge` path.

- If you wish to change a user to a badge manager:

    `rake sei:add_badge_manager[username]`

- On the other hand, if you wish to revoke badge manager status from a user:

    `rake sei:remove_badge_manager[username]`
