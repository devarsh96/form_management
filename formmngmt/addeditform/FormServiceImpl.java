package com.efive.formmngmt.addeditform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FormServiceImpl implements FormService{
	
	@Autowired
	private FormRepository formrepository;
	
	@Override
	public FormEntity saveformdetails(FormEntity formentity) {
 
		return formrepository.save(formentity);
	}

	@Override
	public void deletebyId(Integer id) {
		 
		formrepository.softDeleteId(id);	
	}


}
