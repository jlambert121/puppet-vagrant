# Class: puppet-server
#
#
class puppet-server {

	
	package { "puppet-server":
		ensure => installed,
		require =>  Class[vagrant-repos];
	}

	service	{ puppetmaster:
		ensure => running,
		require => Package["puppet-server"];
	}
}


# Class: repos-apache
#
#
class repos-apache {
	package { "httpd":
		ensure => installed,
		require =>  Class[vagrant-repos];
	}

	service	{ httpd:
		ensure => running,
		require => Package["httpd"];
	}
	
	service	{ 
		iptables:
			ensure => stopped;
		ip6tables:
			ensure => stopped;
		}
	
}


# Class: vagrant-repos
#
#
class vagrant-repos {
	file { 
	"/etc/puppet/autosign.conf":
		ensure => file,
		source => "/vagrant/files/autosign.conf";
	
	"/etc/puppet/puppet.conf":
		ensure => file,
		source => "/vagrant/files/puppet.conf";

  	"/etc/yum.repos.d/epel-local.repo":
  	    ensure  => file,
  	    mode    => 0644,
  	    owner   => root,
  	    group   => 0,
  	    source => "/vagrant/files/epel.repo";
    "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6":
	    ensure  => file,
	    mode    => 0644,
	    owner   => root,
	    group   => 0,
	    source => "/vagrant/files/RPM-GPG-KEY-EPEL-6";
		
  	"/etc/yum.repos.d/CentOS-Base.repo":
  	    ensure  => file,
  	    mode    => 0644,
  	    owner   => root,
  	    group   => 0,
  	    source => "/vagrant/files/CentOS-Base.repo";

  	"/etc/yum.repos.d/puppetlabs.repo":
  	    ensure  => file,
  	    mode    => 0644,
  	    owner   => root,
  	    group   => 0,
  	    source => "/vagrant/files/puppetlabs.repo";

    "/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs":
	    ensure  => file,
	    mode    => 0644,
	    owner   => root,
	    group   => 0,
	    source => "/vagrant/files/RPM-GPG-KEY-puppetlabs";
		
	}
}


include vagrant-repos
include puppet-server
include repos-apache
