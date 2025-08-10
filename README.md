# Payroll-PLSQL
A Payroll Management System in SQL and PL/SQL that automates salary calculation based on attendance and leave. Built a normalized schema with stored procedures and bulk net‑pay functions. Added row‑level triggers to enforce leave thresholds by issuing warnings or deducting salary.


structure of the files uploaded:
payroll-plsql/
├── tables/
│   ├── dept.sql
│   ├── emp.sql
│   ├── leaves.sql
│   └── salary.sql
│
├── procedures/
│   ├── update_leaves.sql
│   ├── update_leaves_and_salary_cut.sql
│   └── exists_leaves.sql
│
├── tests/
│   └── setup_and_run.sql
│
└── README.md


payroll_plsql-rough_code  -> this file contains rough code i was using on oracle server provided by my college to test the code above.
