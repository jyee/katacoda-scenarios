At Datadog (and MetricsPuppy!), we have several levels of Chaos testing. Each level requires more resiliency and monitoring than the previous levels.

### 1. Terminate the service

Congrats you've already completed this level! At this level we want to ensure that a service will restart automatically without any manual intervention. We also want to ensure that our monitoring tool captures the failure and restart, and that it can alert us if necessary.

### 2. Block dependencies

The next level that we'll work on is to block dependencies. What will happen to the Memebook if we block or disable the lolcat or doggo services? What if Redis is unavailable? This is your next task!

## Experiment 2

Remember to plan your experiment. Start a new [Datadog Notebook](https://app.datadoghq.com/notebook) and write up a plan with your SRE partner:

1. Schedule it.
1. Pick tests.
1. Make a hypothesis.
1. Have a backup plan.
1. Share!

After you have a plan in place, let's pause briefly to discuss with the entire group.
