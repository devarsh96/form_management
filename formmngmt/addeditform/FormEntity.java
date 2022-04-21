package com.efive.formmngmt.addeditform;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name = "form_master")
public class FormEntity {

	@Id
	@Column
	private int formid;
	
	@Column
	private String titletext;
	
	@Column
	private String aliasname;
	
	@Column
	private String module;
	
	@Column
	private String characteristic;
	
	@Column
	private String subcharacteristic;
	
	@Column
	private String recurrence;
	
	@Column
	private String startmonth;
	
	@Column
	private String complianceperiod;
	
	@Column
	private String effectivedate;
	
	@Column
	private String textarea;
	
	@Column
	private int active;

	public int getFormid() {
		return formid;
	}

	public String getTitletext() {
		return titletext;
	}

	public String getAliasname() {
		return aliasname;
	}

	public String getModule() {
		return module;
	}

	public String getCharacteristic() {
		return characteristic;
	}

	public String getSubcharacteristic() {
		return subcharacteristic;
	}

	public String getRecurrence() {
		return recurrence;
	}

	public String getStartmonth() {
		return startmonth;
	}

	public String getComplianceperiod() {
		return complianceperiod;
	}

	public String getEffectivedate() {
		return effectivedate;
	}

	public String getTextarea() {
		return textarea;
	}

	public int getActive() {
		return active;
	}

	public void setFormid(int formid) {
		this.formid = formid;
	}

	public void setTitletext(String titletext) {
		this.titletext = titletext;
	}

	public void setAliasname(String aliasname) {
		this.aliasname = aliasname;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public void setCharacteristic(String characteristic) {
		this.characteristic = characteristic;
	}

	public void setSubcharacteristic(String subcharacteristic) {
		this.subcharacteristic = subcharacteristic;
	}

	public void setRecurrence(String recurrence) {
		this.recurrence = recurrence;
	}

	public void setStartmonth(String startmonth) {
		this.startmonth = startmonth;
	}

	public void setComplianceperiod(String complianceperiod) {
		this.complianceperiod = complianceperiod;
	}

	public void setEffectivedate(String effectivedate) {
		this.effectivedate = effectivedate;
	}

	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	
	
	
	
}
