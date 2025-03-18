# Sauce Demo Automated Testing with Robot Framework

### Project Overview
This project leverages **Robot Framework** for automated testing of the **Sauce Demo**. 

Sauce Demo is a simple e-commerce website used to simulate online shopping processes. The automated tests include **login**, **adding items to the cart**, and **placing an order**.

The goal of this project is to ensure the core functionalities of the application work as expected and handle potential issues automatically.

### Tested Features:
1. **Login**

   * Test login functionality with valid and invalid credentials
   * Verify if the user is able to log in and is redirected to the product page

2. **Add Items to Cart**

   * Test adding items to the shopping cart
   * Verify that items are added correctly and the cart is updated

3. **Order Placement**

   * Test the checkout process by adding products to the cart and completing the order
   * Ensure the order confirmation page appears with the correct details

4. **E2E Test**

   * Test the whole process by login,adding items, order and payment
   * Ensure E2E flow works correctly 

   
### Setup & Requirements
This project uses Robot Framework with Selenium for end-to-end testing.

1. **Setup Virtual Environment**

   * This script sets up the virtual environment, installs the necessary Python dependencies from requirements.txt, and activates the virtual environment
   * To run the script
     * Make the script executable : `chmod +x setup_venv.sh`
     * Source the script to activate venv : `. ./setup_env.sh`
2. **Activate the Virtual Environment**

   * This script checks if the virtual environment exists and activates it. If it doesn't exist, it prompts you to run `setup_venv.sh` first
   * To run the script
      * Make the script executable : `chmod +x activate_venv.sh`
      * Source the script to activate venv : `. ./activate_venv.sh`

3. **Run Tests**

   * This script is used to run the automated tests for all core functionalities: login, add to cart, order placement and an e2e test
   * To run the script
     * Make the script executable : `chmod +x run_tests.sh`
     * Run the script : `. ./run_tests.sh`


### Testing Details

**Login Tests**

* Verify if the user can successfully log in using valid credentials (standard_user / secret_sauce).
* Check for proper error messages on invalid login attempts (e.g., invalid username or password).

**Add to Cart Tests**

* Verify that adding products to the cart updates the cart count and reflects the items added.
* Check that each product can be added successfully to the cart.

**Order Tests**

* Ensure that the checkout process works correctly with the items added to the cart.
* Verify the order confirmation and correct details on the order summary page.

**E2E Test**

   * Ensures thw whole process by login,adding items, order and payment works as expected

### Test Results

* Test reports, logs and screenshots will be saved in the `results/` directory.


