# gem build dbinbox.gemspec
# gem install ./dbinbox-0.0.1.gem

Gem::Specification.new do |s|
  s.name        = 'dbinbox'
  s.version     = '0.0.1'
  s.add_runtime_dependency "rest-client", ["~> 1.6.7"]
  s.date        = '2013-08-30'
  s.summary     = "send files, directories, and messages to dbinbox.com from the command line"
  s.description = "Command line interface for the file sending site dbinbox.com. Allows command line uploading of files, directories, and messages from ARGV to specified dbinbox users."
  s.authors     = ["Christian Genco"]
  s.email       = 'christian.genco@gmail.com'
  s.files       = ["lib/dbinbox.rb"]
  s.executables << 'dbinbox'
  s.homepage    = 'https://github.com/christiangenco/dbinbox_gem'
end