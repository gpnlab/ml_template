.PHONY: all clean test

IRIS_URL = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"

all: reports/figures/exploratory.png models/random_forest.model

clean:
	rm -f data/raw/*.csv
	rm -f data/processed/*.pickle
	rm -f data/processed/*.xlsx
	rm -f reports/figures/*.png
	rm -f models/*.model

# Rule for dowloading raw data
data/raw/iris.csv:
	python src/data/download.py  $(IRIS_URL) $@

# Rule for testing
test: all
	pytest src
