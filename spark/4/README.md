Jupyter Notebook

```python
from pyspark.sql import SparkSession
#Create Session
spark = SparkSession.builder.master("spark://spark:7077").getOrCreate()

rdd = spark.sparkContext.parallelize(range(1000 + 1))
rdd.sum()
```
