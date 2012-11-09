require 'facter'

hostname = Facter.value(:hostname)
servertype = hostname[0,4]
Facter.add('servertype') {setcode {servertype}}

