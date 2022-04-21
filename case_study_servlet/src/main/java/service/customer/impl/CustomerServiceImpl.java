package service.customer.impl;

import model.customer.Customer;
import repository.customer.CustomerRepository;
import repository.customer.CustomerRepositoryImpl;
import service.customer.CustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();


    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        this.customerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return this.customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return this.customerRepository.selectAllCustomer();
    }

    @Override
    public void update(Customer customer) {
        this.customerRepository.update(customer);
    }

    @Override
    public void delete(int id) {
        this.customerRepository.delete(id);
    }
}

