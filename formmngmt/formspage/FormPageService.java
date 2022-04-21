package com.efive.formmngmt.formspage;

import java.util.List;

import com.efive.formmngmt.addeditform.FormEntity;
import com.efive.formmngmt.addeditform.QuestionEntity;

public interface FormPageService {

	List<FormEntity> getAllforms();
	
	FormEntity getAllformdata(Integer id);
		
}
