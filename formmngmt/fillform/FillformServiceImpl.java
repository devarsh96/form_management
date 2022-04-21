package com.efive.formmngmt.fillform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.efive.formmngmt.addeditform.FormEntity;
import com.efive.formmngmt.addeditform.FormRepository;

@Service
public class FillformServiceImpl implements FillformService{

	@Autowired
	private FillformRepository fillformrepository;
	
	@Autowired
	private FormRepository formrepository;

	@Override
	public List<FormEntity> getAllformdetails() {
		
		return formrepository.findAll();
	}

	@Override
	public FillFormEntity saveanswerdt(FillFormEntity fillformentity) {
	
		return fillformrepository.save(fillformentity);
	}
	
	
}
