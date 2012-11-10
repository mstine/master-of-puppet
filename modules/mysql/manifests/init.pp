class mysql {

  $mysql_password = hiera('mysql_password')

  package { "mysql-server":
    ensure => latest,
  }

  service { "mysqld":
    ensure  => running,
    enable  => true,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-password":
    unless  => "/usr/bin/mysqladmin -uroot -p${mysql_password} status",
    command => "/usr/bin/mysqladmin -uroot password ${mysql_password}",
    require => Service["mysqld"],
  }

  db { "todos":
    user     => "todos",
    password => "todos",
    require  => Exec["set-mysql-password"],
  }

}

