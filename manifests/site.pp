node 'agent' {

notify { "Hello World!": }

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
