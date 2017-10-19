# tpch-spark

TPC-H queries implemented in Spark using the DataFrames API.
Tested under Spark 2.0

### Running

Compile dbgen tool:

```
cd ./dbgen && make
```

Edit the configuration file config.sh

```
    QUERY="1"               # query to execute [1, ... 22]
    MASTER="10.0.0.9"       # ip of Spark master
    HDFS="10.0.0.4"         # ip of Hadoop master
    SCALE_FACTOR="1"        # size of the input dataset, "1" generates ~1GB of data
    NUM_PARTITIONS="100"    # number of files in which to partition the data
    EXECUTOR_MEMORY="100g"  # memory of Spark executor
    HDFS_INPUT="/dbgen"     # HDFS folder where to store the generated data
    HDFS_OUTPUT=""          # HDFS folder where to store the query result, empty to skip storing
```

Generate the dataset with

```
./bin/gen_data.sh
```

Execute the query with

```
./bin/exec_query.sh
```

### Acknowledgements

The original repository by Savvas Savvides (savvas@purdue.edu)


### Other Implementations

1. Data generator (http://www.tpc.org/tpch/)

2. TPC-H for Hive (https://issues.apache.org/jira/browse/hive-600)

3. TPC-H for PIG (https://github.com/ssavvides/tpch-pig)
