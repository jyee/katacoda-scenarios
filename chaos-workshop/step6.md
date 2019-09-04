Congratulations on tackling Chaos level 4!

As mentioned in the last section, passing level 4 also requires that the service:

- can still operate with the failure of one dependency
- reports metrics, traces, and logs
- monitoring fully covers latency, errors, traffic, and saturation (aka The 4 Golden Signals)

So it looks like the MetricsPuppy development team has some work to do! Remember to file tickets or make tasks after your experiments to ensure this work gets done.

## More Chaos levels

There are two more Chaos levels that are beyond the scope of this workshop.

### 5. Spike traffic

What happens when your service receives a lot of traffic? How you handle this will depend on your service. In some instances, you may want to autoscale to handle the increase. In others you may want to queue requests and process them asynchronously, or maybe a circuit breaker is required to prevent overloading other systems.

Some popular tools you can use to test include:

- [Vegeta](https://github.com/tsenart/vegeta)
- [Locust](https://locust.io/)
- [JMeter](https://jmeter.apache.org/)

### 6. Terminate the region or cloud

This may be overkill for many organizations, but if your organization operates in multiple regions or with multiple cloud providers, then it's useful to test how failover works between regions or cloud providers.
