package com.efive.formmngmt.fillform;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "answers_selected")
public class FillFormEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private int fill_formid;
	
	@Column
	private int formid;
	
	@Column
	private int questid;
	
	@Column
	private String createdby;
	
	@Column
	private Timestamp createdon;
	
	@Column
	private String answerselected;

	public int getFill_formid() {
		return fill_formid;
	}

	public int getFormid() {
		return formid;
	}

	public int getQuestid() {
		return questid;
	}

	public String getAnswerselected() {
		return answerselected;
	}

	public void setFill_formid(int fill_formid) {
		this.fill_formid = fill_formid;
	}

	public void setFormid(int formid) {
		this.formid = formid;
	}

	public void setQuestid(int questid) {
		this.questid = questid;
	}

	public void setAnswerselected(String answerselected) {
		this.answerselected = answerselected;
	}

	public String getCreatedby() {
		return createdby;
	}

	public Timestamp getCreatedon() {
		return createdon;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public void setCreatedon(Timestamp createdon) {
		this.createdon = createdon;
	}
	
	
}
