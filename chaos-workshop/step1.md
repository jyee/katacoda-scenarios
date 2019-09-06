In order to do Chaos Engineering, you must have monitoring in place. Monitoring is how you'll verify your tests, evaluate your results, and determine next-steps to improve your systems. Additionally, Chaos Engineering can help you improve your monitoring by exposing areas of your system that are insufficiently monitored.

The terminals on the right provide access to your infrastructure.

The terminal in the first tab is your Kubernetes Master. This coordinates all of the Kubernetes orchestration and is where you can run the `kubectl` command to perform actions.

The terminal in the second tab is the Kubernetes Node (we're running a single node "cluster"). This is where kubernetes workloads&mdash;including the memebook and related services&mdash;are run.

## Installing Datadog

To start, log into your [Datadog](https://app.datadoghq.com) account and navigate to the [APIs page](https://app.datadoghq.com/account/settings#api) under the Integrations menu. Then add your API Key as a Kubernetes secret:

`kubectl create secret generic datadog-api --from-literal=token=<YOUR_API_KEY>`{{copy}}

Once you've added your Datadog API Key, you can start the Datadog Daemonset:

`kubectl apply -f kubernetes/datadog-agent.yaml`{{execute}}

Verify that the Datadog Agent daemonset has been applied:

`kubectl get daemonset`{{execute}}

You should see a response similar to:

```bash
NAME            DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
datadog-agent   1         1         1       1            1           <none>          23s
```

Verify that the daemonset pods are running:

`kubectl get pod`{{execute}}

You should see a response similar to:

```bash
NAME                  READY   STATUS    RESTARTS   AGE
datadog-agent-hsmtr   1/1     Running   0          21s
```

Also verify that you are able to see Memebook reporting metrics in Datadog.
