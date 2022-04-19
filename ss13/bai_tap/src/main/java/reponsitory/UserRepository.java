package reponsitory;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, int[] permisions);

    public void insertUpdateWithoutTransaction();

    void insertUpdateUseTransaction();

    void testUseTran();

    List<User> showAllUserStore();

    void editUserStore(int id, String name, String email, String country);

    void deleteUserStore(int id);
}
