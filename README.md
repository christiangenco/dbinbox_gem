# Dbinbox

Command line interface for the file sending site dbinbox.com. Allows command line uploading of files, directories, and messages from ARGV to specified dbinbox users.

## Installation

    $ gem install dbinbox

Or, to use within a Ruby project, add this line to your application's Gemfile:

    gem 'dbinbox'

And then execute:

    $ bundle

## Usage

    $ dbinbox USERNAME cat.jpg
    # uploads cat.jpg to http://dbinbox.com/USERNAME/

    $ dbinbox USERNAME cats/
    # uploads the directory cats and all of its contents

    $ dbinbox USERNAME/lolcats bobtail.png bengal.jpg manx.gif
    # uploads three images to the /lolcats dbinbox directory
    
    $ dbinbox USERNAME "hey there - how's it going?"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
