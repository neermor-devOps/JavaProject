FROM openjdk:21-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled .class file into the container at /app
COPY add.class /app

# Run the Java program
CMD ["java", "add"]