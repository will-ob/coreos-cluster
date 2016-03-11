
CoreOS Cluster
===============

Auto-scalable cluster of coreos machines.

- Core Machines (1 - n) -- Running etcd & [consul](https://www.consul.io/)
- Worker Machines (1 - m) -- Running an etcd proxy, a consul proxy, and [registrator](http://gliderlabs.com/registrator/latest/)

Based on ["CoreOS Cluster Architectures"](https://coreos.com/os/docs/latest/cluster-architectures.html)

<p align="center">
  <img src="https://raw.githubusercontent.com/will-ob/coreos-cluster/master/cluster-overview.png" />
</p>

Notes
------------

Other resources not automatically set up:

 - Build config & asg for worker machines (see [init](https://github.com/will-ob/coreos-cluster/blob/master/clusters/worker/cloud-init) data)
 - Build config & asg for core machines (see [init](https://github.com/will-ob/coreos-cluster/blob/master/clusters/etcd/cloud-init) data)
 - [Internal load balancer](https://github.com/will-ob/coreos-cluster/blob/master/clusters/worker/cloud-init#L38) for core machines
 - Public load balancer for incoming traffic
 - IAM instance role for all machines with `ec2:Describe*` and `autoscaling:Describe*`

License
-----------

Copyright 2016 Will O'Brien

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

