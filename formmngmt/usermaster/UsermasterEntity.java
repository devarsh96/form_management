package com.efive.formmngmt.usermaster;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_master")
public class UsermasterEntity {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "firstName")
	private String first_name;
	
	@Column(name = "lastName")
	private String last_name;
	
	@Column(name = "Email")
	private String email;
	
	@Column(name = "Phone_No.")	
	private Long phone;
	
	@Column(name = "Gender")
	private int  gender;
	
	@Column(name = "Role")
	private int roles;
	
	@Column(name = "Valid_From")
	private String valFro;
	
	@Column(name = "Valid_To")
	private String valTo;
	
	@Column(name = "image")
	private String image;
	
	
	public String getimage() {
		return image;
	}
	public void setimage(String image) {
		this.image = image;
	}
	public UsermasterEntity() {
	
	}
	public UsermasterEntity(String first_name, String last_name, String email, Long phone, int gender, int roles,
			String valFro, String valTo) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.roles = roles;
		this.valFro = valFro;
		this.valTo = valTo;
	}
	public int getId() {
		return id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public String getEmail() {
		return email;
	}
	public Long getPhone() {
		return phone;
	}
	public int getGender() {
		return gender;
	}
	public int getRoles() {
		return roles;
	}
	public String getValFro() {
		return valFro;
	}
	public String getValTo() {
		return valTo;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public void setRoles(int roles) {
		this.roles = roles;
	}
	public void setValFro(String valFro) {
		this.valFro = valFro;
	}
	public void setValTo(String valTo) {
		this.valTo = valTo;
	}
}
