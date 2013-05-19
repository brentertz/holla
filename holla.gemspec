# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "holla"
  spec.version       = VERSION
  spec.authors       = ["Brent Ertz"]
  spec.email         = ["brent.ertz@gmail.com"]
  spec.description   = %q{A talking RSpec formatter}
  spec.summary       = %q{An RSpec formatter that speaks test results aloud.}
  spec.homepage      = "http://github.com/brentertz/holla"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
