package repository.employee.impl;

import model.employee.Employee;
import repository.conection.BaseCustomerRepository;
import repository.employee.EmployeeRepository;

import java.sql.SQLException;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    BaseCustomerRepository baseCustomerRepository = new BaseCustomerRepository();


    @Override
    public void insertEmployee(Employee employee) throws SQLException {

    }

    @Override
    public Employee selectEmployee(int id) {
        return null;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return null;
    }

    @Override
    public void update(Employee employee) {

    }

    @Override
    public void delete(int id) {

    }
}
