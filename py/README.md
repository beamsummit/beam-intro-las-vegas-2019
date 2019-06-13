
```
# Create a virtual environment[1]
virtualenv venv
. venv/bin/activate

# Install Beam. We'll add test, and gcp dependencies.
python -m pip install apache-beam[gcp,test]
```

## Running wordcount pipeline locally

```
python -m apache_beam.examples.wordcount --input ../demo_input --output demo_output
```












# 
# 



[1] see sources online like [this](https://realpython.com/python-virtual-environments-a-primer/) or search 'python virtualenv' for setup.  Dig in even more if you also need pip.  
