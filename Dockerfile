# Use Node.js base image
FROM node:16

# Create a non-root user and group
RUN groupadd -r nodegroup && useradd -r -m -g nodegroup nodeuser

# Set the working directory
WORKDIR /app

# Copy the package.json files and install dependencies as a non-root user
COPY package*.json ./
RUN npm install

# Copy the full source code
COPY . .

# Change the ownership of the /app directory to the non-root user
RUN chown -R nodeuser:nodegroup /app

# Set the non-root user for running the application
USER nodeuser

# Expose port 3000 (used by React dev server)
EXPOSE 3000

# Start the React development server
CMD ["npm", "start"]
