package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;
import com.User.UserDetails;

public class PostDAO {
	private Connection connection;

	public PostDAO(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addNotes(String title,String content,int uid) {
		boolean flag = false;
		
		try {
			String query = "insert into post(title,content,uid) values (?,?,?)";
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			//setting the vals
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, content);
			preparedStatement.setInt(3, uid);
			
			int i = preparedStatement.executeUpdate();
			
			if(i == 1) {
				flag = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	
	
	public List<Post> getData(int id){
		 List <Post> list= new ArrayList<Post>();
		 Post post = null;
		 try {
			 String query = "select * from post where uid = ? order by id desc";
			 PreparedStatement prepareStatement = connection.prepareStatement(query);
			 prepareStatement.setInt(1, id);
			 
			 ResultSet resultSet = prepareStatement.executeQuery();
			 
			 while(resultSet.next()) {
				post = new Post();
				 post.setId(resultSet.getInt(1));
				 post.setTitle(resultSet.getString(2));
				 post.setContent(resultSet.getString(3));
				 post.setPdate(resultSet.getTimestamp(4));
				 
				 list.add(post);
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
	}
//		 for(Post ele : list) {
//			 System.out.println("Post element : " + ele);
//		 }

		 return list;
	}
	
	public Post getDataById(int noteId) {
		Post post = null;
		try {
			String query = "select * from post where id = ?";
			PreparedStatement prepareStatement = connection.prepareStatement(query);
			 prepareStatement.setInt(1, noteId);
			 
ResultSet resultSet = prepareStatement.executeQuery();
			 
			 while(resultSet.next()) {
				 post = new Post();
				 post.setId(resultSet.getInt(1));
				 post.setTitle(resultSet.getString(2));
				 post.setContent(resultSet.getString(3));
				
				 
			 }
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return post;
	}
	
	
	public boolean postUpdate(int noteId,String title, String content) {
		boolean flag = false;
		
		try {
			String query = "update post set title=?, content=? where id=?";
			PreparedStatement prepareStatement = connection.prepareStatement(query);
			prepareStatement.setString(1, title);
			prepareStatement.setString(2, content);
			prepareStatement.setInt(3, noteId);
			
			int i  = prepareStatement.executeUpdate();
			
			if(i==1) {
				flag = true;
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	
	public boolean deletNotes(int noteId) {
		boolean flag = false;
		
		try {
			String query = "delete from post where id=?";
			PreparedStatement prepareStatement = connection.prepareStatement(query);
			prepareStatement.setInt(1, noteId);
			
			int i  = prepareStatement.executeUpdate();
			if(i==1) {
				flag = true;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}

}
