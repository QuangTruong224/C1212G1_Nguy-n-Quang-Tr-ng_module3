package service.employee.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.employee.EmployeeRepository;
import repository.employee.impl.EmployeeRepositoryImpl;
import service.employee.EmployeeService;
import service.employee.Regex;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();


    @Override
    public Map<String,String> insertEmployee(Employee employee) throws SQLException {
        Map<String,String> map=new HashMap<>();
        if(employee.getEmployeeName().equals("")){
            map.put("name","Tên không đc để trống");
        }
        if(map.isEmpty()){
            employeeRepository.insertEmployee(employee);
        }if(employee.getEmployeeEmail().equals("")) {
            map.put("email","Gmail không  đc để trống");
        }
        return map;
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public List<Position> getAllPosition() {
        return employeeRepository.getAllPosition();
    }

    @Override
    public List<EducationDegree> getAllEducationDegree() {
        return employeeRepository.getAllEducationDegree();
    }

    @Override
    public List<Division> getAllDivision() {
        return employeeRepository.getAllDivision();
    }

    @Override
    public boolean update(Employee employee) throws SQLException {
        return employeeRepository.update(employee);
    }


    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }

//    @Override
//    public List<Employee> searchEmployeeByName(String searchName) {
//        return employeeRepository.searchEmployeeByName(searchName);
//    }

    @Override
    public List<Employee> searchEmployee(String searchName, String searchAddress, String searchDivision) {
        return employeeRepository.searchEmployee(searchName,searchAddress,searchDivision);
    }


}
