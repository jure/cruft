![Cruft](http://i.imgur.com/Y5JOL.jpg)

The Hardvard Cruft Laboratory, birthplace of the term 'cruft'. Image by @brettstil.

# Cruft

Cruft enables you to keep track of workarounds you had to implement in order
to make your code work at the time your code was written. Years later,
the assumptions you made when the code was written, may no longer hold true, while
your code is still written with those assumptions and is needlessly complex.

Cruft compiles a Cruftfile by looking at all Ruby files in your `app` directory,
and finding comments which start with `#cruft:`. Every line until the next line that is not a comment,
will be included in the `Cruftfile`.

## Installation

Add this line to your application's Gemfile:

    gem 'cruft'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cruft

## Usage

You cd into the Rails app directory:

    $ cd /path/to/rails_app

And run cruft with bundle exec:

    $ bundle exec cruft

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
