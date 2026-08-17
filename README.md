# Salesforce Job Application Automation System

A backend Salesforce automation solution built using Apex, SOQL, and SFDX to streamline tracking and stage management for job applications.

## Key Features
- **Trigger Handler Framework:** Implemented `before update` Apex triggers using a Handler pattern to execute stage transition logic cleanly without recursion loops.
- **Governor Limit Optimization:** Bulkified Apex code and optimized SOQL queries to comply with multi-tenant Salesforce Governor Limits.
- **Unit Test Coverage:** Authored `@isTest` unit test suites using `System.assertEquals` to validate edge cases and maintain high test coverage.

## Tech Stack
- **Platform:** Salesforce / SFDX
- **Languages:** Apex, SOQL
- **Tools:** VS Code, Salesforce CLI (`sf`)
