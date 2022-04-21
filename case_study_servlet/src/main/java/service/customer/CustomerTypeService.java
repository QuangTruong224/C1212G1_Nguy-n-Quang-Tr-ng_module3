package service.customer;

import model.customer.CustomerType;

import java.util.List;

public interface CustomerTypeService {
    List<CustomerType> selectAll();
}
