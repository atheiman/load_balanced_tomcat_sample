# load_balanced_tomcat_sample

`haproxy` load balancing Apache Tomcat [sample webapps](https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/). Built for centos / rhel.

> Disclaimer: a lot of the values in these recipes can (and should) be moved out to role attributes. I just built this as quick as possible as part of a training exercise.

## Roles

This cookbook depends on two roles.

### `tomcat_sample_load_balancer`

```json
{
  "name": "tomcat_sample_load_balancer",
  "description": "haproxy load balancer",
  "json_class": "Chef::Role",
  "default_attributes": {
    "ha_proxy": {
      "member_port": 8080,
      "members": [
        {"hostname": "tomcat1",
         "ipaddress": "xx.xx.xx.xx"},
        {"hostname": "tomcat2",
         "ipaddress": "xx.xx.xx.xx"}
      ]
    }
  },
  "override_attributes": {

  },
  "chef_type": "role",
  "run_list": [
    "recipe[haproxy]",
    "recipe[load_balanced_tomcat_sample::haproxy_config]"
  ],
  "env_run_lists": {

  }
}
```

### `tomcat_sample_server.json`

```json
{
  "name": "tomcat_sample_server",
  "description": "tomcat sample webapp server",
  "default_attributes": {
    "java": {
      "jdk_version": "7"
    },
  },
  "run_list": [
    "recipe[java]",
    "recipe[tomcat]",
    "recipe[load_balanced_tomcat_sample::tomcat_sample_app]"
  ]
}
```
