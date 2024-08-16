# This Puppet manifest configures Apache, ensuring the correct permissions and service status.

# Ensure Apache is installed
package { 'apache2':
  ensure => installed,
}

# Ensure Apache service is running
service { 'apache2':
  ensure => running,
  enable => true,
}

# Ensure the web root directory has the correct permissions
file { '/var/www/html':
  ensure => directory,
  owner  => 'www-data',
  group  => 'www-data',
  mode   => '0755',
}

# Example of a configuration file fix
file { '/etc/apache2/sites-available/000-default.conf':
  ensure => file,
  source => 'puppet:///modules/apache/000-default.conf',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  notify => Service['apache2'],
}
