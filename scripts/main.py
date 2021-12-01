from pyspark.context import SparkContext
from pyspark.sql import SparkSession, DataFrame


def main():
    """
    Short and simple PySpark3 script to test the docker.
    """
    sc: SparkSession = SparkContext.getOrCreate()
    spark: SparkSession = SparkSession(sc)

    mock_data_values: list = [(4454, "Alex", 28), (8776, "Lee", 29)]
    mock_data_columns: list = ["id", "name", "age"]
    data_frame: DataFrame = spark.createDataFrame(mock_data_values, mock_data_columns)
    data_frame.show()


if __name__ == "__main__":
    main()
