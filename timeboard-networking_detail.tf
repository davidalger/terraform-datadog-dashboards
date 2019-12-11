resource "datadog_timeboard" "networking_detail" {
  count = var.enable_networking_detail ? 1 : 0

  title       = "Networking Detail (created via Terraform)"
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
      q             = "max:system.net.bytes_rcvd{$env,$host} by {host} * 8"
      stacked       = "false"
      type          = "area"
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
      type          = "area"
    }

    title = "Network Bits/s Sent"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.bytes_sent{$env,$host} by {host} * 8"
      stacked       = "false"
      type          = "area"
    }

    title = "MySQL Bits/s Sent"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.bytes_received{$env,$host} by {host} * 8"
      stacked       = "false"
      type          = "area"
    }

    title = "MySQL Bits/s Received"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.tcp4.time_wait{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "system.net.tcp4.time_wait"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.tcp4.established{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "system.net.tcp4.established"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.tcp4.closing{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "system.net.tcp4.closing"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.tcp4.opening{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "system.net.tcp4.opening"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:system.net.tcp4.listening{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "system.net.tcp4.listening"
    viz   = "timeseries"
  }
}
