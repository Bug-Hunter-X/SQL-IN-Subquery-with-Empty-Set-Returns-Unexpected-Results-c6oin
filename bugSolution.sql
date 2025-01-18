The `IN` operator can be problematic when dealing with subqueries that might return empty result sets. A safer alternative is to use `EXISTS` which checks for the existence of rows in the subquery.  Here's how you'd rewrite the query:

```sql
-- Original buggy query
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE location = 'London');

-- Corrected query using EXISTS
SELECT * FROM employees WHERE EXISTS (SELECT 1 FROM departments WHERE departments.id = employees.department_id AND departments.location = 'London');

-- Another approach using LEFT JOIN:
SELECT e.* FROM employees e LEFT JOIN departments d ON e.department_id = d.id AND d.location = 'London' WHERE d.id IS NOT NULL; 
```
The `EXISTS` approach is generally preferred for its efficiency, while the `LEFT JOIN` approach is more readable for some.
Both alternatives avoid the unexpected behavior caused by an empty subquery in the `IN` clause.