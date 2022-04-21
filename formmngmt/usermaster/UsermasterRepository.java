package com.efive.formmngmt.usermaster;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UsermasterRepository extends JpaRepository<UsermasterEntity, Integer>{
	
	 @Query("select s.email from UsermasterEntity s")
	    List<String> getAllEmail();
	 
	 @Query(value = "select * from user_master s where first_name = (:name) and role = (:role)", nativeQuery = true)
	 	List<UsermasterEntity> getforsearch(String name, Integer role);
	 
	 @Query(value = "select * from user_master s where role = (:role)", nativeQuery = true)
	 	List<UsermasterEntity> getforsearchrole(Integer role);
	 
	 @Query(value = "select * from user_master s where first_name = (:name)", nativeQuery = true)
	 	List<UsermasterEntity> getforsearchname(String name);
}
