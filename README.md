# BestBuy Staff-Service

## Overview
The **BestBuy Staff-Service** is a microservice designed to manage staff information for internal systems. It provides a RESTful API to perform CRUD (Create, Read, Update, Delete) operations on staff data. The service is lightweight, uses in-memory storage, and is built using Node.js with Express.js.

## Functionality
The service allows:
- Adding new staff members.
- Retrieving information about all staff members or specific staff by ID.
- Updating existing staff information.
- Deleting staff records.
- Health check endpoint to ensure the service is operational.

## Endpoints

### Base URL
```
http://<host>:3000
```

### 1. **Create a Staff Member**
**Endpoint**: `/staff`
- **Method**: `POST`
- **Request Body**:
  ```json
  {
    "name": "John Doe",
    "position": "Manager",
    "department": "Sales",
    "email": "john.doe@example.com",
    "phone": "123-456-7890"
  }
  ```
- **Response**:
  ```json
  {
    "id": "<unique-id>",
    "name": "John Doe",
    "position": "Manager",
    "department": "Sales",
    "email": "john.doe@example.com",
    "phone": "123-456-7890"
  }
  ```

### 2. **Get All Staff Members**
**Endpoint**: `/staff`
- **Method**: `GET`
- **Response**:
  ```json
  [
    {
      "id": "<unique-id>",
      "name": "John Doe",
      "position": "Manager",
      "department": "Sales",
      "email": "john.doe@example.com",
      "phone": "123-456-7890"
    }
  ]
  ```

### 3. **Get a Staff Member by ID**
**Endpoint**: `/staff/:id`
- **Method**: `GET`
- **Response**:
  ```json
  {
    "id": "<unique-id>",
    "name": "John Doe",
    "position": "Manager",
    "department": "Sales",
    "email": "john.doe@example.com",
    "phone": "123-456-7890"
  }
  ```

### 4. **Update a Staff Member**
**Endpoint**: `/staff/:id`
- **Method**: `PUT`
- **Request Body**:
  ```json
  {
    "name": "Jane Doe",
    "position": "Senior Manager",
    "department": "Marketing",
    "email": "jane.doe@example.com",
    "phone": "098-765-4321"
  }
  ```
- **Response**:
  ```json
  {
    "id": "<unique-id>",
    "name": "Jane Doe",
    "position": "Senior Manager",
    "department": "Marketing",
    "email": "jane.doe@example.com",
    "phone": "098-765-4321"
  }
  ```

### 5. **Delete a Staff Member**
**Endpoint**: `/staff/:id`
- **Method**: `DELETE`
- **Response**:
  ```json
  {
    "message": "Staff member deleted successfully"
  }
  ```

### 6. **Health Check**
**Endpoint**: `/health`
- **Method**: `GET`
- **Response**:
  ```json
  {
    "status": "OK",
    "message": "Staff service is healthy"
  }
  ```

## Tasks Completed
1. Designed and implemented the RESTful API endpoints for CRUD operations.
2. Added in-memory storage for staff data.
3. Implemented input validation to ensure all fields are required.
4. Added a health check endpoint for service monitoring.
5. Dockerized the application and deployed it to Kubernetes.
6. Configured a CI/CD pipeline for automated builds, tests, and deployments.

## Technical Issues Encountered
1. **HTTP 404 for Health Probes**:
   - **Issue**: Kubernetes health probes failed due to the absence of the `/health` endpoint.
   - **Solution**: Added a `/health` endpoint to the application.

2. **Missing Dependencies in Container**:
   - **Issue**: Application failed to start because required dependencies (`express`, `body-parser`, etc.) were not installed.
   - **Solution**: Updated the `Dockerfile` to ensure dependencies are installed during the build process.

3. **CI/CD Pipeline Configuration**:
   - **Issue**: Deployment pipeline failed due to incorrect image tags.
   - **Solution**: Fixed image tagging and ensured proper secrets were configured for Docker and Kubernetes.

## How to Run the Service Locally
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd bestbuy-staff-service
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the service:
   ```bash
   node staff-service.js
   ```

4. Access the service at:
   ```bash
   http://localhost:3000
   ```

## How to Build and Deploy
1. Build the Docker image:
   ```bash
   docker build -t dhruv766/staff-service:final .
   ```

2. Push the image to Docker Hub:
   ```bash
   docker push dhruv766/staff-service:final
   ```

3. Deploy to Kubernetes:
   ```bash
   kubectl apply -f staff-service.yaml
   ```

4. Verify the deployment:
   ```bash
   kubectl get pods
   kubectl get svc
   ```

