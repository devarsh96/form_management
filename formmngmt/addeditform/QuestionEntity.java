package com.efive.formmngmt.addeditform;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "question_master")

public class QuestionEntity {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int qid;

	@Column
	private int formid;
	
	@Column
	private int questionid;
	
	@Column
	private String questionlabel;
	
	@Column
	private String questionname;
	
	@Column
	private String questiondesc;
	
	@Column
	private int answertypeid;
	
	@Column
	private int isansrequired;

	
	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}
	
	public int getFormid() {
		return formid;
	}


	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public String getQuestionlabel() {
		return questionlabel;
	}

	public String getQuestionname() {
		return questionname;
	}


	public int getAnswertypeid() {
		return answertypeid;
	}

	public int getIsansrequired() {
		return isansrequired;
	}

	public void setFormid(int formid) {
		this.formid = formid;
	}

	public void setQuestionlabel(String questionlabel) {
		this.questionlabel = questionlabel;
	}

	public void setQuestionname(String questionname) {
		this.questionname = questionname;
	}

	public void setAnswertypeid(int answertypeid) {
		this.answertypeid = answertypeid;
	}

	public void setIsansrequired(int isansrequired) {
		this.isansrequired = isansrequired;
	}

	public String getQuestiondesc() {
		return questiondesc;
	}

	public void setQuestiondesc(String questiondesc) {
		this.questiondesc = questiondesc;
	}
	
	
	
}
