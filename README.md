automake
========

Automatically make less and jade files (even more) on linux systems when files update.

Usage
=====

Install [inotyfy-tools](https://github.com/rvoicilas/inotify-tools/wiki/) and

    ./automake.sh [path]

How it works
============

This script uses inotifywait to `identify` file changes in a specified folder, and
then determine if the file need to be updated.


Known Issue
===========

This script is not designed to resolve dependencies, so if you need the files to
be updated based on their dependencies write a makefile instead.

