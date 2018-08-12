package com.broadway.mvcproject.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileStorageService {
	
	public static final String FILE_PATH = "D:\\upload\\";
	
	//Save file drive.
	public void saveFile(MultipartFile file) {
		
		try {
			file.transferTo(new File(FILE_PATH + file.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	

}
