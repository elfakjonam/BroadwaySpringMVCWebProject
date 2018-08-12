package com.broadway.mvcproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.broadway.mvcproject.model.EmployeeInfo;
import com.broadway.mvcproject.repository.EmployeeInfoDao;

@RestController
@RequestMapping("/api/rest")
public class EmployeeRestController {
	
@Autowired
private EmployeeInfoDao empInfoDao;

@RequestMapping(value="/employees", method= RequestMethod.GET)

public ResponseEntity<List<EmployeeInfo>> studGetAll(){
	List<EmployeeInfo> empList = empInfoDao.getAll();
	return new ResponseEntity<>(empList, HttpStatus.OK);
	}

}

