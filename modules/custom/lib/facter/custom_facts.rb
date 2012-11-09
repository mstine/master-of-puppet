require 'facter'

hostname = Facter.value(:hostname)
servertype = hostname[0,5]
Facter.add('servertype') {setcode {servertype}}

