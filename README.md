# SSO Provider and Proof of Concept Client

This project demonstrates a Single Sign-On (SSO) provider using OAuth2, built with Ruby on Rails, and includes a basic client application built with Preact. The setup is containerized using Docker

## Features
- **SSO Provider**:
  - Supports user signup and signin.
  - OAuth2 protocol implemented using the `doorkeeper` gem.
  - Authentication ensures all sessions are invalidated when a password is changed.
  - Registered applications can request login access via OAuth.
  - New applications can be registered from rails console
    - ```ruby 
      Doorkeeper::Application.create(name: 'App Name', redirect_uri: 'http://localhost:3000')
      ```
    - supports `authorization_code` grant worlflow with PKCE enforced.

- **Client Application**:
  - A minimal frontend built with Preact, served as a separate Docker service.
  - Static client files are placed under `/public/client` within the Rails application.

## Prerequisites
- Docker and Docker Compose installed.

## Setup Instructions
1. **Clone the repository**:
   ```bash
   git https://github.com/nijeesh4all/auth_server_poc
   cd auth_server_poc
   ```

2. **Build and start the services**:
   ```bash
       docker-compose up --build
   ```

3. **Seed the database**:
   Run the seed command to populate initial data, including registered applications:
   ```bash
   docker-compose exec app rails db:migrate
   docker-compose exec app rails db:seed
   ```
4. Run the application:
   ```bash
   docker-compose up -d
   ```

5. **Access the application**:
   - Rails API: `http://localhost:3000`
   - Preact client: `http://localhost:5173`

## Usage
- **Sign up and Sign in**: Use the provided API endpoints to create users and obtain OAuth tokens.
- **OAuth Authorization**: Register applications and use the SSO provider for authentication.
- **Client Functionality**: The Preact client can interact with the Rails backend to demonstrate OAuth flow.

## Testing
- The application is thoroughly tested to ensure quality and reliability.
- Run the test suite:
   ```bash
   docker-compose exec app rails rspec
   ```

## Notes
- The UI is minimal and serves only to validate the OAuth functionality.
- Efforts were made to keep the implementation simple and adhere to best practices.

## Additional Information
- Frameworks used:
  - Rails (`devise`, `doorkeeper` gems).
  - Preact for the client application.
- Code commits are incremental to demonstrate the development process clearly.
