🎧 Spotify Data Pipeline using Python, AWS, and Snowflake
🛠️ Technology Stack
Python

AWS Cloud Services

Amazon S3 (Simple Storage Service)

AWS Lambda

Amazon CloudWatch

Snowflake (Cloud Data Warehouse)

📌 Project Overview
This end-to-end data pipeline extracts music-related data from the Spotify API using Python, transforms it, and loads the clean data into Snowflake for further analysis and reporting. The architecture is fully serverless, automated, and scalable with the use of AWS services.

☁️ AWS Components
🔹 Amazon S3
Raw Storage: Stores unprocessed data extracted directly from the Spotify API.

Transformed Storage: Stores cleaned and processed data ready for analytics.

🔹 AWS Lambda
Data Extraction Function: Connects to the Spotify API and uploads raw data to an S3 bucket.

Data Transformation Function: Retrieves raw data from S3, applies transformation logic using Python, and stores the cleaned data back in S3.

🔹 Amazon CloudWatch
Used to schedule and trigger Lambda functions automatically at specified intervals.

❄️ Snowflake Integration
The transformed data in S3 is automatically ingested into Snowflake using Snowpipe, providing:

Near real-time data ingestion

Automated and continuous data loading

Seamless integration from AWS S3 to Snowflake tables for querying and analysis

📈 Outcome
This pipeline offers a robust and automated solution to ingest and process Spotify data into Snowflake. It provides a solid foundation for building advanced analytics, dashboards, and reporting based on streaming or music-related insights.

🧩 Architecture Diagram
![Spotify Data Pipeline Architecture](spotify-pipeline.webp)





