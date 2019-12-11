resource "datadog_timeboard" "magento_overview" {
  count = var.enable_magento_overview ? 1 : 0

  title       = "Magento Overview (created via Terraform)"
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
    autoscale = "false"

    group = [
      "env",
    ]

    include_no_metric_hosts = "true"
    include_ungrouped_hosts = "false"

    request {
      increase_good = "false"
      q             = "avg:system.load.norm.1{$env} by {host}"
      stacked       = "false"
      type          = "fill"
    }

    scope = [
      "$env",
    ]

    style = {
      palette      = "green_to_orange"
      palette_flip = "false"
    }

    title = "System Load Avg. (normalized)"
    viz   = "hostmap"
  }

  graph {
    autoscale               = "false"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      change_type     = "absolute"
      compare_to      = "hour_before"
      extra_col       = "present"
      increase_good   = "false"
      order_by        = "change"
      order_direction = "desc"
      q               = "avg:system.load.1{$env} by {host}"
      stacked         = "false"
      type            = "line"
    }

    title = "Max System Load Avg. (compared to last hour)"
    viz   = "change"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:nginx.net.connections{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "Nginx Connections"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:nginx.net.request_per_s{$env,$host} by {host}"
      stacked       = "false"
      type          = "area"
    }

    title = "Nginx Requests/s (frontend+backend)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:nginx.net.request_per_s{$env,$host} by {host} - (max:varnish.client_req{$env,$host} by {host} + max:varnish.backend_req{$env,$host} by {host} - per_second(max:varnish.bans{$env,$host} by {host}))"
      stacked       = "false"
      type          = "area"
    }

    title = "Nginx Requests/s (not sent through Varnish)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      increase_good = "false"
      q             = "per_second(max:varnish.bans{$env,$host} by {host})"
      stacked       = "false"
      type          = "area"
    }

    title = "Varnish Ban Requests/s"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:nginx.net.conn_dropped_per_s{$env,$host} by {host}"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "area"
    }

    title = "Nginx Dropped Connections/s"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.threads{$env,$host} by {host,varnish_name}"
      stacked       = "false"
      type          = "area"
    }

    title = "Varnish Threads"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.client_req{$env,$host} by {host,varnish_name}"
      stacked       = "false"

      style = {
        palette = "dog_classic"
      }

      type = "area"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.sess_queued{$env,$host} by {host,varnish_name}"
      stacked       = "false"

      style = {
        palette = "grey"
      }

      type = "area"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.sess_dropped{$env,$host} by {host,varnish_name}"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "area"
    }

    title = "Varnish Client Requests/s"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.backend_req{$env,$host} by {host,varnish_name}"
      stacked       = "false"
      type          = "area"
    }

    title = "Varnish Backend Requests/s"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    custom_unit             = "rpm"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "sum:varnish.backend_req{$env,$host} by {host,varnish_name} * 60"
      stacked       = "false"
      type          = "area"
    }

    title = "Varnish Backend Requests/m Average"
    viz   = "query_value"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:php_fpm.processes.active{$env,$host} by {host,pool}"
      stacked       = "false"
      type          = "area"
    }

    title = "PHP-FPM Active Processes"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:php_fpm.requests.accepted{$env,$host} by {host,pool}.as_rate()"
      stacked       = "false"
      type          = "area"
    }

    title = "PHP-FPM Requests/s"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:php_fpm.processes.max_reached{$env,$host} by {host,pool}.as_count()"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "area"
    }

    title = "PHP-FPM Max Processes Reached"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.net.commands{$env,$host} by {host,redis_name}"
      stacked       = "false"
      type          = "area"
    }

    title = "Redis Commands/s"
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

    title = "MySQL Connections"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.active_transactions{$env,$host} by {env}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Active Transactions"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.threads_connected{$env,$host} by {env} / max:php_fpm.processes.active{$env,$host} by {env}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Connections per Active PHP Process"
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

    title = "MySQL Questions/s"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.cache_hit{$env,$host} by {host,varnish_name} / ( max:varnish.cache_hit{$env,$host} by {host,varnish_name} + max:varnish.cache_miss{$env,$host} by {host,varnish_name} + max:varnish.cache_hitpass{$env,$host} by {host,varnish_name} ) * 100"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.stats.keyspace_hits{$env,redis_name:fpc} by {host} / ( max:redis.stats.keyspace_hits{$env,redis_name:fpc} by {host} + max:redis.stats.keyspace_misses{$env,redis_name:fpc} by {host} ) * 100"
      stacked       = "false"
      type          = "line"
    }

    title = "Full Page Cache Hit Rate (%)"
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
      q             = "max:redis.stats.keyspace_hits{$env,redis_name:obj} by {host,env} / ( max:redis.stats.keyspace_hits{$env,redis_name:obj} by {host,env} + max:redis.stats.keyspace_misses{$env,redis_name:obj} by {host,env} ) * 100"
      stacked       = "false"
      type          = "line"
    }

    title = "Redis Obj Cache Hit Rate (%)"
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
      q             = "max:varnish.cache_hit{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.cache_miss{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.cache_hitpass{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.stats.keyspace_hits{$env,redis_name:fpc} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.stats.keyspace_misses{$env,redis_name:fpc} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "Full Page Cache Utilization"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.keys{$env,redis_name:fpc} by {host,env}"
      stacked       = "false"
      type          = "bars"
    }

    request {
      increase_good = "false"
      q             = "max:varnish.n_object{$env,$host} by {host,varnish_name}"
      stacked       = "false"
      type          = "bars"
    }

    title = "Full Page Cache Objects"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "diff(max:varnish.n_lru_nuked{$env,$host} by {host,varnish_name})"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "bars"
    }

    request {
      increase_good = "false"
      q             = "diff(max:varnish.n_expired{$env,$host} by {host,varnish_name})"
      stacked       = "false"
      type          = "bars"
    }

    request {
      increase_good = "false"
      q             = "diff(max:redis.keys.expired{$env,redis_name:fpc} by {host,env})"
      stacked       = "false"
      type          = "bars"
    }

    request {
      increase_good = "false"
      q             = "diff(max:redis.keys.evicted{$env,redis_name:fpc} by {host,env})"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "bars"
    }

    title = "Full Page Cache (Expired,Evicted)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "diff(max:redis.keys.evicted{$env,$host} by {host,env,redis_name})"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "area"
    }

    title = "Redis Evictions"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.esi_errors{$env,$host} by {host,varnish_name}"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "bars"
    }

    request {
      increase_good = "false"
      q             = "max:varnish.esi_warnings{$env,$host} by {host,varnish_name}"
      stacked       = "false"

      style = {
        palette = "warm"
      }

      type = "bars"
    }

    title = "Varnish ESI (Errors,Warnings)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.mem.rss{$env,$host} by {host,redis_name}"
      stacked       = "false"
      type          = "area"
    }

    title = "Redis System Memory Used"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.mem.used{$env,$host} by {host,redis_name}"
      stacked       = "false"
      type          = "area"
    }

    title = "Redis Data In Memory"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:redis.mem.used{$env,$host} by {host,redis_name} / max:redis.mem.maxmemory{$env,$host} by {host,redis_name} * 100"
      stacked       = "false"
      type          = "line"
    }

    title = "Redis Memory Usage (%) (Redis v3.2+)"
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
      q             = "max:varnish.SMA.s0.g_bytes{$env,$host} by {host,varnish_name}"
      stacked       = "false"
      type          = "area"
    }

    title = "Varnish Data In Memory"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:varnish.SMA.s0.g_bytes{$env,$host} by {host,varnish_name} / ( max:varnish.SMA.s0.g_bytes{$env,$host} by {host,varnish_name} + max:varnish.SMA.s0.g_space{$env,$host} by {host,varnish_name} ) * 100"
      stacked       = "false"
      type          = "area"
    }

    title = "Varnish Memory Usage (%)"
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
      q             = "max:mysql.performance.com_select{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Select Queries"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_insert{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_update{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_delete{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Queries (Insert/Update/Delete)"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_select{$env,$host} by {host} / max:mysql.net.connections{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Select Queries per Connection"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_insert{$env,$host} by {host} / max:mysql.net.connections{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_update{$env,$host} by {host} / max:mysql.net.connections{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.performance.com_delete{$env,$host} by {host} / max:mysql.net.connections{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Queries (Insert/Update/Delete) per Connection"
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
      type          = "line"
    }

    title = "MySQL Row Lock Waits"
    viz   = "timeseries"
  }

  graph {
    autoscale               = "true"
    include_no_metric_hosts = "false"
    include_ungrouped_hosts = "false"

    request {
      aggregator    = "avg"
      increase_good = "false"
      q             = "max:mysql.innodb.row_lock_time{$env,$host} by {host}"
      stacked       = "false"
      type          = "line"
    }

    title = "MySQL Row Lock Time"
    viz   = "timeseries"
  }
}
