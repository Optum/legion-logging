Legion::Logging
=====

Legion::Logging is a ruby logging class that is used by the LegionIO framework. It gives all other gems and extensions a
single logging library to use for consistency. 

Supported Ruby versions and implementations
------------------------------------------------

Legion::Json should work identically on:

* JRuby 9.2+
* Ruby 2.4+


Installation and Usage
------------------------

You can verify your installation using this piece of code:

```bash
gem install legion-logging
```

```ruby
require 'legion-logging'

Legion::Logging.setup(log_file: './legion.log', level: 'debug')
Legion::Logging.setup(level: 'info0') # defaults to stdout when no log_file specified

Legion::Logging.warn('warning a user')
Legion::Logging.info('hello')


```

Authors
----------

* [Matthew Iverson](https://github.com/Esity) - current maintainer
