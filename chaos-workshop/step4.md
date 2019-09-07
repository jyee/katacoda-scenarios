To run this experiment we'll be testing the resiliency of the Memebook service. We want to answer the following questions:

- Does the service restart without manual intervention?
- Can we monitor the service failure and restarts in Datadog?

## Deleting the pod

First get the name of of the Memebook pod by listing the running pods:

`kubectl get pods`{{execute}}

You should see a number of pods including the Memebook. For example:

```bash
NAME                            READY     STATUS              RESTARTS   AGE
memebook-74d88497df-6wcrn       1/1       Running             0          23s
```

You can use that name to delete the pod. For example:

`kubectl delete pod memebook-74d88497df-6wcrn`{{copy}}

Substitute your Memebook pod name and try it. After you delete the Memebook pod, get a list of the running pods.

What pods are running? Did the Memebook pod restart?
