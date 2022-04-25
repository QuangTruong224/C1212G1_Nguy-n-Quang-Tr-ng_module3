package service.employee;

import model.customer.Customer;
import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface EmployeeService {
    public Map<String,String> insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(int id);

    public List<Employee> selectAllEmployee();

    public List<Position> getAllPosition();

    public List<EducationDegree> getAllEducationDegree();

    public List<Division> getAllDivision();

    boolean update(Employee employee) throws SQLException;

    public void delete(int id);
//    List<Employee> searchEmployeeByName(String searchName);

    List<Employee> searchEmployee(String searchName, String searchAddress, String searchDivision);
}
