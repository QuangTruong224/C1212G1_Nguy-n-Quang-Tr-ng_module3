package service.employee;

import model.customer.Customer;
import model.employee.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeService {
    public void insertEmployee(Employee employee) throws SQLException;
    public Employee selectEmployee(int id);
    public List<Employee> selectAllEmployee();
    public void update(Employee employee);
    public void delete(int id);
}
