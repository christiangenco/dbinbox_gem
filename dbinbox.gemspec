# coding: utf-8

# this file generated with:
# bundle gem dbinbox

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dbinbox/version'

Gem::Specification.new do |spec|
  spec.name          = "dbinbox"
  spec.version       = Dbinbox::VERSION
  spec.authors       = ["Christian Genco"]
  spec.email         = ["christian.genco@gmail.com"]
  s.summary          = "send files, directories, and messages to dbinbox.com from the command line"
  s.description      = "Command line interface for the file sending site dbinbox.com. Allows command line uploading of files, directories, and messages from ARGV to specified dbinbox users."
  s.homepage         = 'https://github.com/christiangenco/dbinbox_gem'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  s.add_runtime_dependency "rest-client", "~> 1.6.7"
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end


# gem build dbinbox.gemspec
# gem install ./dbinbox-0.0.1.gem

Gem::Specification.new do |s|
  s.name        = 'dbinbox'
  s.version     = '0.0.1'
  s.date        = '2013-08-30'
  s.authors     = ["Christian Genco"]
  s.email       = 'christian.genco@gmail.com'
  s.files       = ["lib/dbinbox.rb"]
  s.executables << 'dbinbox'
end