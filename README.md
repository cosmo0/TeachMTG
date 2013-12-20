# TeachMTG.com

## What is it ?

TeachMTG is a way to learn how to teach Magic: The Gathering to new players.

## How does it work ?

Go to [TeachMTG.com](http://teachmtg.com) and start learning!

## How can I contribute ?

Like any other GitHub project if you want to contribute to the code.  
If you only want to suggest modifications to decks, contact me at contact@teachmtg.com

Note that I'm using this project as an opportunity to learn more about Ruby and Rails. So it might not progress as planned.

## How do I install this project ?

### Requirements

* Ruby 1.9.3
* Rails 3.x
* PostgreSQL 9.2
* On Linux, you will need [lib]gtkmm, and libnotify

### Installation

    bundle install
    bundle exec rake db:setup
    foreman start

### Development

    bundle exec rake test:prepare
    bundle exec guard -pc

### DB configuration

To configure before the ´rake db:setup´ step :

`su` to enter the superuser mode.  
`psql` to enter the PostGre command-line interface.

    su
    psql -d template1
    \du

This last command lists the users. If "vagrant" is not in the list, create it :

    create role vagrant with login encrypted password 'vagrant' createdb;

Exit the PostGre command-line by typing `\q`.  
Then, test that the user can login and access the database (then exit again) :

    psql -U vagrant -d template1

If connecting with the vagrant user doesn't work, use "trust" as "method" in `/var/lib/pgsql/9.2/data/pg_hba.conf` for all active connections (at the end of the file) :

    local   all             all                                     trust
    host    all             all             127.0.0.1/32            trust
    host    all             all             ::1/128                 trust

Then restart the PGSQL service :

    sudo /etc/init.d/postgresql-9.2 restart

Finally, exit the SU mode with the `exit` command.
