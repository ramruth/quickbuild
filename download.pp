# == Class: quickbuild::download
class quickbuild::download inherits quickbuild {

  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/'] }

notify { 'Downloading quickbuild':
}
  #exec { 'download-quickbuild':
       #command => 'wget https://www.pmease.com/artifacts/3721/quickbuild-7.0.11.tar.gz',
       #user    => vagrant,
  #} 

}
