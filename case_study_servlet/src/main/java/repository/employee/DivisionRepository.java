package repository.employee;

import model.employee.Division;
import model.employee.Position;

import java.util.List;

public interface DivisionRepository {
    List<Division> selectAll();
}
