# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /usr/src/app/djangotest

# Copy the requirements file into the container
COPY requirements.txt /usr/src/app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app/

# Install PostgreSQL client libraries
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run manage.py runserver when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]