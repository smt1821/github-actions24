FROM python:3.8

# Copy requirements to the container
COPY ./requirements.txt /webapp/requirements.txt

WORKDIR /webapp

# Update and install dependencies in one RUN statement, and clean up apt lists
RUN apt-get update && apt-get install -y --no-install-recommends \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of the application files
COPY webapp/* /webapp

# Set entrypoint and command for running the app
ENTRYPOINT ["python"]
CMD ["app.py"]
