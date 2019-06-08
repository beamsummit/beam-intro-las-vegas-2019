
```
# Create a virtual environment
virtualenv venv
. venv/bin/activate

# Install Beam. We'll add test, and gcp dependencies.
python -m pip install apache-beam[gcp,test]
```

## Running wordcount pipeline locally

```
python -m apache_beam.examples.wordcount --input ../demo_input --output demo_output
```
