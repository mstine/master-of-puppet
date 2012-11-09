class "tomcat" {

  package { "tomcat6":
    ensure => latest,
  }

  service { "tomcat6":
    ensure  => running,
    enabled => true,
    require => Package["tomcat6"],
  }
}

