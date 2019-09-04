## Planning

Chaos Engineering, like all engineering practices, are not random. Prior to running your Chaos test or experiment, you should perform the following tasks:

1. **Schedule it.** You need to ensure your tests will not interfere with important customer events (e.g. holiday sales) or production work (e.g. new feature deployments).
1. **Pick tests.** Determine what you will do to induce failure. Write down your planned actions so that you (and others) can repeat them in the future. Start with easy tests before moving on to more complex ones.
1. **Make a hypothesis.** Write down what you expect to happen. How will your systems and applications respond to failure? Include how you will see those responses in your monitoring systems and what alerts or notifications you should receive.
1. **Have a backup plan.** Sometimes experiments don't behave as predicted. Write down a plan of action to minimize downtime in the event that things go wrong.
1. **Share!** This is the most important step. Share your plans with your organization.

## Putting it into practice

MetricsPuppy SRE team, are you ready to start planning our first experiment? To start, let's [create a new Datadog Notebook](https://app.datadoghq.com/notebook).

1. In the new notebook, click the default title and give your new notebook a descriptive name.
1. New notebooks come with a default metrics graph. You can delete this and add a new markdown section. Record each of the items below in your notebook.
1. **Schedule it.** Normally we'd give our colleagues a lot of notice, but we have a limited time for this workshop, so we'll be running the experiment in about 10 minutes (once you finish the planning).
1. **Pick tests.** For our first test, we'll see what happens when we disrupt the main `memebook` service. Let's run the following tests:
   - Delete the memebook pod
   - Terminate the memebook python process
1. **Make a hypothesis.** Discuss with your partner what you expect to happen for each of these tests. How will the Memebook application respond? What sort of indicators or alerts will you see in Datadog?
1. **Have a backup plan.** Thankfully our friends at Katacoda have this covered. If something goes horribly wrong, you can refresh your browser to begin a new session. Note: if you do this, you'll need to complete step 1 to reinstall Datadog on the new Kubernetes cluster.
1. **Share!** Save your Datadog Notebook. This Datadog account will be available for a limited time, so you may also want to screenshot or save the page.

## Even more sharing

Let's paws here and share our plans with the group.
