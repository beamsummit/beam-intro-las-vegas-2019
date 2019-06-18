Hello!

this is the Python section of the Beam Introductory Workshop.

To set up a virtual environment to install the latest Beam version, and run
your pipelines, you can do the following:

```
# Create a virtual environment
python -m virtualenv venv
. venv/bin/activate

# Install Beam. We'll add test, and GCP dependencies.
python -m pip install apache-beam[gcp,test]
```

## Running wordcount pipeline locally

```
python -m apache_beam.examples.wordcount --input ../LICENSE --output demo_output

# Check the results
ls demo_output*
cat demo_output*
```

## Running wordcount pipeline on Dataflow

To run your pipeline on Dataflow, note that the `--output` option uses an environment
variable to use a different directory for each user. If you are using Windows, set
your own username in the `--output` option.

```
python -m apache_beam.examples.wordcount --input gs://apache-beam-samples/shakespeare/* \
                                         --output gs://beam-summit-berlin-2019/$USER/counts \
                                         --runner DataflowRunner \
                                         --project beamberlin2019workshop \
                                         --temp_location gs://beam-summit-berlin-2019/$USER/tmp/

# Check the results
gsutil ls gs://beam-summit-berlin-2019/$USER/   # Unix
gsutil ls gs://beam-summit-berlin-2019/%USERNAME%/    # Windows

gsutil cat gs://beam-summit-berlin-2019/$USER/counts*   # Unix
gsutil cat gs://beam-summit-berlin-2019/%USERNAME%/counts*   # Windows
```

## Running wordcount pipeline on Apache Flink

To run your pipelines on Apache Flink, you'll need to start a local Flink instance.
To do that, you may:

```
# In another terminal
./start_flink_and_docker.sh

# This takes a while to run. Do not terminate.
```

Once your Local Flink instance is running, you can run your pipeline! Note that
the `--output` option outputs on the current directory. If you're using Windows,
use the appropriate directory, instead of `$PWD`.

*This setup is brittle. It requires sudoless docker, Java 8, and other dependencies.*

```
python -m apache_beam.examples.wordcount --input gs://apache-beam-samples/shakespeare/* \
                                         --output $PWD/counts \
                                         --experiments=beam_fn_api \
                                         --runner PortableRunner \
                                         --job_endpoint=localhost:8099 \
                                         --environment_type=DOCKER \
                                         --environment_config=gcr.io/apache-beam-testing/beam_portability/python:latest


# Check the results
ls counts*

cat counts*
```


