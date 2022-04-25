package repository.employee.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import repository.conection.BaseCustomerRepository;
import repository.employee.DivisionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImpl implements DivisionRepository {
    BaseCustomerRepository baseCustomerRepository=new BaseCustomerRepository();
    private static final String SELECT_ALL_DIVISION  = "select * from bo_phan";
    @Override
    public List<Division> selectAll() {
        List<Division> divisionList = new ArrayList<>();
        try (PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_DIVISION);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                Integer idDivision = resultSet.getInt("ma_bo_phan");
                String nameDivision = resultSet.getString("ten_bo_phan");
                divisionList.add(new Division(idDivision, nameDivision));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return divisionList;
    }
}
