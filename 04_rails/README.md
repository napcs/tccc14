Rails 3.2 application
-----------------

To run this, you can use this as long as you've used RVM

```
$ rails server
```

or you can use

```
jruby -S rails server
```


or build with Warbler to run without Ruby at all!

```
$ cd projects
$ rake assets:precompile
$ warbler compiled gemjar  executable war
```

to create a standalone war file

Then run that with

```
$ java -Ddb=/path/to/sqlite3Database.sqlite -jar projects.war
```
