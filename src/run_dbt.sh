# Import the dependent external libraries
dbt deps --profiles-dir . --project-dir .

# Run all the model files
dbt run --profiles-dir . --project-dir .

# Run all inbuilt and custom test cases prepared
dbt test --profiles-dir . --project-dir .

# Generate dbt documentation files
dbt docs generate --profiles-dir . --project-dir .

# Copying dbt outputs to s3 bucket - for hosting
aws s3 cp --recursive --exclude="*" --include="*.json" --include="*.html" dbt/target/ s3://<bucketName>/REDSHIFT_POC/