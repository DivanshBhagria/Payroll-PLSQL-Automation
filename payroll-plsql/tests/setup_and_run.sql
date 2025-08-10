-- Drop existing tables if needed
DROP TABLE dept CASCADE CONSTRAINTS PURGE;
DROP TABLE emp CASCADE CONSTRAINTS PURGE;
DROP TABLE leaves CASCADE CONSTRAINTS PURGE;
DROP TABLE salary CASCADE CONSTRAINTS PURGE;

-- Create schema
@../tables/dept.sql
@../tables/emp.sql
@../tables/leaves.sql
@../tables/salary.sql

-- Insert sample data
INSERT INTO emp VALUES (101);
INSERT INTO salary VALUES (1, 10000, 0, 101);
INSERT INTO leaves VALUES (1, 0, 101);
INSERT INTO dept VALUES (1, 'IT', 10000, 3, 101);
COMMIT;

-- Call the procedure for testing
BEGIN
  update_leaves_and_salary_cut(2, 101);
END;
/

-- View results
SELECT * FROM leaves;
SELECT * FROM salary;
SELECT * FROM dept;
