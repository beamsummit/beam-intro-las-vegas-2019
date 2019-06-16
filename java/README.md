Hello!

This is the Java section of the introductory Beam Workshop.

## Running your wordcount pipeline locally

```
cd word-count-beam   #  This directory contains the Maven project

mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCount \
     -Dexec.args="--inputFile=../../LICENSE --output=demo_output" \
     -Pdirect-runner
```

## Running your wordcount pipeline on Dataflow

```
cd word-count-beam   #  This directory contains the Maven project

# For unix
mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCount \
     -Dexec.args="--runner=DataflowRunner --project=beamberlin2019workshop \
        --gcpTempLocation=gs://beam-summit-berlin-2019/$USER/tmp/ \
        --inputFile=gs://apache-beam-samples/shakespeare/* \
        --output=gs://beam-summit-berlin-2019/$USER/counts" -Pdataflow-runner

# For windows
mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCount \
     -Dexec.args="--runner=DataflowRunner --project=beamberlin2019workshop \
        --gcpTempLocation=gs://beam-summit-berlin-2019/%USERNAME%/tmp/ \
        --inputFile=gs://apache-beam-samples/shakespeare/* \
        --output=gs://beam-summit-berlin-2019/%USERNAME%/counts" -Pdataflow-runner

# Check the results
gsutil ls gs://beam-summit-berlin-2019/$USER/
gsutil ls gs://beam-summit-berlin-2019/%USERNAME%/

gsutil cat gs://beam-summit-berlin-2019/$USER/counts*
gsutil cat gs://beam-summit-berlin-2019/%USERNAME%/counts*
```
