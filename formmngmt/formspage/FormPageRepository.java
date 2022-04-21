package com.efive.formmngmt.formspage;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;

import com.efive.formmngmt.addeditform.FormEntity;

public interface FormPageRepository extends JpaRepository<FormEntity, Integer>{

	@Query(value = "select * from form_master where active != 5", nativeQuery = true)
	List<FormEntity> findAllWithoutdel();
}
