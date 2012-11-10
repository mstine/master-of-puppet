class tomcat {

  package { "tomcat6":
    ensure => latest,
  }

  service { "tomcat6":
    ensure  => running,
    enable  => true,
    require => Package["tomcat6"],
  }

  $mysql_servers = pdbnodequery(['=',['fact','servertype'],'mysql'])

  notify { "MySQL servers: $mysql_servers": }


}

