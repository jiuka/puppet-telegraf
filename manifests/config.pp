# == Class: telegraf::config
#
# only values which are effectivly changed will be managed
#
# More information on these settings available at:
#    https://github.com/influxdata/telegraf
#
# === Authors
#
# Roman Plessl <roman.plessl@prunux.ch>
#
# === Copyright
#
# Copyright 2015 Roman Plessl, Plessl + Burkhardt GmbH
#
class telegraf::config {

  $tags                      = $::telegraf::tags
  $agent_hostname            = $::telegraf::agent_hostname
  $outputs_influxdb_enabled  = $::telegraf::outputs_influxdb_enabled
  $outputs_influxdb_urls     = $::telegraf::outputs_influxdb_urls
  $outputs_influxdb_database = $::telegraf::outputs_influxdb_database
  $outputs_influxdb_username = $::telegraf::outputs_influxdb_username
  $outputs_influxdb_password = $::telegraf::outputs_influxdb_password
  $version                   = $::telegraf::version

  file { $::telegraf::config_base_file:
    ensure  => file,
    content => template($::telegraf::config_template),
    mode    => '0644',
    owner   => 'root',
    group   => 'telegraf',
  }

  file { $::telegraf::config_directory:
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'telegraf',
  }

}
