package reponsitory.impl;

import model.User;
import reponsitory.BaseReponsitory;
import reponsitory.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    private BaseReponsitory baseRepository = new BaseReponsitory();

    private static final String INSERT_USERS_SQL = "insert into users (name, email, country) values (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select * from users where id =?;";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SEARCH_USERS_SQL = "select * from users where country like ?;";
    private static final String SORTBYNAME_USERS_SQL = "select *  from users order by name;";




    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (
             PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement((INSERT_USERS_SQL))) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);

        }
    }

    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }


    @Override
    public List<User> searchCountry(String country1) {
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement(SEARCH_USERS_SQL);
            preparedStatement.setString(1, "%" + country1 + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));

            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }


    public List<User> selectAllUsers() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (
             PreparedStatement preparedStatement =
                     this.baseRepository.getConnectionJavaToDB().prepareStatement(SELECT_ALL_USERS);)
        {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        List<User> users = new ArrayList<>();
        try (
             PreparedStatement preparedStatement =
                     this.baseRepository.getConnectionJavaToDB().prepareStatement(SORTBYNAME_USERS_SQL);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (
             PreparedStatement statement = this.baseRepository.getConnectionJavaToDB().prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (
             PreparedStatement statement = this.baseRepository.getConnectionJavaToDB().prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
