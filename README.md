# CSS Lint Filter #

A filter to lint CSS files using 
[CSSLint](http://csslint.net/)
(via [execcsslint](https://github.com/dgholz/execcsslint)) in
[Nanoc](http://nanoc.ws).

## Installation ##

Drop the file `csslint.rb` into the `lib/filters` folder of
your Nanoc project.

Make sure you have
[execcsslint](https://github.com/dgholz/execcsslint)
in your `Gemfile`:

    gem 'execcsslint'

If necessary, re-run `bundle install`.

## Usage ##

Use the filter in `compile` rules as necessary. Examples:

    compile '/css/*' do
            # Apply other filters.
            # filter ...

            # Apply csslint filter.
            filter :csshint
        end
    end

If CSSLint has nothing to report, the filter produces no output.
If there are any messages from CSSLint, they are output to `STDOUT`.

### Options ###

    :strict => true

Forces Nanoc to raise an exception on a CSSLint **error**.

## Notes and Issues ##

The filter uses [execcsslint](https://github.com/dgholz/execcsslint),
which wraps [CSSLint](http://csslint.net/), to
parse javascript files. It uses 
[ExecJS](https://github.com/sstephenson/execjs) to find a suitable
javascript interpreter.

### It does not work with Rhino ###

CSSLint seems to hang or enter an infinite loop on Rhino version 1.7R4. 
It does, however, work with Rhino 1.7R3, which is provided by the following
Gem:

    gem 'therubyrhino_jar', '1.7.3'

It also works with Microsoft Windows Script Host (JScript).

## Licence ##

Copyright 2013 ebargtuo. Released under the MIT license.
