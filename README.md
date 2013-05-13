# MS13
![MS13](http://d1ig05b2kzagsz.cloudfront.net/wp-content/uploads/2012/09/ms13_human_trafficking.jpg)

Skeleton framework for ActiveMQ workers.

## Basics

Needed a skeleton framework similar to [sinatra-housewarming](https://github.com/gen0cide-/sinatra-housewarming) for ActiveMQ processors.

Very basic as of now, other directories exist for expansion over time. I've included, but not used the [settingslogic](https://github.com/binarylogic/settingslogic) gem as well.

A few notes:

* This is serious edge code. It might not work. Ruby 2.0.0 has had some errors as well with signal handling, but it works. Will test on 1.9.3 and update.

## Setup
To begin,

```
$ bundle install --path vendor/bundle --binstubs
```

Files you need to configure and look at:

* `config/loops.yml`
* `loops/gang_worker_loop.rb`
* `poc/producer.rb`

I'm guessing you have ActiveMQ configured and those three files are in line. Now you should open up three terminals and type the following:

```
1$ bin/loops -c config/loops.yml -l loops/ -p tmp/loops.pid -r . -f none -d start
```

```
2$ tail -f log/*.log
```

You should see the workers you spawned in `1` now logging started in `$2`.

Now to test activeMQ!!! Again, I'm sure you have configured `poc/producer.rb` properly.

```
3$ while true; do ruby poc/producer.rb "hello world"; sleep 0.5; done
```

You should see the consumers in the log.






