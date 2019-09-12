To ensure that Memebook is up and running, first verify that you're connected to the Kubernetes API:

`kubectl get nodes`{{execute}}

You should see the Kubernetes master (the machine your terminal is currently connected to) and one additional node:

```bash
NAME      STATUS    ROLES     AGE       VERSION
master    Ready     master    4h        v1.11.3
node01    Ready     <none>    4h        v1.11.3
```

You can also see the pods that are running:

`kubectl get pods`{{execute}}

Once the memebook is running, you can interact with it at:

https://[[HOST_SUBDOMAIN]]-8500-[[KATACODA_HOST]].environments.katacoda.com/

### Troubleshooting

If you receive an error message `The connection to the server localhost:8080 was refused - did you specify the right host or port?` it means that Kubernetes has not started. You can refresh the page in your browser to start a new session or let a staff member know and we can help troubleshoot.

If you can see the Kubernetes nodes, but are not seeing any pods, apply the manifests in the `kubernetes` directory:

`kubectl apply -f kubernetes/`{{execute}}
