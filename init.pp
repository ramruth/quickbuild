class quickbuild {
    include quickbuild::download
    include quickbuild::install
    include quickbuild::service  
    
    Class['quickbuild::download'] -> Class['quickbuild::install'] -> Class['quickbuild::service']
}
