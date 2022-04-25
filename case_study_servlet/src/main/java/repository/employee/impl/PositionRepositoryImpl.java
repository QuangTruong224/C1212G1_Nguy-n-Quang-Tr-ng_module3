package repository.employee.impl;

import model.customer.CustomerType;
import model.employee.Position;
import repository.conection.BaseCustomerRepository;
import repository.employee.PositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements PositionRepository {
    BaseCustomerRepository baseCustomerRepository=new BaseCustomerRepository();
    private static final String SELECT_ALL_POSITION = "select * from vi_tri";
    @Override
    public List<Position> selectAll() {
        List<Position> positionList = new ArrayList<>();
        try (PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_POSITION);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                Integer idPosition = resultSet.getInt("ma_vi_tri");
                String namePosition = resultSet.getString("ten_vi_tri");
                positionList.add(new Position(idPosition, namePosition));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return positionList;
    }
}
