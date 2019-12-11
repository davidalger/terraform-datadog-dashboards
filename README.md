# Terraform Module for Datadog Dashboards

Terraform module for deploying pre-defined set of Dataodog dashboards which are largely focused on deployments setup utilizing ansible roles also published under this Github account.

## Module Inputs

In order to deploy dashboards with this module, one or more of the following should be set to `true`.

* `enable_magento_overview` — (Optional) Enables the "Magento Overview" dashboard.
* `enable_mysql_performance` — (Optional) Enables the "MySQL Performance" dashboard.
* `enable_networking_detail` — (Optional) Enables the "Networking Detail" dashboard.
* `enable_system_status` — (Optional) Enables the "System Status" dashboard.

## License

This work is licensed under the MIT license. See LICENSE file for details.

## Author Information

This project was started in 2017 by [David Alger](https://davidalger.com/).
