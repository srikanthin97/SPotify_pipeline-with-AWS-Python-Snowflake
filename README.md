Spotify Data Pipeline using Python, AWS, and Snowflake

Technology Stack:

Python

AWS Cloud (S3, CloudWatch, AWS Lambda)

Snowflake

Overview:

This data pipeline project leverages Python to extract music data from the Spotify API. The retrieved data, initially in dictionary format, is cleaned and transformed using Python-based logic before being stored and further processed.

AWS Cloud Components:

Amazon S3: Acts as the central storage layer. Raw data pulled from the Spotify API is first stored in an S3 bucket using an AWS Lambda function. After transformation, the cleaned data is also saved in a separate S3 location.

AWS CloudWatch: Serves as a scheduler to automatically trigger the Lambda functions based on predefined intervals.

AWS Lambda: Two Lambda functions are used:

One function extracts data from the Spotify API and saves it to the raw data bucket in S3.

The other performs data transformation and stores the output in a transformed data bucket in S3.

Snowflake Integration:

Transformed data stored in S3 is loaded into Snowflake using Snowpipe, which facilitates automated, continuous data ingestion from the S3 bucket to designated Snowflake tables.

