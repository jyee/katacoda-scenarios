MetricsPuppy SRE team, are you ready to start planning our first experiment? To start, [create a new Datadog Notebook](https://app.datadoghq.com/notebook).

1. **Schedule it.** Normally we'd give our colleagues a lot of notice, but we have a limited time for this workshop, so we'll be running the experiment in about 10 minutes (once you finish the planning).
1. **Pick tests.** For our first test, we'll see what happens when we disrupt the main `memebook` service. Let's run the following tests:
   - Delete the memebook pod
   - Terminate the memebook python process
1. **Make a hypothesis.** Discuss with your partner what you expect to happen for each of these tests. How will the Memebook application respond? What sort of indicators or alerts will you see in Datadog?
1. **Have a backup plan.** Thankfully our friends at Katacoda have this covered. If something goes horribly wrong, you can refresh your browser to begin a new session. Note: if you do this, you'll need to complete step 1 to reinstall Datadog on the new Kubernetes cluster.
1. **Share!** Save your Datadog Notebook. This Datadog account will be available for a limited time, so you may also want to screenshot or save the page.
