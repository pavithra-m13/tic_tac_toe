# Use Node.js base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy dependencies files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the full source code
COPY . .

# Expose port 3000 (used by React dev server)
EXPOSE 3000

# Start the React development server
CMD ["npm", "start"]
