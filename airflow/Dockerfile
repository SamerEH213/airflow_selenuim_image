# Use the official Airflow image with Python 3.8
FROM apache/airflow:latest-python3.8

# Switch to root user to install packages
USER root

# Set the Airflow home directory
ARG AIRFLOW_HOME=/opt/airflow

# Add DAGs to the Airflow home directory
ADD dags /opt/airflow/dags

# Upgrade pip and install required packages
RUN pip install --upgrade pip && \
    pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org boto3

# Create a virtual environment and install selenium
RUN python3 -m venv /opt/airflow/venv && \
    /opt/airflow/venv/bin/pip install --upgrade pip && \
    /opt/airflow/venv/bin/pip install selenium

# Switch back to the airflow user
USER airflow

# Set the command to activate the virtual environment when running the container

