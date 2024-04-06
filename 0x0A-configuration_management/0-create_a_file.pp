<<<<<<< HEAD
# This manifest creates a file at /tmp
=======
This manifest creates a file at /tmp
>>>>>>> 5ea2dfd6aa7b682359633ab71966744d4cb3a100
file { '/tmp/school':
    ensure  => 'file',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0744',
    content => 'I love Puppet',
}
