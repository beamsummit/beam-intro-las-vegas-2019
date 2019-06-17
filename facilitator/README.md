This section contains utilities for facilitators of the workshop. These 
utilities include setup, and configuration.

## Setting up the Flink Clusters

The Flink UI will be in one of the machines in your cluster that may not be 
the master. The start flink script will try to tunnel this to `localhost:8081`.

You can find the following lines towards the end of the start_flink script, and
find the host and port:

```
++ echo '-L 8099:localhost:8099 -L 8098:localhost:8098 -L 8097:localhost:8097'
+ local 'job_server_ports_forwarding=-L 8099:localhost:8099 -L 8098:localhost:8098 -L 8097:localhost:8097'
+ local 'tunnel_command=gcloud compute ssh --zone=us-central1-a --quiet yarn@flink-m -- -L 8081:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44683 -L 44603:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44603 -L 8099:localhost:8099 -L 8098:localhost:8098 -L 8097:localhost:8097 -D 1080 '
+ eval gcloud compute ssh --zone=us-central1-a --quiet yarn@flink-m -- -L 8081:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44683 -L 44603:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44603 -L 8099:localhost:8099 -L 8098:localhost:8098 -L 8097:localhost:8097 -D 1080
++ gcloud compute ssh --zone=us-central1-a --quiet yarn@flink-m -- -L 8081:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44683 -L 44603:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44603 -L 8099:localhost:8099 -L 8098:localhost:8098 -L 8097:localhost:8097 -D 1080
```

In those lines, you can find `-L 8081:flink-w-1.us-central1-a.c.beamberlin2019workshop.internal:44683`. This 
means that the UI is in `flink-w-1`, and port `44683`.

## Tips

* **Request Quota**. Remember to do it early: CPUs, IP addresses, Networks. Requests are not immediately granted.
* **Use a permissive Firewall Rule**. The project should have very few things in it, so it's safe to simply allow all ingress traffic for the workshop.
