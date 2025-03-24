🚀 Node.js Docker Application
This repository contains a simple Node.js application containerized using Docker. The application is a basic Express server that responds with "Hello, World!". A CI/CD pipeline using GitHub Actions automates the build, test, and deployment process.

📑 Table of Contents
📌 Prerequisites
⚙️ Getting Started
▶️ Running the Application
🚀 CI/CD Pipeline
🐳 Docker Configuration
🔐 GitHub Secrets
🤝 Contributing
📜 License
📌 Prerequisites
Ensure you have the following installed before proceeding:

Node.js (v18 or higher)
Docker & Docker Compose
Git
⚙️ Getting Started
Clone the repository and install dependencies:

git clone https://github.com/your-username/node-docker-app.git
cd node-docker-app
npm install

▶️ Running the Application
🔹 Running Locally
To run the application without Docker:

npm start

The application will be available at http://localhost:3000.

🔹 Running with Docker
To run the application using Docker Compose:

docker-compose up --build

The app will be accessible at http://localhost:3000.

🚀 CI/CD Pipeline
The CI/CD pipeline is configured using GitHub Actions and automates the following:

Build: Sets up Node.js, installs dependencies, and runs tests.

Docker: Builds the Docker image and pushes it to Docker Hub.

Deploy: Deploys the Docker image to a remote server using SSH.

🔹 Triggering the Pipeline
The pipeline is triggered on:

Push to the main branch

Pull requests targeting the main branch

🐳 Docker Configuration
Dockerfile
Defines the Docker image for the Node.js application:

# Use an official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]

docker-compose.yml
Defines the containerized application:

version: "3.8"

services:
  web:
    build: .
    ports:
      - "3000:3000"
    environment:
      - PORT=3000
    volumes:
      - .:/app
      - /app/node_modules
    restart: unless-stopped

🔐 GitHub Secrets
To use the CI/CD pipeline, set up the following GitHub Secrets in your repository:

DOCKER_USERNAME: Your Docker Hub username

DOCKER_PASSWORD: Your Docker Hub password

REMOTE_HOST: Remote server IP/hostname

REMOTE_USER: SSH username

SSH_PRIVATE_KEY: SSH key for remote server access
