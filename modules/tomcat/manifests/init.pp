class tomcat {

  package { "tomcat6":
    ensure => latest,
  }

  file { "/usr/share/java/tomcat6/mysql-connector-java-5.1.22-bin.jar":
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "puppet:///modules/tomcat/usr/share/java/tomcat6/mysql-connector-java-5.1.22-bin.jar",
    require => Package["tomcat6"],
    notify  => Service["tomcat6"],
    before  => Service["tomcat6"],
  }

  service { "tomcat6":
    ensure  => running,
    enable  => true,
    require => Package["tomcat6"],
  }

  $mysql_servers = pdbnodequery(['=',['fact','servertype'],'mysql'])

  notify { "MySQL servers: $mysql_servers": }

  $app_db_name = hiera('app_db_name')
  $app_db_user = hiera('app_db_user')
  $app_db_pw = hiera('app_db_pw')
  $app_db_host = $mysql_servers[0]

  file { "/etc/tomcat6/server.xml":
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template("tomcat/etc/tomcat6/server.xml")
    require => Package["tomcat6"],
    notify  => Service["tomcat6"],
  }


}

