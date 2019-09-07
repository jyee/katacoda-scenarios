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
