package com.efive.formmngmt.usermaster;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsermasterServiceImpl implements UsermasterService {
	@Autowired
	private UsermasterRepository usermasterrepository;

	@Override
	public List<UsermasterEntity> getAllUser() {

		return usermasterrepository.findAll();
	}

	@Override
	public UsermasterEntity saveUser(UsermasterEntity usermasterentity) {
		return usermasterrepository.save(usermasterentity);
	}

	public UsermasterEntity getUserById(Integer id) {

		return usermasterrepository.findById(id).get();
	}

	@Override
	public void deleteUserById(Integer id) {
		
		usermasterrepository.deleteById(id);
	}

	@Override
	public List<String> getAllemail() {
		
		
		return usermasterrepository.getAllEmail();
	}

	@Override
	public List<UsermasterEntity> getdataonsearch(String name, Integer role) {
		
		return usermasterrepository.getforsearch(name, role);
	}

	@Override
	public List<UsermasterEntity> getdataonsearch1(Integer role) {
	
		return usermasterrepository.getforsearchrole(role);
	}

	@Override
	public List<UsermasterEntity> getdataonsearch2(String name) {
	
		return usermasterrepository.getforsearchname(name);
	}
	

}
