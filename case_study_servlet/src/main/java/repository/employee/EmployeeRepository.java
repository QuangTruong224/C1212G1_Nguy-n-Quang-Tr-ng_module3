package repository.employee;

import model.employee.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepository {
    public void insertEmployee(Employee employee) throws SQLException;
    public Employee selectEmployee(int id);
    public List<Employee> selectAllEmployee();
    public void update(Employee employee);
    public void delete(int id);
}
