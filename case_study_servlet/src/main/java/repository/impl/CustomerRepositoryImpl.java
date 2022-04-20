package repository.impl;

import model.Customer;
import repository.BaseCustomerRepository;
import repository.CustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    BaseCustomerRepository baseCustomerRepository = new BaseCustomerRepository();

    private static final String INSERT_CUSTOMER_SQL = "insert into khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi,ma_loai_khach) values (?, ?, ?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang where ma_khach_hang =?;";
    private static final String SELECT_ALL_CUSTOMER = "select * from khach_hang;";
    private static final String DELETE_CUSTOMER_SQL = "delete from khach_hang where ma_khach_hang = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update khach_hang set ho_ten = ?,ngay_sinh= ?, gioi_tinh =?, so_cmnd=? ,so_dien_thoai=?, email=? ,dia_chi=? where ma_khach_hang = ?;";
    private static final String SEARCH_CUSTOMER_SQL = "select * from khach_hang where  like ho_ten=?;";


    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        try {
            PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement((INSERT_CUSTOMER_SQL));

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getDress());
            preparedStatement.setInt(8,customer.getIdType());


            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);

        }
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        try (
                PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_CUSTOMER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                int gender = rs.getInt("gioi_tinh");
                String card = rs.getString("so_cmnd");
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String dress = rs.getString("dia_chi");
                int idType=rs.getInt("ma_loai_khach");
                customer=new Customer(id,name,birthday,gender,card,phone,email,dress,idType);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        try (
                PreparedStatement preparedStatement =
                        this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_CUSTOMER);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                int gender = rs.getInt("gioi_tinh");
                String card = rs.getString("so_cmnd");
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String dress = rs.getString("dia_chi");
                int idType=rs.getInt("ma_loai_khach");
                customers.add(new Customer(id,name,birthday,gender,card,phone,email,dress,idType));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }

    @Override
    public List<Customer> searchName(String name1) {
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SEARCH_CUSTOMER_SQL);
            preparedStatement.setString(1, "%" + name1 + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                int gender = rs.getInt("gioi_tinh");
                String card = rs.getString("so_cmnd");
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String dress = rs.getString("dia_chi");
                int idType=rs.getInt("ma_loai_khach");
                customers.add(new Customer(id,name,birthday,gender,card,phone,email,dress,idType));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean rowDeleted;
        try (
                PreparedStatement statement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(DELETE_CUSTOMER_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
//
    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (
                PreparedStatement statement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(UPDATE_CUSTOMER_SQL);) {
//            String ho_ten String ngay_sinh
//                 String gioi_tinh String so_cmnd
//        String so_dien_thoai String email  String dia_chi;
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getBirthday());
            statement.setInt(3, customer.getGender());
            statement.setString(4, customer.getCard());
            statement.setString(5, customer.getPhone());
            statement.setString(6, customer.getEmail());
            statement.setString(7, customer.getDress());
            statement.setInt(8, customer.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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
