package com.broadway.mvcproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.broadway.mvcproject.model.EmployeeInfo;
import com.broadway.mvcproject.repository.EmployeeInfoDao;
import com.broadway.mvcproject.service.FileStorageService;

@Controller
@RequestMapping(value = "/empInfo")
public class EmployeeController {

	@Autowired
	private EmployeeInfoDao empInfoDao;

	@Autowired
	private FileStorageService fileStorageService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		formatter.setLenient(true); 
		binder.registerCustomEditor(Date.class, new CustomDateEditor(formatter, true));
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView empInfoGET(Model model) {

		ModelAndView mv = new ModelAndView("employeeForm");
		mv.addObject("employee", new EmployeeInfo());
		mv.addObject("employeeList", empInfoDao.getAll());

		return mv;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String empInfoPOST(@ModelAttribute EmployeeInfo employee) {
		saveEmployee(employee);
		return "redirect:/empInfo";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addEmpInfo(Model model) {
		model.addAttribute("employee", new EmployeeInfo());
		return "employeeFormDialog";
	}

	@RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
	public String editEmpInfo(@PathVariable("id") Long id, Model model) {
		EmployeeInfo empInfo = empInfoDao.get(id);
		model.addAttribute("employee", empInfo);
		return "employeeFormDialog";
	}
	@RequestMapping(value = "{id}/delete", method = RequestMethod.GET)
	public String deleteEmpInfo(@PathVariable("id") Long id) {
		empInfoDao.delete(id);
		return "redirect:/empInfo";
	}
	
	private void saveEmployee(EmployeeInfo employee) {
		try {
			if (!employee.getFile().isEmpty()) {
				employee.setImageName(URLEncoder.encode(employee.getFile().getOriginalFilename(), "UTF-8"));
				// Save file in drive
				fileStorageService.saveFile(employee.getFile());
			}

			// Save data in db.
			empInfoDao.insertUpdate(employee);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
