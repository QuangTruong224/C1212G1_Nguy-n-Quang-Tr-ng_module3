package service;

import models.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer, Customer> customerMap;

    static {
        customerMap = new HashMap<>();
        customerMap.put(1, new Customer(1, "Trường", "truong224@gmail.com", "Đà Nẵng"));
        customerMap.put(2, new Customer(2, "Hải", "hai108@gmail.com", "Huế"));
        customerMap.put(3, new Customer(3, "Hậu", "myhau248@gmail.com", "Sài gòn"));
        customerMap.put(4, new Customer(4, "Vi", "tivi225@gmail.com", "Quảng Nam"));
        customerMap.put(5, new Customer(5, "Lan", "ngoclan456@gmail.com", "Kon Tum"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customerMap.values());
    }

    @Override
    public void save(Customer customer) {
        customerMap.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerMap.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customerMap.remove(id);
    }
}
