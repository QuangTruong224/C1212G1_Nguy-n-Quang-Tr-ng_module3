package repository.employee;

import model.employee.EducationDegree;
import model.employee.Position;

import java.util.List;

public interface EducationDegreeRepository {
    List<EducationDegree> selectAll();
}
