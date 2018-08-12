package com.broadway.mvcproject.repository;

import java.util.List;

import com.broadway.mvcproject.model.EmployeeInfo;

public interface EmployeeInfoDao {
		void insertUpdate(EmployeeInfo employee);
		List<EmployeeInfo> getAll();
		EmployeeInfo get(Long id);
		void delete(Long id);
	}


