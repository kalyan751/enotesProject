package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.User.UserDetails;

public class UserDAO {
	private Connection connection;

	public UserDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addUser(UserDetails us) {
		
		boolean flag = false;;
		
		try {
			String query = "insert into user(name,email,password) value(?,?,?)";
			//using preparedStatement
			//storing the data in the database
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,us.getName());
			preparedStatement.setString(2,us.getEmail());
			preparedStatement.setString(3,us.getPassword());
			
			int i = preparedStatement.executeUpdate();
			
			//means data is stored
			if(i==1) {
				flag = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	public UserDetails loginUser(UserDetails userDetails) {
		
		//when I will be logging in I will need the entire data of the User from the database
		//I will store the data of the user in a UserDetails type object user
		UserDetails user = null;
		try {
			String query = "select * from user where email = ? and password = ?";
			
		
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			//at this stage I am retrieving the data of the user from the database
			preparedStatement.setString(1,userDetails.getEmail());
			preparedStatement.setString(2,userDetails.getPassword());
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			//when I am getting the result of the user from the database One by one I will stoere the details of the user in the UserDetails object user
			if(resultSet.next()) {
				user = new UserDetails();

				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setPassword(resultSet.getString("password"));
				user.setEmail(resultSet.getString("email"));
			}
		} catch (Exception e) {
			
		}
		
		return user;
	}
}
