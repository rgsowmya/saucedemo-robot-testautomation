#!/bin/bash

# Run robotidy
robotidy suites

# Run login tests
robot --output results/login_output.xml --log results/login_log.html --report results/login_report.html suites/login.robot

# Run cart tests
robot --output results/cart_output.xml --log results/cart_log.html --report results/cart_report.html suites/cart.robot

# Run order tests
robot --output results/order_output.xml --log results/order_log.html --report results/order_report.html suites/order.robot

# Run e2e test
robot --output results/e2e_output.xml --log results/e2e_log.html --report results/e2e_report.html suites/e2e_test.robot

# Run validations test
robot --output results/validations_output.xml --log results/validations_log.html --report results/validations_report.html suites/validations.robot
