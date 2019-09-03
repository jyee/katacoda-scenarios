# Hello new SREs!

Welcome to MetricsPuppy, Inc. We're excited to have you join our company!

Say hello to your new colleague sitting next to you. Together, you'll be the core of our SRE team to make our Memebook app more resilient!

## I can haz appz?

Memebook is the amazing sofware service provided by MetricsPuppy. While Memebook might seem like an ordinary guestbook sample application, it's way better! Memebook has additional microservices that translate your guestbook comments into lolcat and add amazing photos of dogs. Here's a basic architecture diagram:

(TODO: IMAGE HERE)

In case you'd like to see the application code, it's available on [Github](https://github.com/jyee/memebook).

## Monitoring first

In order to do Chaos Engineering, you need to have monitoring in place. To start monitoring the Memebook application, you'll need to add your [Datadog API Key](https://app.datadoghq.com/account/settings#api) as a kubernetes secret:

1. Log into Datadog using the Datadog credentials for the workshop.
2. Go to [Integrations >> APIs](https://app.datadoghq.com/account/settings#api).
3. Create your Kubernetes secret:

   ```bash
   kubectl create secret generic datadog-api --from-literal=token=<YOUR_DATADOG_API_KEY>
   ```

Once you've added your Datadog API Key, you can start the Datadog Daemonset:

```bash
kubectl apply -f kubernetes/datadog-agent.yaml
```

Verify that the Datadog Agent daemonset has been applied:

```bash
kubectl get daemonset
```

You should see a response similar to:

```
NAME            DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
datadog-agent   1         1         1       1            1           <none>          23s
```

Also verify that the daemonset pods are running:

```bash
kubectl get pod
```
You should see a response similar to:

```
NAME                  READY   STATUS    RESTARTS   AGE
datadog-agent-hsmtr   1/1     Running   0          21s
```

Also verify that you are able to see Memebook reporting metrics in Datadog.

## More Kubernetes

Throughout this workshop, you'll need to run commands on your Kubernetes pods. If you are unfamiliar with Kubernetes, an easy way to run commands is by using `kubectl exec`.

For example, to get more information about the Datadog Agent, you can run the `agent status` command on the Datadog Agent pod:

```bash
kubectl exec -ti <YOUR_DATADOG_POD_NAME> -- agent status | more
```

Similarly you can get a bash shell prompt on the running pod by using:

```bash
kubectl exec -ti <YOUR_POD_NAME> -- bash
```
