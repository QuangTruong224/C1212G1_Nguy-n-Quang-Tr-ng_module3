package repository.employee.impl;

import model.employee.EducationDegree;
import model.employee.Position;
import repository.conection.BaseCustomerRepository;
import repository.employee.EducationDegreeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepositoryImpl implements EducationDegreeRepository {
    BaseCustomerRepository baseCustomerRepository=new BaseCustomerRepository();
    private static final String SELECT_ALL_EDUCATION_DEGREE  = "select * from trinh_do";
    @Override
    public List<EducationDegree> selectAll() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try (PreparedStatement preparedStatement = this.baseCustomerRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_EDUCATION_DEGREE);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                Integer idEducationDegree = resultSet.getInt("ma_trinh_do");
                String nameEducationDegree = resultSet.getString("ten_trinh_do");
                educationDegreeList.add(new EducationDegree(idEducationDegree, nameEducationDegree));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return educationDegreeList;
    }
}
