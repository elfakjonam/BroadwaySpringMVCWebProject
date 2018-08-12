package com.broadway.mvcproject.repository;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.broadway.mvcproject.model.EmployeeInfo;

@Repository
public class EmployeeDaoImpl  implements EmployeeInfoDao{
	
	@Resource
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void insertUpdate(EmployeeInfo employee) {
		Session session= sessionFactory.getCurrentSession();
		session.saveOrUpdate(employee);
		//session.merge(employee); update and save
		//session.save(employee); only for save
	}

	@Override
	@Transactional
	public List<EmployeeInfo> getAll() {
		Session session= sessionFactory.getCurrentSession();
		//Criteria: where, condition=Restrictions
		Criteria criteria = session.createCriteria(EmployeeInfo.class);
	
		
		List<EmployeeInfo> empList = (List<EmployeeInfo>) criteria.list();
		
		
		return empList;
	}

	@Override
	@Transactional
	public EmployeeInfo get(Long id) {
		Session session= sessionFactory.getCurrentSession();
		EmployeeInfo employee = (EmployeeInfo) session.get(EmployeeInfo.class, id);
		return employee;
	}

	@Override
	@Transactional
	public void delete(Long id) {

		Session session= sessionFactory.getCurrentSession();
		EmployeeInfo employee = (EmployeeInfo) session.get(EmployeeInfo.class, id);
		session.delete(employee);
	}

}
