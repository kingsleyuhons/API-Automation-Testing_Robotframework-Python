# API Automated Testing with Robot Framework

## Overview
This project contains automated API test cases using the Robot Framework with the RequestsLibrary. The tests cover various API functionalities, including authentication, CRUD operations, and response validation.

## Features
- **Automated API testing** using Robot Framework and RequestsLibrary
- **Validation of API responses, status codes, and data integrity**
- **Data-driven testing support**
- **Custom keywords for reusable test logic**
- **Structured test reports and logs**

## Technologies Used
- Robot Framework
- RequestsLibrary
- Python
- Git & GitHub

## Installation
To set up and run the test suite locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kingsleyuhons/API-Automation-Testing_Robotframework-Python.git
   cd API-Automation-Testing_Robotframework-Python
   ```
2. **Create a virtual environment (optional but recommended):**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```
3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```
4. **Run the API tests:**
   ```bash
   robot -d results tests/
   ```

## Test Cases Implemented
- Authentication (Login & Logout)
- GET, POST, PUT, DELETE API requests
- Response status code and body validation
- Error handling and edge case testing

## Running Tests
To execute tests with environment variables:
```bash
robot --variable ENV:staging -d results tests/
```
For detailed logs and reports:
```bash
robot --loglevel DEBUG -d results tests/
```

## Contribution
Feel free to fork the repository and submit pull requests. Any improvements and additional test cases are welcome!

## License
This project is licensed under the MIT License.

## Author
Kingsley Uhonmhoibhi  
[GitHub Profile](https://github.com/kingsleyuhons)
