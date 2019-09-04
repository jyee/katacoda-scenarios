In order to do Chaos Engineering, you must have monitoring in place. Monitoring is how you'll verify your tests, evaluate your results, and determine next-steps to improve your systems. Additionally, Chaos Engineering can help you improve your monitoring by exposing areas of your system that are insufficiently monitored.

The terminals on the right provide access to your infrastructure. The terminal on the top is the Kubernetes Master and is where you can run the `kubectl` command to perform actions. From the MaThe terminal on the bottom is the Kubernetes Node—the host machine that's running both the Kubernetes software and the Memebook application running inside Kubernetes.

## Installing Datadog

To start, log into your [Datadog](https://app.datadoghq.com) account and navigate to the [APIs page](https://app.datadoghq.com/account/settings#api) under the Integrations menu. Then add your API Key as a Kubernetes secret:

`kubectl create secret generic datadog-api --from-literal=token=<YOUR_API_KEY>`{{copy HOST1}}

Once you've added your Datadog API Key, you can start the Datadog Daemonset:

`kubectl apply -f kubernetes/datadog-agent.yaml`{{execute HOST1}}

Verify that the Datadog Agent daemonset has been applied:

`kubectl get daemonset`{{execute HOST1}}

You should see a response similar to:

```bash
NAME            DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
datadog-agent   1         1         1       1            1           <none>          23s
```

Verify that the daemonset pods are running:

`kubectl get pod`{{execute HOST1}}

You should see a response similar to:

```bash
NAME                  READY   STATUS    RESTARTS   AGE
datadog-agent-hsmtr   1/1     Running   0          21s
```

Also verify that you are able to see Memebook reporting metrics in Datadog.

## More Kubernetes

Throughout this workshop, you'll need to run commands on your Kubernetes pods. If you are unfamiliar with Kubernetes, an easy way to run commands is by using `kubectl exec`.

For example, to get more information about the Datadog Agent, you can run the `agent status` command on the Datadog Agent pod:

`kubectl exec -ti <YOUR_DATADOG_POD_NAME> -- agent status | more`{{copy HOST1}}

Similarly you can get a bash shell prompt on the running pod by using:

`kubectl exec -ti <YOUR_POD_NAME> -- bash`{{copy HOST1}}
