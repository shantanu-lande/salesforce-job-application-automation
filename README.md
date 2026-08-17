# Salesforce Job Application Automation System

A backend Salesforce application designed to automate stage transitions, update interaction logs, and streamline job application tracking using Apex, SOQL, and the Salesforce DX (SFDX) framework.

## 📌 Project Overview
Managing job application workflows manually can lead to delayed updates and inconsistent tracking data. This project implements a backend automation engine in Salesforce that automatically detects status changes, updates activity timestamps, and prevents infinite execution loops using structured Apex design patterns.

## ⚡ Key Features
- **Trigger Handler Pattern:** Separates execution logic from the trigger context to ensure scalable, maintainable, and recursion-safe execution.
- **Bulkification & Governor Limit Safety:** Built to handle bulk operations (up to 200+ records) while keeping SOQL queries strictly within Salesforce Governor Limits.
- **Automated Field Updates:** Automatically updates tracking attributes like `Last_Interaction_Date__c` upon status transitions.
- **Comprehensive Testing:** Includes an `@isTest` unit testing suite with rigorous assertions to ensure high code coverage and reliability.

## 🛠️ Tech Stack & Tools
- **Platform:** Salesforce / Salesforce DX (SFDX)
- **Languages:** Apex, SOQL
- **Developer Tools:** Visual Studio Code, Salesforce CLI
