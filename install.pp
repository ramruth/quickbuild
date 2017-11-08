# == Class: quickbuild::install
class quickbuild::install inherits quickbuild {

  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }

notify { 'unzipping quickBuild':
}
  exec { 'unzip-quickbuild':
        command => 'gunzip /home/vagrant/quickbuild-7.0.11.tar.gz',
        #command => 'gunzip /home/vagrant/quickbuild-7.0.10.tar.gz',
	user    => vagrant,
        notify  => Exec['untar-quickbuild'],
  } ->

notify { 'untarring quickBuild':
}
  exec { 'untar-quickbuild':
        command => 'tar -xvf /home/vagrant/quickbuild-7.0.11.tar',
	user    => vagrant,
        require  => Exec['unzip-quickbuild'],
  }
  
notify { 'clean directory':
}
  exec { 'clean-quickbuild':
        command => 'rm /home/vagrant/quickbuild-7.0.11.tar',
        user    => vagrant,
	onlyif => 'ls /home/vagrant/quickbuild-7.0.11.tar',
	require  => Exec['untar-quickbuild'],
}

notify { 'Restoring old settings':
}
  exec { 'restore-quickbuild':
        command => '/home/vagrant/quickbuild-7.0.11/bin/restore.sh /home/vagrant/Storage/2017.05.22_06.03.55.zip',
        user    => vagrant,
        #onlyif => 'ls /home/vagrant/quickbuild-7.0.11.tar',
        require  => Exec['clean-quickbuild'],
}


}
