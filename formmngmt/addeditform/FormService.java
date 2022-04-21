package com.efive.formmngmt.addeditform;

import java.util.List;

public interface FormService {
	
	FormEntity saveformdetails(FormEntity formentity);
	
	void deletebyId(Integer id);
	
}
