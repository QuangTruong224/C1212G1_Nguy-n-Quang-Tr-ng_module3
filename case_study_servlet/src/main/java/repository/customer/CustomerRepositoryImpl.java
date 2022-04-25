package repository.customer;

import model.customer.Customer;
import repository.conection.BaseCustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    BaseCustomerRepository baseCustomerRepository = new BaseCustomerRepository();

    private static final String INSERT_CUSTOMER_SQL = "insert into khach_hang (ho_ten,ngay_sinh,gioi_tinh," +
            "so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang inner join loai_khach " +
            "on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach where ma_khach_hang =?";
    private static final String SELECT_ALL_CUSTOMER = "select * from khach_hang group by ho_ten;";
    private static final String UPDATE_CUSTOMER = "update khach_hang set ho_ten=?, ngay_sinh=?," +
            "gioi_tinh=?,so_cmnd=?, so_dien_thoai=?, email=?, dia_chi=?, " +
            "ma_loai_khach=? where ma_khach_hang=?;";
    private static final String DELETE_CUSTOMER_SQL = "delete from khach_hang where ma_khach_hang = ?;";

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        System.out.println(INSERT_CUSTOMER_SQL);
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(INSERT_CUSTOMER_SQL);

            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerBirthday());
            preparedStatement.setInt(3, customer.getCustomerGender());
            preparedStatement.setString(4, customer.getCustomerIdCard());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerEmail());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            System.out.println(preparedStatement);
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
    public Customer selectCustomer(int id) {
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer customerTypeId = rs.getInt("ma_loai_khach");
                String customerName = rs.getString("ho_ten");
                String customerBirthDay = rs.getString("ngay_sinh");
                Integer customerGender = Integer.valueOf(rs.getString("gioi_tinh"));
                String customerIdCard = rs.getString("so_cmnd");
                String customerPhone = rs.getString("so_dien_thoai");
                String customerEmail = rs.getString("email");
                String customerAddress = rs.getString("dia_chi");

                customer = new Customer(id, customerTypeId, customerName, customerBirthDay, customerGender,
                        customerIdCard, customerPhone, customerEmail, customerAddress);
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
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
                preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer customerId = rs.getInt("ma_khach_hang");
                Integer customerTypeId = rs.getInt("ma_loai_khach");
                String customerName = rs.getString("ho_ten");
                String customerBirthDay = rs.getString("ngay_sinh");
                Integer customerGender = Integer.valueOf(rs.getString("gioi_tinh"));
                String customerIdCard = rs.getString("so_cmnd");
                String customerPhone = rs.getString("so_dien_thoai");
                String customerEmail = rs.getString("email");
                String customerAddress = rs.getString("dia_chi");

                customers.add(new Customer(customerId, customerTypeId, customerName, customerBirthDay, customerGender,
                        customerIdCard, customerPhone, customerEmail, customerAddress));
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
        return customers;
    }

    @Override
    public void update(Customer customer) {
        System.out.println(UPDATE_CUSTOMER);
        PreparedStatement preparedStatement = null;


        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(UPDATE_CUSTOMER);

            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerBirthday());
            preparedStatement.setInt(3, customer.getCustomerGender());
            preparedStatement.setString(4, customer.getCustomerIdCard());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerEmail());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            preparedStatement.setInt(9, customer.getCustomerId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void delete(int id) {
        PreparedStatement preparedStatement=null;
        System.out.println(DELETE_CUSTOMER_SQL);
        try {
            preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(DELETE_CUSTOMER_SQL);
            preparedStatement.setInt(1,id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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
