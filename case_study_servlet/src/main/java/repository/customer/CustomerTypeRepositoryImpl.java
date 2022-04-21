package repository.customer;

import model.customer.CustomerType;
import repository.conection.BaseCustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements CustomerTypeRepository {
    BaseCustomerRepository baseCustomerRepository = new BaseCustomerRepository();
    private static final String SELECT_ALL_CUSTOMER_TYPE = "select * from loai_khach";

    @Override
    public List<CustomerType> selectAll() {
        List<CustomerType> customerList = new ArrayList<>();
        try (PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_CUSTOMER_TYPE);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                Integer idCustomerType = resultSet.getInt("ma_loai_khach");
                String nameCustomerType = resultSet.getString("ten_loai_khach");
                customerList.add(new CustomerType(idCustomerType, nameCustomerType));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }
}
