# Stage 1: Build the application
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

##### Stage 1 finishes, the temporary image will be used by the following

# Stage 2: Create the runtime environment
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app /app

# Install only production dependencies
RUN npm install --only=production

# Run application
CMD ["npm", "start"]
