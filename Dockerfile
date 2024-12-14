# Use a more recent node LTS version
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
