Hello!

this is the Python section of the Beam Introductory Workshop.

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
```

## Running wordcount pipeline on Dataflow

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

```
python -m apache_beam.examples.wordcount --input gs://apache-beam-samples/shakespeare/* \
                                         --output gs://beam-summit-berlin-2019/$USER/counts \
                                         --experiments=beam_fn_api \
                                         --runner PortableRunner \
                                         --job_endpoint=localhost:8099 \
                                         --experiments=worker_threads=100 \
                                         --execution_mode_for_batch=BATCH_FORCED
```


