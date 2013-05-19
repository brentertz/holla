# Holla

A talking [RSpec](http://rspec.info/) formatter that speaks test results aloud.

Internally, the speaking is performed using the Mac OSX [say](http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/say.1.html) command, and as such will only work on a system where that command is available.  If the system does not support the `say` command, standard RSpec output will still be displayed.

While Holla is capable of speaking individual example results, this behavior greatly lengthens the duration of test runs and thus the default behavior is to only speak the summary results.

Messages and voices are configurable too, see below for details.

## Installation

Add this line to your application's Gemfile:

    gem 'holla'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install holla  

## Usage

Run your specs using the following syntax:

	rspec --format Holla --color spec

Or if you would like to make Holla your default RSpec formatter, create a `.rspec` file in your project root directory with the following contents:

	--format Holla
	--color

## Options

You may further customize the voices, messages, and enable/disable the summary only mode.  One might do this for example, in a Rails initializer _(config/initializers/holla.rb)_ such as the following.

	require 'holla'

	Holla.voices = %w[Albert Alex Fred Ralph]
	Holla.emcee = {
	  voice: 'Zarvox',
	  rate: 150
	}
	Holla.messages = {
	  positive: %w[yay! woohoo!],
	  negative: %w[boooo! sad\ panda],
	  indifferent: %w[meh whatever]
	}
	Holla.summary_only = false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
