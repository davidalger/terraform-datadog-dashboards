resource "datadog_timeboard" "mysql_performance" {
  count = var.enable_mysql_performance ? 1 : 0

  title       = "MySQL Performance (created via Terraform)"
  description = ""
  read_only   = "true"

  template_variable {
    default = "*"
    name    = "env"
    prefix  = "env"
  }

  template_variable {
    default = "*"
    name    = "host"
    prefix  = "host"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.net.connections{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.net.connections"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.threads_connected{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.performance.threads_connected"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.queries{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.performance.queries"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.questions{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.performance.questions"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.replication.seconds_behind_master{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.replication.seconds_behind_master"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.binlog.disk_use{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.binlog.disk_use"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.s_lock_os_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.s_lock_os_waits"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.x_lock_os_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.x_lock_os_waits"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.mutex_os_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.mutex_os_waits"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.mutex_spin_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.mutex_spin_waits"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.mutex_spin_rounds{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.mutex_spin_rounds"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.locked_tables{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.locked_tables"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.current_row_locks{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.current_row_locks"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.locked_transactions{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.locked_transactions"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.row_lock_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.row_lock_waits"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.rows_read{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.rows_read"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.rows_inserted{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.rows_inserted"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.rows_updated{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.rows_updated"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.rows_deleted{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.innodb.rows_deleted"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.s_lock_os_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.innodb.x_lock_os_waits{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.innodb (s_lock_os_waits,x_lock_os_waits)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.data_reads{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.innodb.data_writes{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.innodb.data (reads,writes)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.select_full_join{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.select_full_range_join{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.performance.select (full_join,full_range_join)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.opened_tables{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "mysql.performance.opened_tables"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_load{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_delete{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_insert{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_update{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_replace{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_delete_multi{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_update_multi{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      increase_good = "false"
      q             = "max:mysql.performance.com_insert_select{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.performance.com (load,delete,insert,update,replace,delete_multi,update_..."
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_select{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.performance.com (select)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      metadata_json = jsonencode({
        "max:system.net.bytes_sent{$env,$host} by {host}*8" = {
          alias = "System Bits/s"
        }
      })
      q       = "max:system.net.bytes_sent{$env,$host} by {host}*8"
      stacked = "false"
      type    = "line"
    }

    request {
      increase_good = "false"
      metadata_json = jsonencode({
        "max:mysql.performance.bytes_sent{$env,$host} by {host}*8" = {
          alias = "MySQL Bits/s"
        }
      })
      q       = "max:mysql.performance.bytes_sent{$env,$host} by {host}*8"
      stacked = "false"
      type    = "line"
    }

    request {
      increase_good = "false"
      metadata_json = jsonencode({
        "(max:system.net.bytes_sent{$env,$host} by {host}-max:mysql.performance.bytes_sent{$env,$host} by {host})*8" = {
          alias = "Other Bits/s"
        }
      })
      q       = "(max:system.net.bytes_sent{$env,$host} by {host}-max:mysql.performance.bytes_sent{$env,$host} by {host})*8"
      stacked = "false"
      type    = "line"
    }

    title = "DB Net Bits Sent (Total/MySQL/Other)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      metadata_json = jsonencode({
        "max:system.net.bytes_rcvd{$env,$host} by {host}*8" = {
          alias = "System Bits/s"
        }
      })
      q       = "max:system.net.bytes_rcvd{$env,$host} by {host}*8"
      stacked = "false"
      type    = "line"
    }

    request {
      increase_good = "false"
      metadata_json = jsonencode({
        "max:mysql.performance.bytes_received{$env,$host} by {host}*8" = {
          alias = "MySQL Bits/s"
        }
      })
      q       = "max:mysql.performance.bytes_received{$env,$host} by {host}*8"
      stacked = "false"
      type    = "line"
    }

    request {
      increase_good = "false"
      metadata_json = jsonencode({
        "(max:system.net.bytes_rcvd{$env,$host} by {host}-max:mysql.performance.bytes_received{$env,$host} by {host})*8" = {
          alias = "Other Bits/s"
        }
      })
      q       = "(max:system.net.bytes_rcvd{$env,$host} by {host}-max:mysql.performance.bytes_received{$env,$host} by {host})*8"
      stacked = "false"
      type    = "line"
    }

    title = "DB Net Bits Received (Total/MySQL/Other)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.buffer_pool_utilization{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.innodb.buffer_pool_utilization"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.buffer_pool_total{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "mysql.innodb.buffer_pool_total"
    viz   = "timeseries"
  }
}
