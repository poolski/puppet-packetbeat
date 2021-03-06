class packetbeat::package::rpm inherits packetbeat::package {

  package { 'libpcap':
    ensure => installed,
    before => Exec['rpm install'],
  }

  remote_file { '/tmp/packetbeat-1.0.0-beta2-x86_64.rpm':
    ensure      => present,
    source      => 'https://download.elasticsearch.org/beats/packetbeat/packetbeat-1.0.0-beta2-x86_64.rpm',
    verify_peer => false,
    require     => Package['libpcap'],
    before      => Exec['rpm install'],
  }

  exec { 'rpm install':
    command => 'rpm -vi packetbeat-1.0.0-beta2-x86_64.rpm',
    cwd     => "/tmp",
    creates => "/usr/bin/packetbeat",
    path    => ["/usr/bin", "/usr/sbin"]
  }

}
