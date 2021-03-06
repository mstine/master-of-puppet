node 'agent' {

notify { "This should work...Hello World! Getting closer...Testing push...it would help if I could type!": }

package { "tomcat6":
  ensure => latest,
}

package { "tomcat6-webapps":
  ensure  => latest,
  require => Package["tomcat6"],
}

service { "tomcat6":
  ensure  => running,
  enable  => true,
  require => Package["tomcat6"],
}

}

node 'puppetdb' {

   package { "puppetdb":
      ensure => latest,
   }

   service { "puppetdb":
      ensure   => running,
      enable   => true,
      require  => Package["puppetdb"],
   }

   service { "iptables":
      ensure => stopped,
   }

}

node default {

  include "firewall"

  if $::servertype == "tcsrv" {
    include "tomcat"
  }

  if $::servertype == "mysql" {
    include "mysql"
  }

}

