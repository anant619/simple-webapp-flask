# Use a newer base image.
FROM ubuntu:20.04

# Avoid prompts with apt-get.
ENV DEBIAN_FRONTEND=noninteractive

# Install python3 and pip.
RUN apt-get update && apt-get install -y python3 python3-pip && apt-get clean

# Upgrade pip.
RUN python3 -m pip install --upgrade pip

# Install flask.
RUN python3 -m pip install flask

# Copy your app and set the entrypoint.
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080

