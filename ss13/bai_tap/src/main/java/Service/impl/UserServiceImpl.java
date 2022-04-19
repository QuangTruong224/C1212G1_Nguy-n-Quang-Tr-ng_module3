package service.impl;

import model.User;
import reponsitory.UserRepository;
import reponsitory.impl.UserRepositoryImpl;
import service.UserService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
UserRepository userRepository =new UserRepositoryImpl();
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
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
userRepository.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
userRepository.addUserTransaction(user,permisions);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
userRepository.insertUpdateUseTransaction();
    }

    @Override
    public void testUseTran() {
userRepository.testUseTran();
    }

    @Override
    public List<User> showAllUserStore() {
        return userRepository.showAllUserStore();
    }

    @Override
    public void editUserStore(int id, String name, String email, String country) {
userRepository.editUserStore(id,name,email,country);
    }

    @Override
    public void deleteUserStore(int id) {
userRepository.deleteUserStore(id);
    }
}