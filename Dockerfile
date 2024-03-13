# Use the official Rasa SDK image as a parent image
FROM rasa/rasa:latest

# Set the working directory in the container
WORKDIR /app

# Copy the content of your local Rasa project into the container
COPY . /app

# Give read and write permissions to the rasa user for the /app directory
USER root
RUN chmod -R a+rw /app
USER 1001

# Use the rasa train command to train a model
RUN rasa train

# Expose the port the app runs on
EXPOSE 8080
ENTRYPOINT []
# Define the command to start the server
CMD ["rasa", "run", "-p", "8080", "--enable-api", "--cors", "*"]
