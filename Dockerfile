# Use an official Node.js image with version 18 as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Clone your remote repository into the container
RUN git clone https://github.com/MuhammadAli68/NodePostgreExample.git

# Ser the working directory inside the container
WORKDIR /app/NodePostgreExample

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD [ "node", "app.js" ]