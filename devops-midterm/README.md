# DevOps Pipeline Project

A simple demonstration of a complete DevOps pipeline using local resources, without Docker or cloud platforms.

## Project Overview

This project implements a basic Flask web application with a complete DevOps pipeline including:

- Version control with Git
- Continuous Integration with GitHub Actions
- Infrastructure as Code using Ansible
- Continuous Deployment with a simple Blue-Green deployment strategy
- Basic monitoring and health checks

## Tools and Technologies

- **Application**: Flask (Python)
- **Version Control**: Git and GitHub
- **CI/CD Pipeline**: GitHub Actions
- **Infrastructure as Code**: Ansible
- **Monitoring**: Simple bash script for health checks

## CI/CD Pipeline Explanation

The CI/CD pipeline consists of the following stages:

1. **Continuous Integration**:

   - Tests are automatically run on code push to main or dev branches
   - Linting checks ensure code quality
   - All tests must pass before proceeding

2. **Continuous Deployment**:

   - The `deploy.sh` script handles deployment
   - Implements a simple Blue-Green deployment strategy
   - Includes automatic backup for rollback capability

3. **Infrastructure as Code**:
   - Ansible playbooks automate environment setup
   - Environment configuration is versioned and reproducible
   - Separate playbooks for setup and deployment

## Deployment Workflow

![Deployment Workflow](workflow_diagram.jpg)

1. Developer pushes code to Git repository
2. GitHub Actions runs tests and linting
3. After successful CI, code is ready for deployment
4. Ansible playbooks set up the environment and deploy the application
5. Health check script monitors the application

## Installation and Setup

1. Clone the repository:

   ```
   git clone https://github.com/Anikelenjeridze/devops-midterm.git
   cd devops-midterm
   ```

2. Run the Ansible setup playbook:

   ```
   ansible-playbook -i inventory.ini setup.yml
   ```

3. Deploy the application:

   ```
   ansible-playbook -i inventory.ini deploy.yml
   ```

4. Access the application at `http://localhost:5000`

## Rollback Process

If deployment fails or introduces issues:

1. Run the rollback script:

   ```
   ./rollback.sh
   ```

2. This restores the previous version from the backup directory

## Screenshots

### Application Running

### GitHub Actions CI Pipeline

### Successful Deployment
