CREATE OR REPLACE FUNCTION exists_leaves(p_emp_id IN NUMBER) RETURN BOOLEAN IS
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO v_exists
    FROM leaves
    WHERE emp_id = p_emp_id;

  RETURN v_exists > 0;
EXCEPTION
  WHEN OTHERS THEN
    RETURN FALSE;
END exists_leaves;
/
