Congratulations, you've completely Chaos level 2!

For the next experiment, you have a couple additional tools available to you on the Kubernetes node.

- [stress-ng](https://wiki.ubuntu.com/Kernel/Reference/stress-ng) is a stress testing tool that covers CPU, memory, I/O, and more. In addition to the [info page](https://wiki.ubuntu.com/Kernel/Reference/stress-ng), you can also reference the [man page](https://manpages.ubuntu.com/manpages/artful/man1/stress-ng.1.html).
- [Comcast](https://github.com/tylertreat/comcast) is a tool that simulates poor network conditions, including bandwidth capping, latency, and dropped packets.

To access the Kubernetes nodes, ssh to it (clicking below will open a new terminal tab):

`ssh root@node01`{{execute T2}}

### Picking tests

When degrading your environment remember to start small, then increase your degradation.

**Memory Attack Example**

For example, if you were targeting the host node's memory, you can start by launching 4 virtual memory stressors to consume 1GB each for 3 minutes:

`stress-ng --vm 4 --vm-bytes 1G --timeout 3m`{{execute T2}}

You can then increase the number of stressors and/or the amount of memeory they consume:

`stress-ng --vm 8 --vm-bytes 2GB --timeout 3m`{{execute T2}}

**Latency Attack Example**

If you were experimenting with latency increases, you could start small by inducing 100ms of latency:

`comcast --device=weave --latency=100`{{execute T2}}

You can then increase the latency, throttle bandwidth, or add packet loss to further degrade the network.

**More Ideas**

Comcast and stress-ng are just a couple tools that help with testing, there are many other ways to degrade the environment. Let's pause here to share more ideas with the group.

## Run your experiment!

Did you get some good test ideas? Start a new [Datadog Notebook](https://app.datadoghq.com/notebook) and write them into a plan with your Chaos partner:

1. Schedule it.
1. Pick tests.
1. Make a hypothesis.
1. Have a backup plan.
1. Share!
