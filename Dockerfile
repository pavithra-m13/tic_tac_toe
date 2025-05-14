# Step 1: Build the React app
FROM node:16 as build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the source code
COPY . .

# Build the React app for production
RUN npm run build

# Step 2: Serve the React app using 'serve' (static file server)
FROM node:16-slim

# Install 'serve' globally to serve the React build
RUN npm install -g serve

# Copy the build files from the build stage
COPY --from=build /app/build /app/build

# Expose the port the app will run on
EXPOSE 3000  
# Start serving the app with 'serve' on port 3000
CMD ["serve", "-s", "/app/build", "-l", "3000"]
