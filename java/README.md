Hello!

This is the Java section of the introductory Beam Workshop. In here, you can find
the procedures to run a Word Count pipeline with the Beam Java SDK.

## Running your wordcount pipeline locally

First, you can run the pipeline locally, with the DirectRunner. This will process
a file that you give to it. In this case, the License:

```
cd word-count-beam   #  This directory contains the Maven project

mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCount \
     -Dexec.args="--inputFile=../../LICENSE --output=demo_output" \
     -Pdirect-runner
```

## Running your wordcount pipeline on Cloud Dataflow

To submit your pipeline to run on Google Cloud Dataflow, you will need to have access
to the Google Cloud Project that we're using (BeamBerlin2019Workshop). You can do that 
with the code provided in the top-level README, or by asking the facilitators to
add you to the project.

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

## Running your wordcount pipeline on Apache Flink (locally)

To run your pipeline with Flink, you can use the following command:

```
mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCount \
     -Dexec.args="--runner=FlinkRunner --inputFile=pom.xml --output=counts" -Pflink-runner
```

Note that this runs on the *legacy* runner for Beam, which directly translates
Java Beam functions to Flink functions.
