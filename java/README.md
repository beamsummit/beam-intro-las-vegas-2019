

## Running your wordcount pipeline locally

```
mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCount \
     -Dexec.args="--inputFile=../demo_input --output=demo_output" -Pdirect-runner
```
