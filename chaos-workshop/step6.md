Congratulations, you've completely Chaos level 2!

How did the Memebook respond to your Chaos? What new tasks should be created from your experiment? Let's take a moment to share those with the group.

As we continue, our next Chaos levels include:

### 3. Terminate the host

Unfortunately we can't do this in Katacoda&mdash;it would just end our session and force us to refresh the browser to start a new session, with a new host. So we'll skip this level.

### 4. Degrade the environment

Experiments at this level simulate poor operating and network environments. How would the Memebook respond if it were starved for CPU or memory? What if the network is unreliable or slow?

As you plan your level 4 experiments, begin small and then increase the degredation. Starting small will help you identify effects and correlations&mdash;and hopefully provide insights into what to watch for to address issues when they're small.

In order to pass this level, we also require that services:

- can still operate with the failure of one dependency
- report metrics, traces, and logs
- monitoring fully covers latency, errors, traffic, and saturation (aka The 4 Golden Signals)

## Experiment 3

For this experiment, you have a couple additional tools available to you on the Kubernetes node.

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

Did you get some good test ideas? Start a new [Datadog Notebook](https://app.datadoghq.com/notebook) and write them into a plan with your SRE partner:

1. Schedule it.
1. Pick tests.
1. Make a hypothesis.
1. Have a backup plan.
1. Share!
