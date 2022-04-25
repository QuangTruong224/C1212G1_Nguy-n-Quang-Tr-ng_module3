package repository.employee.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.conection.BaseCustomerRepository;
import repository.employee.EmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    BaseCustomerRepository baseCustomerRepository = new BaseCustomerRepository();
    private static final String SELECT_ALL_EMPLOYEE = " select * from nhan_vien group by ho_ten;";

    private static final String SELECT_ALL_POSITION = "select * from vi_tri;";
    private static final String SELECT_ALL_EDUCATION_DEGREE = "select * FROM trinh_do;";
    private static final String SELECT_ALL_DIVISION = "select * from bo_phan;";
    private static final String INSERT_EMPLOYEE_SQL = "insert into nhan_vien(ho_ten , ngay_sinh , so_cmnd , luong , so_dien_thoai , email , dia_chi , ma_vi_tri , ma_trinh_do , ma_bo_phan)\n" +
            "values(?,?,?,?,?,?,?,?,?,?) ;";
    private static final String UPDATE_EMPLOYEE_SQL = " update nhan_vien set ho_ten = ? , ngay_sinh = ? , so_cmnd = ? , luong = ? , so_dien_thoai = ? , email = ? , dia_chi = ? , ma_vi_tri = ? , ma_trinh_do = ? , ma_bo_phan = ?\n" +
            "where ma_nhan_vien = ? ;";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM nhan_vien where ma_nhan_vien = ? ;";

    private static final String SEARCH_BY_NAME = "select * from nhan_vien where ho_ten like ? and dia_chi like ? and cast(ma_bo_phan as char) like ?;";
    private static final String DELETE_EMPLOYEE_SQL = "delete from nhan_vien where ma_nhan_vien = ? ; ";


    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        PreparedStatement preparedStatement=null;
        try { preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(INSERT_EMPLOYEE_SQL);

            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAdress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer employeeId = rs.getInt("ma_nhan_vien");
                String employeeName = rs.getString("ho_ten");
                String employeeBirthDay = rs.getString("ngay_sinh");
                String emplopyeeIdCard = rs.getString("so_cmnd");
                Double employeeSalary = rs.getDouble("luong");
                String employeePhone = rs.getString("so_dien_thoai");
                String employeeEmail = rs.getString("email");
                String employeeAdress = rs.getString("dia_chi");
                Integer positionId = rs.getInt("ma_vi_tri");
                Integer educationDegreeId = rs.getInt("ma_trinh_do");
                Integer divisionId = rs.getInt("ma_bo_phan");

                employee = new Employee(employeeId, employeeName, employeeBirthDay, emplopyeeIdCard, employeeSalary, employeePhone
                        , employeeEmail, employeeAdress, positionId, educationDegreeId, divisionId);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        PreparedStatement preparedStatement=null;
//
//    private Integer employeeId;
//    private String employeeName;
//    private String employeeBirthday;
//    private String employeeIdCard;
//    private Double employeeSalary;
//    private String employeePhone;
//    private String employeeEmail;
//    private String employeeAdress;
//    private Integer positionId;
//    private  Integer educationDegreeId;
//    private Integer divisionId;
        List<Employee> employeeList = new ArrayList<>();
        try { preparedStatement =
                     this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_EMPLOYEE);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer employeeId = rs.getInt("ma_nhan_vien");
                String employeeName = rs.getString("ho_ten");
                String employeeBirthDay = rs.getString("ngay_sinh");
                String employeeIdCard = rs.getString("so_cmnd");
                Double employeeSalary = rs.getDouble("luong");
                String employeePhone = rs.getString("so_dien_thoai");
                String employeeEmail = rs.getString("email");
                String employeeAdress = rs.getString("dia_chi");
                Integer positionId = rs.getInt("ma_vi_tri");
                Integer educationDegreeId = rs.getInt("ma_trinh_do");
                Integer divisionId = rs.getInt("ma_bo_phan");

                employeeList.add(new Employee(employeeId, employeeName, employeeBirthDay, employeeIdCard, employeeSalary, employeePhone
                        , employeeEmail, employeeAdress, positionId, educationDegreeId, divisionId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeList;
    }

    @Override
    public List<Position> getAllPosition() {
        PreparedStatement preparedStatement=null;
        List<Position> positionList = new ArrayList<>();
        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_POSITION);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer positionId = rs.getInt("ma_vi_tri");
                String positionName = rs.getString("ten_vi_tri");
                positionList.add(new Position(positionId, positionName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return positionList;
    }

    @Override
    public List<EducationDegree> getAllEducationDegree() {
        PreparedStatement preparedStatement=null;
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_EDUCATION_DEGREE);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer educationDegreeId = rs.getInt("ma_trinh_do");
                String educationDegreeName = rs.getString("ten_trinh_do");
                educationDegreeList.add(new EducationDegree(educationDegreeId, educationDegreeName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return educationDegreeList;
    }

    @Override
    public List<Division> getAllDivision() {
        PreparedStatement preparedStatement=null;
        List<Division> divisionList = new ArrayList<>();
        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_DIVISION);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer divisionId = rs.getInt("ma_bo_phan");
                String divisionName = rs.getString("ten_bo_phan");
                divisionList.add(new Division(divisionId, divisionName));
            }


        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return divisionList;
    }

    @Override
    public boolean update(Employee employee) throws SQLException {

        boolean rowUpdated;
        try (
             PreparedStatement statement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            statement.setString(1, employee.getEmployeeName());
            statement.setString(2, employee.getEmployeeBirthday());
            statement.setString(3, employee.getEmployeeIdCard());
            statement.setDouble(4, employee.getEmployeeSalary());
            statement.setString(5, employee.getEmployeePhone());
            statement.setString(6, employee.getEmployeeEmail());
            statement.setString(7, employee.getEmployeeAdress());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegreeId());
            statement.setInt(10, employee.getDivisionId());
            statement.setInt(11, employee.getEmployeeId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    @Override
    public void delete(int id) {
         try (PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(DELETE_EMPLOYEE_SQL)) {
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

//    @Override
//    public List<Employee> searchEmployeeByName(String searchName) {
//        List<Employee> employeeList = new ArrayList<>();
//        try (
//                PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SEARCH_BY_NAME);) {
//            preparedStatement.setString(1, '%' + searchName + '%');
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                Integer employeeId = rs.getInt("ma_nhan_vien");
//                String name = rs.getString("ho_ten");
//                String birthday = rs.getString("ngay_sinh");
//                String idCardNumber = rs.getString("so_cmnd");
//                Double salary = Double.valueOf(rs.getString("luong"));
//                String phone = rs.getString("so_dien_thoai");
//                String email = rs.getString("email");
//                String address = rs.getString("dia_chi");
//                Integer positionId = Integer.valueOf(rs.getString("ma_vi_tri"));
//                Integer educationDegree = Integer.valueOf(rs.getString("ma_trinh_do"));
//                Integer divisionId = Integer.valueOf(rs.getString("ma_bo_phan"));
//                employeeList.add(new Employee(employeeId, name, birthday, idCardNumber, salary, phone, email, address, positionId, educationDegree, divisionId));
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return employeeList;
//    }

    @Override
    public List<Employee> searchEmployee(String searchName, String searchAdress, String searchDivision) {
        List<Employee> employeeList = new ArrayList<>();

        try (
             PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SEARCH_BY_NAME);) {
            preparedStatement.setString(1, "%" + searchName + "%");
            preparedStatement.setString(2, "%" + searchAdress + "%");
            preparedStatement.setString(3,  "%" + searchDivision + "%" );
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer employeeId = rs.getInt("ma_nhan_vien");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCardNumber = rs.getString("so_cmnd");
                Double salary = Double.valueOf(rs.getString("luong"));
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer positionId = Integer.valueOf(rs.getString("ma_vi_tri"));
                Integer educationDegree = Integer.valueOf(rs.getString("ma_trinh_do"));
                Integer divisionId = Integer.valueOf(rs.getString("ma_bo_phan"));

                employeeList.add(new Employee(employeeId, name, birthday, idCardNumber, salary, phone, email, address, positionId, educationDegree, divisionId));

//                for (int i = 0; i < employeeList.size(); i++) {
//                    if(employeeList.get(i).getEmployeeAdress().contains(searchAdress)){
//                        employeeList.remove(i);
//                    }
//                }
//                for (int i = 0; i < employeeList.size(); i++) {
//                    if (searchDivision != null) {
//                        Integer searchDivisionNumber = Integer.valueOf(searchDivision);
//                        if (!employeeList.get(i).getDivisionId().equals(searchDivisionNumber)) {
//                            employeeList.remove(i);
//                        }
//                    }
//                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }



    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}


