#installing flask v 2.1.0

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['Werkzeug'],
}

package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
