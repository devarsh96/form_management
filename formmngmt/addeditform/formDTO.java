package com.efive.formmngmt.addeditform;

import java.util.List;

public class formDTO {
	
	private FormEntity addformentity;
	private List<QuestionEntity> addquestionentity;
	private List<OptionEntity> optionentity;


	public FormEntity getAddformentity() {
		return addformentity;
	}
	public void setAddformentity(FormEntity addformentity) {
		this.addformentity = addformentity;
	}
	public List<QuestionEntity> getAddquestionentity() {
		return addquestionentity;
	}
	public void setAddquestionentity(List<QuestionEntity> addquestionentity) {
		this.addquestionentity = addquestionentity;
	}
	public List<OptionEntity> getOptionentity() {
		return optionentity;
	}
	public void setOptionentity(List<OptionEntity> optionentity) {
		this.optionentity = optionentity;
	}
}
