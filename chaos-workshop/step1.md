# Deploying Our Legacy Applications to Kubernetes

The workshop already has an application ready to be deployed to kubernetes included.

It's a Python and Node microservices application. Today, we'll be focusing on replacing one of the pieces with a Golang service.

So let's get the Kubernetes cluster up and running, along with Datadog as a DaemonSet.

First, ensure your kubernetes cluster has been initialized, and both nodes have been added. You can do this by running `kubectl get nodes` in host1.

On host1, change into the YAML file directory with a `cd k8s-yaml-files`. You should be able to `ls` and see the YAML files for every service we plan on running in our cluster.

First, add your Datadog API key to the secrets. You can do this with a:

```bash
$ kubectl create secret generic datadog-api --from-literal=token=<YOUR_DATADOG_API_KEY>
```

Once that's done, we'll next need to create a secret username and password for our PostgreSQL database.

```bash
$ kubectl create secret generic postgres-user --from-literal=token=postgres
$ kubectl create secret generic postgres-password --from-literal=token=<YOUR_PASSWORD>
```

Finally, spin up the Datadog Agent container, so we can see our Nodes in the Datadog app:

```bash
$ cd k8s-yaml-files/
$ kubectl apply -f datadog-agent.yaml
```

You should now be able to see your cluster inside of Datadog. Verify this before continuing on to the next step.
# Adding Services to Our Cluster

You can `kubectl apply -f <filename>` for each one of the remaining files in the YAML directory, and we should see our entire cluster spin up.

You should start with the two databases we have, `redis` and `postgres`, as the other containers rely on them running. After the databases, bring up the other services, and then last, the `frontend-service`.

The `frontend-service` requires the other services to be running first, so it knows where to connect to for API requests.

If you accidentally spin up the `frontend-service` before the rest, simply type `kubectl delete pod f<TAB>`, to have autocomplete finish the name of the running frontend service pod. Deleting the pod will delete the currently running instance, and a new one will be scheduled and deployed by kubernetes.

Check your services are running with a `kubectl get services`. If one is not up, check the status with a `kubectl get pods`.

If one has an error, you may need to `kubectl delete pod <podname>`.

Make sure you can visit your services by viewing the link below:

https://[[HOST_SUBDOMAIN]]-30001-[[KATACODA_HOST]].environments.katacoda.com/

If nothing loads, again, check to make sure all the pods came up with a `kubectl get pods`. Once they're all in the `Running` state, you should be able to hit the URL.

You can ensure your application and all the microservices are running properly by verifying that there are at least the 3 pumps visible by default. If there is just one, a piece of your deployment is still not deployed.

In the editor to the right, you should be able to also navigate to the `k8s-yaml-files` directory, and see your YAML files you've deployed.

Next, let's take a closer look at our YAML files, and see how we've instrumented our application.
# Instrumenting Kubernetes with the Datadog Agent

Let's start by viewing the Datadog Agent's configuration.

If we open the `datadog-agent.yaml`, we'll see that it's run as a DaemonSet. 

DaemonSets allow us to schedule pods that run once per node. The Datadog Agent container mounts volumes on each node, in order to inspect the pods running, along with any host level information like RAM or CPU usage.

You can see this works by the `volumeMounts` section in our YAML. There we see all the directories that are mounted for the Agent to run, picking up both processes and Docker containers running on the system.

You'll notice the Datadog DaemonSet also runs the APM Agent, opening up a port on `8126`, allowing us to send our traces downstream to the Agent.

Along with the Traces port, we open port `8125` for UDP and DogstatsD. DogstatsD allows us to send custom metrics, for things we may want to see.

Popular custom metrics are things like user logins per minute, failed login attempts, orders placed, orders completed, etc. Custom metrics allow you to build dashboards more relevant to the systems of your business.

Just as we did in our `docker-compose`, we set a `env` tag in our environment variables. 

Setting this tag works just as before, allowing us to define the environment within which we want all of our servers to live together in Datadog.

This way, we can separate out our infrastructure into units that make sense for us. Think of the difference between staging and production. Or maybe you have different regions your data lives within. Setting an `env` tag allows you to view logically separate infrastructures within Datadog.

Let's take a moment now to see what we're getting in Datadog, before we jump into seeing how our legacy systems have been instrumented.

The first place I like to look when becoming familiar with a new application is the Service Map within Datadog.

This shows us a high level overview of the systems running within our application. From here, we can click through and get a feel for the total number of requests coming through our application, any databases, and the flow of requests.

Next up, I like to hop in to Live Tail for Logs, and see what requests, if any, are coming through my system.

Finally, I can click into the Service List, and drill down on latencies across all of my services, looking to see if there are any major bottlenecks that stand out at a glance.

In this way, we can start to get a quick handle of how our systems are behaving, what endpoints are experiencing what level of load, and start understanding what dashboards may be worth building.# Instrumenting Kubernetes Applications in Multi-Language Architectures

For most companies, legacy infrastructure exists, and is a constant source of headhaches for new feature development.

Often times, legacy code is written in different languages or patterns, ones not ideal for the current set of constraints given when developing code. Once a piece of software becomes popular, the priorities switch to keeping it up and running, rather than keeping it clean.

Distributed Tracing gives us a tool to help deal with these sorts of constraints. Given a legacy application, using traces allows us to see if we're getting performance improvements from changes, and helps eliminate any "mythology" about how legacy systems behave.

Now that we've seen a bit of a high level for how our services are working or not, let's jump into the Datadog UI and start with a closer look at the service that calls all the subservices, `frontend-service`.

If we hop into the Service List for the `frontend-service`, we can see all of the URL endpoints along with latencies, etc.

In this interactive course, we also have the source code the `frontend-service` image was built from. 

If we look for the instrumentation for the `frontend-service` `api.py` source code, we'll notice there is _hardly any_ Datadog specific instrumentation. We merely grab a current context's `trace`, and set a `TRACE_PRIORITY`.

That's because the Python version of the Datadog Tracing library supports monkeypatching. If we look in our service's `Dockerfile`, we'll see that the final run command wraps Flask with a `ddtrace-run`:

```
CMD ["ddtrace-run", "flask", "run", "--host=0.0.0.0"]
```

In this way, we can quickly get a base idea for what's happening in legacy infrastucture, without having to do too much instrumenation or changes.

This works best in a supported language level library, as we'll have already made decisions about how and what to instrument out of the box.

Jumping now back into Datadog, take a look at Live Tail, Logs, APM's Service List, and finally, the Service Map.

All of this comes out of the box, helping you to get a handle on what's going on with your legacy systems, before jumping in to improve the state things with Go.