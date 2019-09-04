When you run your experiments in real-world environments, it's important to keep sharing information. If your organization uses group chat tools such as Slack or Hipchat, use them to announce the start of experiments and maintain discussions. Also ensure that you're monitoring your production systems outside the scope of your tests. If other teams begin experiencing incidents, abort your testing to prevent confusion and avoid making the incidents worse.

## Take notes

Remember to take notes as you run the experiment. There are a few tools in Datadog that can help:

- You can add status updates in the [Event Stream](https://app.datadoghq.com/event/stream) and use hashtags to tag them. For example, you can enter:
  `Starting chaos experiment. Killing memebook process. #env:memebook #chaos-workshop`
  In your dashboards, you can then overlay these events using the tags `env:memebook` and `chaos-workshop`.
- [Add graphs and logs to your notebooks](https://docs.datadoghq.com/graphing/notebooks/) with independent times. By default, graphs and logs are set to use the global time set in the upper right of the page. You can set the time for graphs by clicking and dragging to select a time range on the graph. You can also set the time for graphs and log streams by clicking the clock icon for the cell, then setting the date and time range manually.
- The [annotation tool](https://www.datadoghq.com/blog/real-time-graph-annotations/) in dashboards allows you to highlight portions of a graph and make comments. If you're using a group chat tool, such as Slack or Hipchat, you can send annotations to your chat, then export the chat log as a record of your experiment.

## Afterward

When you've completed your experiments:

1. Create cards/tickets to track issues that need work.
1. Write a brief summary & key lessons.
1. **Share!**
1. **Celebrate!!**
