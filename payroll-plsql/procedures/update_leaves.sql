CREATE OR REPLACE PROCEDURE update_leaves(
  p_num_leaves IN NUMBER,
  p_emp_id     IN NUMBER
) AS
BEGIN
  UPDATE leaves
    SET taken_leaves = taken_leaves + p_num_leaves
  WHERE emp_id = p_emp_id;

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in update_leaves: ' || SQLERRM);
END update_leaves;
/
