# Web Automation using Playwright-Robot Framework

## Overview
This project is an UI automation framework developed using Playwright-robot-framework.


## Prerequisites
- **Python 3.9 or higher**
- **Node**
- **IDE:** Visual Studio Code


### Install Python using Homebrew:
1. Install Homebrew if not already installed.
2. Update your `.zshrc` profile to include the Homebrew path.
3. Install Python using:
   ```sh
   brew install python
   ```
4. Set the Python home path in your `.zshrc` profile.
5. If macOS already has a built-in Python version, re-link it using:
   ```sh
   brew link --overwrite python
   ```

### Install Pip:
- Pip is included when installing Python via Homebrew.
- Verify pip3 installation:
  ```sh
  which pip3
  ```
- If the output returns `/usr/bin/pip3`, it means the system Python is being used instead of Homebrew’s Python.
- To fix this, explicitly set the correct path:
  ```sh
  alias pip="/opt/homebrew/bin/pip3"
  echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  ```

### Creating a Virtual Environment:
1. Navigate to the project directory.
2. Create a virtual environment using:
   ```sh
   python3 -m venv robot-env
   ```
3. Activate the virtual environment:
   ```sh
   source robot-env/bin/activate
   ```

### Install Dependencies:
```sh
pip install robotframework
pip install robotframework-browser
rfbrowser init
```

### Configure Python in VS Code:
1. Install the following VS Code extensions:
   - [Robot Framework Language Server](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)
   - [Robot Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)
2. Open VS Code settings and search for `Python`.
3. In the `Python: Default Interpreter Path`, set the Python path from the virtual environment:
   ```sh
   Documents/Globe/ui-testing/.venv/bin/python3
   ```
4. Open the terminal in VS Code and verify the installation:
   ```sh
   robot --version
   ```
   Expected output:
   ```sh
   Robot Framework 7.2.2 (Python 3.13.2 on darwin)
   ```
---

## Project Structure
```
project-root/
│   ├── Helper/
│   │   ├── TestDataHelper.py/                # For generating test data using faker
│   |── Pages/                                # POM Pattern - contains page level methods
│   │   ├── LoginPage.robot/                  # Login page related locators and methods
│   │   ├── RegisterPage.robot/               # Register page related locators and methods 
│   |── Tests/  
│   │   ├── E2ETests.robot/                   # E2E Tests
│   |── Utils/
│   │   ├── ElementUtils.robot/               # Element level helper methods
```
---

## Running Tests
```sh
robot -v BROWSER:chromium -v URL:https://parabank.parasoft.com/parabank/register.htm Tests/E2ETests.robot
```

## To generate allure report
```sh
python -m robot --listener allure_robotframework:output/allure-reports  -v BROWSER:chromium -v URL:https://parabank.parasoft.com/parabank/register.htm --outputdir output/results  Tests/E2ETests.robot
```