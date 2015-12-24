License
-------
GPL v2 

### This repo has moved to a [new location](https://github.com/poolski/puppet-beats) as I'm rewriting the module from the ground up to cover all the other Beats modules Elastic have released. Please look there for the latest versions & issues. ###

## Example Use ##

```
include ::packetbeat
```

That should install Packetbeat for you and enable the default Elasticsearch output with default host and port (localhost:9200)

If you want to configure further, you can do 
```
class {'packetbeat':
  es_host => '10.0.0.20',
  es_port => '9200',
}
```

To enable the protocol monitors, you'll need to include the right protocol class as follows
```include ::packetbeat::protocols::http```

This will create an http protocol listener on ports 80, 8000 and 8080, capturing the Host, Cookie and X-Forwarded-For headers in addition to the defaults. 

All the parameters are overrideable. Look in the manifests for more information - I'll flesh out the docs when I have time. Failing that, feel free to fork this and submit a pull request. 
