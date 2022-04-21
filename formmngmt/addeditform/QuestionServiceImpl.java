package com.efive.formmngmt.addeditform;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionRepository questionRepository;

	@Override
	public QuestionEntity savequesdetail(QuestionEntity questionentity) {
		
		return questionRepository.save(questionentity);
	}
	
	
}
