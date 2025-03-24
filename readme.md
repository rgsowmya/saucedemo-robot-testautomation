# Sauce Demo Automated Testing with Robot Framework

### Project Overview

Welcome to the Sauce Demo Automated Testing project! 🚀

This project leverages the power of Robot Framework to automate testing for the Sauce Demo—a fun and easy-to-use e-commerce simulation. Sauce Demo acts as a mock online shopping platform, perfect for simulating everyday shopping activities. 🛒

With Robot Framework and Selenium, we're automating the critical functionalities of the site, including:

* 🔑 Login
* 🛍️ Adding Items to Cart
* 📝 Order Placement


### 🚀 Tested Features & Testing Details

| **🔑 Feature**               | **🧪 Test**                                                                                                                            | **🔍 Check**                                                                  | **✅ Expected Outcome**                                                               |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| **🔐 Login**                 | Verify if the user can successfully log in using valid credentials (standard_user / secret_sauce).                                     | Ensure proper error messages are displayed on invalid login attempts (e.g., invalid username or password). | User should be redirected to the product page upon successful login.                |
| **🛒 Add Items to Cart**     | Verify that adding products to the cart updates the cart count and reflects the items added.                                           | Ensure each product can be added successfully to the cart.                      | The cart should correctly display the added products and update the cart count.      |
| **🛍️ Order Placement**      | Ensure the checkout process works correctly with the items added to the cart.                                                          | Verify the order confirmation page displays the correct details.               | After completing the checkout, the order summary page should show the correct product and payment details. |
| **🌐 End-to-End (E2E) Test** | Verify the entire process works from login to adding items to the cart, placing the order, and completing payment.                     | Ensure the full flow from login to order placement functions as expected without errors. | The end-to-end flow should work seamlessly, confirming that all core functionalities are integrated and functional. |
| **🌐 Validation Test**       | Validate login with incorrect username and/or password. | Check that an appropriate error message is displayed for invalid credentials. | Error message like "Username and password do not match" should be shown.|
   
### 🚀 Setup & Requirements

1. **🔧 Setup Virtual Environment**

   * This script sets up the virtual environment, installs the necessary Python dependencies from requirements.txt, and activates the virtual environment
   * To run the script
     * Make the script executable : `chmod +x setup_venv.sh`
     * Source the script to activate venv : `. ./setup_env.sh`
2. **🖥️ Activate the Virtual Environment**

   * This script checks if the virtual environment exists and activates it. If it doesn't exist, it prompts you to run `setup_venv.sh` first
   * To run the script
      * Make the script executable : `chmod +x activate_venv.sh`
      * Source the script to activate venv : `. ./activate_venv.sh`

3. **🏁 Run Tests**

   * This script is used to run the automated tests for all core functionalities: login, add to cart, order placement and an e2e test
   * To run the script
     * Make the script executable : `chmod +x run_tests.sh`
     * Run the script : `. ./run_tests.sh`

    

### 📊 Test Results

Once the tests are executed, all reports, logs, and screenshots are saved in the `results/` directory for easy reference.