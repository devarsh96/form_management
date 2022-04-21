package com.efive.formmngmt.formspage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.efive.formmngmt.addeditform.FormEntity;
import com.efive.formmngmt.addeditform.QuestionEntity;

@Service
public class FormsPageServiceImpl implements FormPageService{

	@Autowired
	FormPageRepository formpagerepository;
	
	@Override
	public List<FormEntity> getAllforms() {
		
		return formpagerepository.findAllWithoutdel();
	}

	@Override
	public FormEntity getAllformdata(Integer id) {
		
		return formpagerepository.findById(id).get();
	}


}
