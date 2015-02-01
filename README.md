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
+ Badge (by Merit gem)
+ BadgeCode (Store unique codes for badges)
+ Edition

### Relationships Between Entities

+ User and Activity (*N:N*)
+ Activity and Speaker (*N:N*)
+ Speaker and Company (*N:1*)
+ User and Badge (*N:N*)
+ User and Edition (*N:N*)
+ Activity and Edition (*N:1*)
+ Company and Edition (*N:N*)
+ Speaker and Edition (*N:N*)
+ User and BadgeCode (*1:N*)
+ Badge and BadgeCode (*1:N*)
