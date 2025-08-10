# Payroll-PLSQL-Automation

A complete Payroll Management System implemented in SQL and PL/SQL that automates salary calculations based on attendance and leave. It features a normalized schema, modular procedures, and logic to enforce leave limits—issuing warnings or applying salary deductions as necessary.

---

##  Project Structure

```plaintext
payroll-plsql/
├── tables/
│   ├── dept.sql                // Department schema
│   ├── emp.sql                 // Employee table
│   ├── leaves.sql              // Leave tracking table
│   └── salary.sql              // Salary and cut tracking table
├── procedures/
│   ├── update_leaves.sql
│   ├── update_leaves_and_salary_cut.sql
│   └── exists_leaves.sql       // Helper function
├── tests/
│   └── setup_and_run.sql       // Schema setup and test run
├── payroll_plsql-rough_code.txt              // Early ad-hoc scripts used during development
└── README.md                   // This documentation

The payroll_plsql-rough_code.txt file contains early-stage scripts used during testing on the college's Oracle server, offering insight into iterative development.

Motivation
Manual handling of leave and payroll is error-prone and tedious. This project automates leave validation, leave updates, and conditional salary deductions through reusable PL/SQL procedures—designed for maintainability and seamless integration into enterprise systems.

Quick Setup & Usage
Run all .sql files under the tables/ directory to initialize the database schema.

Load the stored procedures under the procedures/ directory.

Execute tests/setup_and_run.sql to insert sample data and test the functionality.

Inspect the leaves, salary, and dept tables to verify the outputs.

Features
Modular Design: Clean separation of schemas and logic using PLSQL procedures.

Smart Payroll Logic: Automatically deducts salary based on leave threshold enforcement.

Easy Testing: Includes a setup_and_run.sql file for quick local validation.
