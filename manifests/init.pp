# == Class: telegraf
#
# Install the InfluxDBs telegraf
#
# === Parameters
#
# [*ensure*]
#  handle installation, activation or purging of telegraf
#
# [*version*]
#  handle version of telegraf
#
# [*install_method*]
#  Set to 'package' to install Telegraf using .deb or .rpm package.
#  Set to 'repository' to install Telegraf using an apt or yum repository.
#  Set to 'local' to use own package infrastructure (like aptly).
#  Defaults to 'package'.
#
# [*install_from_repository *]
#  Install telegraf from official repository
#
#  DEPRICATED COMPATIBILTY MODE for 0.2.0 API of this puppet-module, use
#  install_method instead!
#  Option will be REMOVED when Telegraf 0.3.0 is released
#
# [*config_base_file*]
#  path to the base configuration file
#
# [*config_directory *]
#  path to the configuration directory (snippets)
#
# [*outputs_influxdb_enabled*]
#  Activate InfluxDB as a output Plugin
#
# [*outputs_influxdb_urls*]
#  URLs to output sinks InfluxDB
#
# [*outputs_influxdb_database*]
#  Database name of output sink InfluxDB
#
# [*outputs_influxdb_username*]
#  Username of output sink InfluxDB
#
# [*outputs_influxdb_password*]
#  Password of output sink InfluxDB
#
# [*tags*]
#  Tags given as a key / value pair slice
#
# [*agent_hostname*]
#  Configures agent hostname for sending it to the sinks
#
class telegraf (
  $ensure                     = $telegraf::params::ensure,
  $version                    = $telegraf::params::version,
  $install_method             = $telegraf::params::install_method,
  $install_from_repository    = $telegraf::params::install_from_repository,
  $config_template            = $telegraf::params::config_template,
  $config_base_file           = $telegraf::params::config_base_file,
  $config_directory           = $telegraf::params::config_directory,

  # [outputs.influxdb] section of telegraf.conf
  $outputs_influxdb_enabled   = $telegraf::params::outputs_influxdb_enabled,
  $outputs_influxdb_urls      = $telegraf::params::outputs_influxdb_urls,
  $outputs_influxdb_database  = $telegraf::params::outputs_influxdb_database,
  $outputs_influxdb_username  = $telegraf::params::outputs_influxdb_username,
  $outputs_influxdb_password  = $telegraf::params::outputs_influxdb_password,

  # [tags] section of telegraf.conf
  $tags                       = $telegraf::params::tags,

  # [agent]
  $agent_hostname             = $telegraf::params::agent_hostname,
  $agent_interval             = $telegraf::params::agent_interval,

  # [[plugins.cpu]]
  $cpu_percpu                 = $telegraf::params::cpu_percpu,
  $cpu_totalcpu               = $telegraf::params::cpu_totalcpu,
  $cpu_drop                   = $telegraf::params::cpu_drop,

  # [[plugins.disk]]
  $disk_mountpoints           = $telegraf::params::mountpoints

) inherits telegraf::params
{
  class { 'telegraf::install': }
  ->
  class { 'telegraf::config': }
  ~>
  class { 'telegraf::service': }
  ->
  Class['telegraf']
}
