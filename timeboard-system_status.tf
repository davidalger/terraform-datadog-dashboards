resource "datadog_timeboard" "system_status" {
  count = var.enable_system_status ? 1 : 0

  title       = "System Status (created via Terraform)"
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

    marker {
      type  = "error dashed"
      value = "y = 85"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.cpu.user{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "CPU Usage (%)"
    viz   = "timeseries"

    yaxis = {
      max = "100"
      min = "0"
    }
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.load.1{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "CPU Load"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    marker {
      type  = "error dashed"
      value = "y = 90"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "( max:system.mem.total{$env,$host} by {host} - max:system.mem.usable{$env,$host} by {host} ) / max:system.mem.total{$env,$host} by {host} * 100"
      stacked       = "false"

      style = {
        palette = "dog_classic"
        type    = "solid"
      }

      type = "line"
    }

    title = "Memory Used (%)"
    viz   = "timeseries"

    yaxis = {
      max = "100"
      min = "0"
    }
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "( max:system.mem.total{$env,$host} by {host} - max:system.mem.free{$env,$host} by {host} ) / max:system.mem.total{$env,$host} by {host} * 100"
      stacked       = "false"

      style = {
        palette = "dog_classic"
        type    = "dotted"
        width   = "thin"
      }

      type = "line"
    }

    title = "Memory Used+Buffered+Cached (%)"
    viz   = "timeseries"

    yaxis = {
      max = "100"
      min = "0"
    }
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.cpu.iowait{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "I/O Wait (%)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.io.util{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "I/O Utilization (%)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "(max:system.net.bytes_sent{$env,$host} by {host}+max:system.net.bytes_rcvd{$env,$host} by {host})*8"
      stacked       = "false"
      type          = "line"
    }

    title = "Network Bits/s Total"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.bytes_rcvd{$env,$host} by {host} * 8"
      stacked       = "false"
      type          = "line"
    }

    title = "Network Bits/s Received"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.bytes_sent{$env,$host} by {host} * 8"
      stacked       = "false"
      type          = "line"
    }

    title = "Network Bits/s Sent"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    marker {
      type  = "error dashed"
      value = "y = 80"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.disk.used{$env,$host} by {host} / max:system.disk.total{$env,$host} by {host} * 100"
      stacked       = "false"
      type          = "line"
    }

    title = "Disk Total Usage (%)"
    viz   = "timeseries"

    yaxis = {
      max = "100"
      min = "0"
    }
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    marker {
      type  = "error dashed"
      value = "y = 90"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.disk.in_use{$env,$host} by {host,device} * 100"
      stacked       = "false"
      type          = "line"
    }

    title = "Disk Partition Usage (%)"
    viz   = "timeseries"

    yaxis = {
      max = "100"
      min = "0"
    }
  }
}
