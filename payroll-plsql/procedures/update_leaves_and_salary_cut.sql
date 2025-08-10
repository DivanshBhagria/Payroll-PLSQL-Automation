CREATE OR REPLACE PROCEDURE update_leaves_and_salary_cut(
  p_num_leaves IN NUMBER,
  p_emp_id     IN NUMBER
) AS
  allowed_leave_balance NUMBER;
  current_taken_leaves  NUMBER;
  salary_cut_increment  NUMBER;
BEGIN
  SELECT d.allowed_leaves, NVL(l.taken_leaves, 0)
    INTO allowed_leave_balance, current_taken_leaves
    FROM dept d
    LEFT JOIN leaves l ON d.emp_id = l.emp_id
    WHERE d.emp_id = p_emp_id;

  IF p_num_leaves <= allowed_leave_balance THEN
    update_leaves(p_num_leaves, p_emp_id);
    UPDATE dept
      SET allowed_leaves = allowed_leaves - p_num_leaves
      WHERE emp_id = p_emp_id;
  ELSE
    DECLARE
      extra_leaves NUMBER := p_num_leaves - allowed_leave_balance;
    BEGIN
      salary_cut_increment := extra_leaves * 100; /* adjust factor as needed */
      UPDATE salary
        SET salary_cut = salary_cut + salary_cut_increment
        WHERE emp_id = p_emp_id;

      update_leaves(p_num_leaves, p_emp_id);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating salary_cut: ' || SQLERRM);
    END;
  END IF;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Leaves updated successfully.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END update_leaves_and_salary_cut;
/
