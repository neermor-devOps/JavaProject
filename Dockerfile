FROM openjdk:17-jdk-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Java source file into the container
COPY add.java /app/

# Compile Java file in one step to reduce layers
RUN javac add.java

# Stage 2: Final stage (smaller image)
FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=builder /app/add.class /app/

# Run the Java program
CMD ["java", "add"]