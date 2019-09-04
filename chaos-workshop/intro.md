# Hands-on introduction to Chaos Engineering

In this workshop, you'll learn more about Chaos Engineering by implementing Chaos tests using fundamental practices. This will give you the foundation to begin implementing tests in your real-world systems.

## Hello new SREs!

Welcome to MetricsPuppy, Inc. We're excited to have you join our company!

Say hello to your new colleague sitting next to you. Together, you'll be the core members of our new SRE team! Your job will be to make our Memebook application more resilient. To do this, let's first learn a bit more about Memebook.

## I can haz appz?

Memebook might seem like an ordinary guestbook application, but it's way better! Memebook takes guest entries, translates them into *lolcat* using the `lolcat` service and overlays the text onto a photo of a dog that has been obtained by the `doggo` service. The modified entry is then stored in `redis`.

<img src="https://raw.githubusercontent.com/jyee/memebook/master/architecture.png" style="max-width:100%; height:auto;" alt="The memebook app architcture"/>

All of the services are running in [Kubernetes](https://kubernetes.io) and the application code is available on [Github](https://github.com/jyee/memebook).

## Ready, steady, GO!

Now that you've met your partner and have a basic understanding of the application, let's go!
