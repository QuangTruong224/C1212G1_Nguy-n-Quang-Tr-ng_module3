package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();
    List<User> searchCountry(String country);

    List<User> sortByName();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
