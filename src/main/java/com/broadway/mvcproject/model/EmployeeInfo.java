package com.broadway.mvcproject.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
@Entity
@Table(name="employee")

public class EmployeeInfo {
	@Id
	@GeneratedValue
	
	@Column(name="Emp_Id")
	private Long id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="mid_name")
	private String midName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="date_of_birth")
	private Date birthDate;
	
	@Column(name="contact_No")
	private String contactNo;
	
	@Column(name="Email")
	private String email;
	
	@Column(name="address")
	private String address;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="designation")
	private String designation;
	
	@Column(name="department")
	private String department;
	
	@Column(name="status")
	private String status;
	
	@Column(name="contract_start_date")
	private Date contractStartDate;
	
	@Column(name="contract_end_date")
	private Date contractEndDate;
	
	@Column(name="joined_date")
	private Date joinedDate;
	
	@Column(name="image_name")
	private String imageName;
	
	@Column(name="salary")
	private Double salary;
	
	
	@Transient
	private MultipartFile file;
	
	
	

}
