package com.broadway.mvcproject.repository;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.broadway.mvcproject.model.User;


@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private DataSource dataSource;

	@Override
	public boolean validateUser(User user) {
		
		try {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			//SELECT username FROM USER WHERE username='manoj' AND PASSWORD='manoj123'
			String query = "SELECT username FROM USER WHERE username='"+user.getUsername()
			+"' and password='" +user.getPassword() +"'";
			System.out.println(query);
			String dbUsername = jdbcTemplate.queryForObject(query, String.class);
			if(dbUsername!=null) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
