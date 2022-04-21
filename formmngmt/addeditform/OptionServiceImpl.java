package com.efive.formmngmt.addeditform;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OptionServiceImpl implements OptionService{

	@Autowired
	private OptionRepository optionRepository;

	@Override
	public OptionEntity saveoptsdetails(OptionEntity optionentity) {
		
		return optionRepository.save(optionentity);
	}
}
