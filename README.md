Wordpress on LAMP stack
==========

This repo use Puppet and combine Apache, PHP and MySQL  to provide a wokring out of box a high performance web server.

Overview
========

Configure every aspect throught config file.

Steps
=====

* `Apache` - Install and configure
* `PHP` - Install and configure 
* `MySQL server` - Install MySQL as a database
* `Worpress Cms` - Installation in custom hostname

How to run
==========
add to your site.pp   `include cms`

Tested on Ubuntu 16.04
======================

This recive tested on ubuntu 16.04.


Configuration
=============

You can edit configuration options throught attributes.
