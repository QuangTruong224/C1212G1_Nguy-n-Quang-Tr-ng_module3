package service.employee;

import model.customer.CustomerType;
import model.employee.EducationDegree;

import java.util.List;

public interface EducationDegreeService {
    List<EducationDegree> selectAll();
}
