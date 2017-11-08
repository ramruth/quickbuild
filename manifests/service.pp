# == Class: quickbuild::service
class quickbuild::service inherits quickbuild {

  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }

  exec { 'starting-quickbuild':
       command => 'nohup /home/vagrant/quickbuild-7.0.11/bin/server.sh console &',
       user    => vagrant,
   }
}
