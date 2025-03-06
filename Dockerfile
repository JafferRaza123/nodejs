# Use an official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies first
COPY package*.json ./
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]



