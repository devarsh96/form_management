package com.efive.formmngmt.fillform;

import java.util.List;

import com.efive.formmngmt.addeditform.FormEntity;

public interface FillformService {

	List<FormEntity> getAllformdetails();
	
	FillFormEntity saveanswerdt(FillFormEntity fillformentity);
	
	
}
