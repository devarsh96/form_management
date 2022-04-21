package com.efive.formmngmt.addeditform;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface FormRepository extends JpaRepository<FormEntity, Integer>{
	
	@Modifying
	@Transactional
	@Query("update FormEntity u set u.active = 5 where u.formid = (:integers)")
	void softDeleteId(Integer integers);
}
