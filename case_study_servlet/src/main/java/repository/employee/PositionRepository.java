package repository.employee;

import model.customer.CustomerType;
import model.employee.Position;

import java.util.List;

public interface PositionRepository {
    List<Position> selectAll();
}
