ESTool - Elasticsearch Commandline Tool
=======================================

EStool is a command-line tool for interacting with the Elasticsearch search and analytics engine. 

## Installation

Install the gem

        gem install estool
        
## Requirements

* Requires Elasticsearch cluster accessible over HTTP.
* Tested on Elasticsearch 1.7.x, 2.3.x, 5.x
* Ruby 2.2.6

## Using estool

Getting help:

        estool -h
        
Global options:

* `-h, --host=HOST` - Elasticsearch node to connect to. Default: `localhost`
* `-p, --port=PORT` - HTTP port to connect to. Default: `9200`
* `-v, --verbose` - Show verbose output. In most commands this is represented by column headings. Not supported by all commands.
        
#### Cluster Health
        
This subcommand will print the cluster health out to the screen.

        $ estool health
        
More options can be listed with `$ estool health -h`

#### Indices

This subcommand is used to interact with the Cluster Indices.

Currently supports following actions:
* list indices
* create/delete/close indices

##### Examples
Create a new index:

        $ estool index create --name=index1

Delete an index:

        $ estool index delete --name=index1

Close an index:

        $ estool index close --name=index1
        
Show indices:

the `index` subcommand defaults to the show command, so you can get a list of indices simply by running:

        $ estool index

#### Aliases

This subcommand is used to interact with Index aliases within the cluster.

Currently supported actions:
* list aliases
* create/delete aliases

##### Examples

Create a new alias:

        $ estool aliases create -i index1 -n test_index

Delete an alias:

        $ estool aliases delete -i index1 -n test_index
 
List aliases:

        $ estool aliases
        
Like the `estool index` command, `estool aliases` defaults to listing the aliases for all indices.

List aliases for an index:

        $ estool aliases list -i index1


License
-------

See [LICENSE](LICENSE) file.

Maintainers
-----------
* David Hollinger, david.hollinger@moduletux.com, github:dhollinger