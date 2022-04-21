package com.efive.formmngmt.addeditform;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "option_master")
public class OptionEntity {
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int optionid;
	
	@Column
	private int formid;

	@Column
	private int oid;
		
	@Column
	private String options;
	
	@Column
	private int questionid;

	public int getOptionid() {
		return optionid;
	}

	public int getFormid() {
		return formid;
	}

	public String getOptions() {
		return options;
	}

	public int getQuestionid() {
		return questionid;
	}

	public void setOptionid(int optionid) {
		this.optionid = optionid;
	}

	public void setFormid(int formid) {
		this.formid = formid;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}
	
	
	
}
