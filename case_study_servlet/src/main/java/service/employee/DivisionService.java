package service.employee;

import model.customer.CustomerType;
import model.employee.Division;

import java.util.List;

public interface DivisionService {
    List<Division> selectAll();
}
