package com.efive.formmngmt.usermaster;

import java.util.List;

import com.efive.formmngmt.usermaster.UsermasterEntity;;
public interface UsermasterService {
	
	List<UsermasterEntity> getAllUser();
	
	UsermasterEntity saveUser(UsermasterEntity usermasterentity);
	
	
	UsermasterEntity getUserById(Integer id);
	  
	 /* * UsermasterEntity updateUser(UsermasterEntity usermasterentity);
	 */ 
	void deleteUserById(Integer id);
	
	List<String> getAllemail();
	
	List<UsermasterEntity> getdataonsearch(String name, Integer role);

	List<UsermasterEntity> getdataonsearch1(Integer role);

	List<UsermasterEntity> getdataonsearch2(String name);
	 
}
