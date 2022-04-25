package service.employee;

import model.customer.CustomerType;
import model.employee.Position;

import java.util.List;

public interface PositionService {
    List<Position> selectAll();
}
