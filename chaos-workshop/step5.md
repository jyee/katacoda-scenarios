Congratulations, you've completely Chaos level 2!

How did the Memebook respond to your Chaos? What new tasks should be created from your experiment? Let's take a moment to share those with the group.

As we continue our next Chaos levels include:

### 3. Terminate the host

Unfortunately we can't do this in Katacoda—it would just end our session and force us to refresh the browser to start a new session, with a new host. So we'll skip this level.

### 4. Degrade the environment

Experiments at this level simulate poor operating and network environments. How would the Memebook respond if it were starved for CPU or if the network were unreliable?

In order to pass this level, we also require that services:

- can still operate with the failure of one dependency
- report metrics, traces, and logs
- monitoring fully covers latency, errors, traffic, and saturation (aka The 4 Golden Signals)

## Experiment 3

For this experiment, we'll be using [Comcast](https://github.com/tylertreat/comcast), an open source tool that helps simulate poor network conditions.

Some of your tests might include:

[--TODO HERE--]


Start a new [Datadog Notebook](https://app.datadoghq.com/notebook) and write up a plan with your SRE partner:

1. Schedule it.
1. Pick tests.
1. Make a hypothesis.
1. Have a backup plan.
1. Share!

After you have created your plan, let's pause briefly to discuss with the entire group.
