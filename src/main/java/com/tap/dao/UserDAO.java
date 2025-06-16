package com.tap.dao;

import java.util.List;
import com.tap.model.User;

public interface UserDAO {
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(int userid);
	User getUserById(int userid);
	User getUserByEmailId(String emailid);
	User getUserByEmailAndPassword(String email, String password);  // ✅ Add this line
	List<User> getAllUsers();
	
}