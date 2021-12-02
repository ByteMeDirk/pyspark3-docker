from pyspark.context import SparkContext
from pyspark.sql import SparkSession


def main():
    """
    Short and simple PySpark3 script to test the docker.
    """
    sc: SparkSession = SparkContext.getOrCreate()
    spark: SparkSession = SparkSession(sc)

    data_frame = spark.read.json("./data/mock_data.json")
    data_frame.show()


if __name__ == "__main__":
    main()
