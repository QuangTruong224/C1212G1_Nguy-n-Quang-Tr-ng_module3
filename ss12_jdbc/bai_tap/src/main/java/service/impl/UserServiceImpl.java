package service.impl;

import model.User;
import reponsitory.UserRepository;
import reponsitory.impl.UserRepositoryImpl;
import service.UserService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {

    private UserRepository userRepository=new UserRepositoryImpl();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public List<User> searchCountry(String country) {
//        List<User> users = this.selectAllUsers();
//        List<User> userResult = new ArrayList<>();
//        String userName;
//        for (User user : users) {
//            userName = user.getCountry();
//            if (userName.contains(country)) {
//                userResult.add(user);
//            }
//        }
        return userRepository.searchCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }
}
